# %%
import pandas as pd

results=pd.read_csv('results.tsv', sep='\t')

processed=results.groupby(by=['task', 'type','nMachines'])[['duration', 'throughput']].median().reset_index()

kmeans=processed[processed['task']=='kmeans']
pagerank=processed[processed['task']=='pagerank']

import seaborn as sns
import matplotlib.pyplot as plt

sns.set_theme(style="whitegrid")
plt.rcParams["axes.labelsize"] = 12
plt.rcParams["legend.title_fontsize"]=12
plt.rcParams["figure.figsize"]=[12, 8]
plt.rcParams['legend.fontsize']='large'

#kmeans
g_kmeans=sns.catplot(
  data=kmeans, kind="bar",
  x="nMachines", y="duration", hue="type",
  ci="sd", palette="dark", alpha=.6, height=6, aspect=0.8
)

g_kmeans.set_axis_labels("Number of machines", "Response time (s)")
ax=plt.gca()
for p in ax.patches:
  ax.text(p.get_x() + p.get_width()/2., p.get_height(), '%d' % int(p.get_height()),
          fontsize=12, color='black', ha='center', va='bottom')
plt.savefig('kmeans.pdf')
plt.show()

#pagerank
pagerank['throughput']=pagerank['throughput']/(2**10)
g_pr=sns.catplot(
  data=pagerank, kind="bar",
  x="nMachines", y="throughput", hue="type",
  ci="sd", palette="dark", alpha=.6, height=6, aspect=.8
)

ax=plt.gca()
for p in ax.patches:
  ax.text(p.get_x() + p.get_width()/2., p.get_height(), '%d' % int(p.get_height()),
          fontsize=12, color='black', ha='center', va='bottom')

g_pr.set_axis_labels("Number of machines", "Throughput (KB/s)")
plt.savefig('pagerank.pdf')
plt.show()





# %%
