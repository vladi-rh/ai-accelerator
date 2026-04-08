```
# Data Science Pipelines
oc delete datasciencepipelinesapplications.datasciencepipelinesapplications.opendatahub.io -A --all --ignore-not-found
oc delete datasciencepipelines.components.platform.opendatahub.io -A --all --ignore-not-found

# Argo Workflows
oc delete clusterworkflowtemplates.argoproj.io -A --all --ignore-not-found
oc delete cronworkflows.argoproj.io -A --all --ignore-not-found
oc delete workflowartifactgctasks.argoproj.io -A --all --ignore-not-found
oc delete workfloweventbindings.argoproj.io -A --all --ignore-not-found
oc delete workflows.argoproj.io -A --all --ignore-not-found
oc delete workflowtaskresults.argoproj.io -A --all --ignore-not-found
oc delete workflowtasksets.argoproj.io -A --all --ignore-not-found
oc delete workflowtemplates.argoproj.io -A --all --ignore-not-found

# KServe
oc delete inferenceservices.serving.kserve.io -A --all --ignore-not-found
oc delete servingruntimes.serving.kserve.io -A --all --ignore-not-found
oc delete clusterstoragecontainers.serving.kserve.io -A --all --ignore-not-found
oc delete inferencegraphs.serving.kserve.io -A --all --ignore-not-found
oc delete predictors.serving.kserve.io -A --all --ignore-not-found
oc delete trainedmodels.serving.kserve.io -A --all --ignore-not-found


# LLM-D
oc delete llminferenceserviceconfigs.serving.kserve.io -A --all --ignore-not-found
oc delete llminferenceservices.serving.kserve.io -A --all --ignore-not-found
oc delete inferencemodels.inference.networking.x-k8s.io -A --all --ignore-not-found
oc delete inferencepools.inference.networking.x-k8s.io -A --all --ignore-not-found

# Kueue
oc delete admissionchecks.kueue.x-k8s.io -A --all --ignore-not-found
oc delete clusterqueues.kueue.x-k8s.io -A --all --ignore-not-found
oc delete cohorts.kueue.x-k8s.io -A --all --ignore-not-found
oc delete localqueues.kueue.x-k8s.io -A --all --ignore-not-found
oc delete multikueueclusters.kueue.x-k8s.io -A --all --ignore-not-found
oc delete multikueueconfigs.kueue.x-k8s.io -A --all --ignore-not-found
oc delete provisioningrequestconfigs.kueue.x-k8s.io -A --all --ignore-not-found
oc delete resourceflavors.kueue.x-k8s.io -A --all --ignore-not-found
oc delete topologies.kueue.x-k8s.io -A --all --ignore-not-found
oc delete workloadpriorityclasses.kueue.x-k8s.io -A --all --ignore-not-found
oc delete workloads.kueue.x-k8s.io -A --all --ignore-not-found

# Workbenches 
oc delete notebooks.kubeflow.org -A --all --ignore-not-found
# NOTE: Notebooks generally have a PVC associated with it that may need to be deleted as well

# Kubeflow Training Operator
oc delete jaxjobs.kubeflow.org -A --all --ignore-not-found
oc delete mpijobs.kubeflow.org -A --all --ignore-not-found
oc delete mxjobs.kubeflow.org -A --all --ignore-not-found
oc delete paddlejobs.kubeflow.org -A --all --ignore-not-found
oc delete pipelines.pipelines.kubeflow.org -A --all --ignore-not-found
oc delete pipelineversions.pipelines.kubeflow.org -A --all --ignore-not-found
oc delete pytorchjobs.kubeflow.org -A --all --ignore-not-found
oc delete scheduledworkflows.kubeflow.org -A --all --ignore-not-found
oc delete tfjobs.kubeflow.org -A --all --ignore-not-found
oc delete xgboostjobs.kubeflow.org -A --all --ignore-not-found
oc delete viewers.kubeflow.org -A --all --ignore-not-found


# TrustyAI
oc delete guardrailsorchestrators.trustyai.opendatahub.io -A --all --ignore-not-found
oc delete lmevaljobs.trustyai.opendatahub.io -A --all --ignore-not-found
oc delete trustyais.components.platform.opendatahub.io -A --all --ignore-not-found
oc delete trustyaiservices.trustyai.opendatahub.io -A --all --ignore-not-found

# Ray
oc delete rayclusters.ray.io -A --all --ignore-not-found
oc delete rayjobs.ray.io -A --all --ignore-not-found
oc delete rays.components.platform.opendatahub.io -A --all --ignore-not-found
oc delete rayservices.ray.io -A --all --ignore-not-found

# CodeFlare / App Wrappers
oc delete appwrappers.workload.codeflare.dev -A --all --ignore-not-found
oc delete codeflares.components.platform.opendatahub.io -A --all --ignore-not-found

# Feast
oc delete feastoperators.components.platform.opendatahub.io -A --all --ignore-not-found
oc delete featurestores.feast.dev -A --all --ignore-not-found

# LlamaStack
oc delete llamastackdistributions.llamastack.io -A --all --ignore-not-found
oc delete llamastackoperators.components.platform.opendatahub.io -A --all --ignore-not-found

# Model registry / controllers
oc delete modelcontrollers.components.platform.opendatahub.io -A --all --ignore-not-found
oc delete modelmeshservings.components.platform.opendatahub.io -A --all --ignore-not-found
oc delete modelregistries.components.platform.opendatahub.io -A --all --ignore-not-found
oc delete modelregistries.modelregistry.opendatahub.io -A --all --ignore-not-found
oc delete trainingoperators.components.platform.opendatahub.io -A --all --ignore-not-found

# RHOAI / ODH platform components
oc delete accounts.nim.opendatahub.io -A --all --ignore-not-found
oc delete applications.app.k8s.io -A --all --ignore-not-found
oc delete auths.services.platform.opendatahub.io -A --all --ignore-not-found
oc delete dashboards.components.platform.opendatahub.io -A --all --ignore-not-found
oc delete kserves.components.platform.opendatahub.io -A --all --ignore-not-found
oc delete kueues.components.platform.opendatahub.io -A --all --ignore-not-found
oc delete monitorings.services.platform.opendatahub.io -A --all --ignore-not-found
oc delete servicemeshes.services.platform.opendatahub.io -A --all --ignore-not-found
oc delete workbenches.components.platform.opendatahub.io -A --all --ignore-not-found

# RHOAI Core
oc delete datascienceclusters.datasciencecluster.opendatahub.io -A --all --ignore-not-found
oc delete dscinitializations.dscinitialization.opendatahub.io -A --all --ignore-not-found
oc delete featuretrackers.features.opendatahub.io -A --all --ignore-not-found
oc delete acceleratorprofiles.dashboard.opendatahub.io -A --all --ignore-not-found
oc delete hardwareprofiles.dashboard.opendatahub.io -A --all --ignore-not-found
oc delete hardwareprofiles.infrastructure.opendatahub.io -A --all --ignore-not-found
oc delete odhapplications.dashboard.opendatahub.io -A --all --ignore-not-found
oc delete odhdashboardconfigs.opendatahub.io -A --all --ignore-not-found
oc delete odhdocuments.dashboard.opendatahub.io -A --all --ignore-not-found
oc delete odhquickstarts.console.openshift.io -A --all --ignore-not-found
```

Subscription Cleanup
```
oc delete subscription rhods-operator -n redhat-ods-operator
oc delete operatorgroup --all -n redhat-ods-operator
oc delete clusterserviceversion --all -n redhat-ods-operator
oc delete installplan --all -n redhat-ods-operator
```

```
# data science pipelines
oc delete crd datasciencepipelinesapplications.datasciencepipelinesapplications.opendatahub.io
oc delete crd datasciencepipelines.components.platform.opendatahub.io

# argo workflows
oc delete crd \
  clusterworkflowtemplates.argoproj.io \
  cronworkflows.argoproj.io \
  workflowartifactgctasks.argoproj.io \
  workfloweventbindings.argoproj.io \
  workflows.argoproj.io \
  workflowtaskresults.argoproj.io \
  workflowtasksets.argoproj.io \
  workflowtemplates.argoproj.io

# kserve
oc delete crd \
  clusterstoragecontainers.serving.kserve.io \
  inferencegraphs.serving.kserve.io \
  inferenceservices.serving.kserve.io \
  llminferenceserviceconfigs.serving.kserve.io \
  llminferenceservices.serving.kserve.io \
  predictors.serving.kserve.io \
  servingruntimes.serving.kserve.io \
  trainedmodels.serving.kserve.io

# inference (networking)
oc delete crd inferencemodels.inference.networking.x-k8s.io
oc delete crd inferencepools.inference.networking.x-k8s.io

# kueue
oc delete crd \
  admissionchecks.kueue.x-k8s.io \
  clusterqueues.kueue.x-k8s.io \
  cohorts.kueue.x-k8s.io \
  localqueues.kueue.x-k8s.io \
  multikueueclusters.kueue.x-k8s.io \
  multikueueconfigs.kueue.x-k8s.io \
  provisioningrequestconfigs.kueue.x-k8s.io \
  resourceflavors.kueue.x-k8s.io \
  topologies.kueue.x-k8s.io \
  workloadpriorityclasses.kueue.x-k8s.io \
  workloads.kueue.x-k8s.io

# workbenches / kubeflow
oc delete crd notebooks.kubeflow.org
oc delete crd viewers.kubeflow.org

# kubeflow training operator
oc delete crd \
  jaxjobs.kubeflow.org \
  mpijobs.kubeflow.org \
  mxjobs.kubeflow.org \
  paddlejobs.kubeflow.org \
  pipelines.pipelines.kubeflow.org \
  pipelineversions.pipelines.kubeflow.org \
  pytorchjobs.kubeflow.org \
  scheduledworkflows.kubeflow.org \
  tfjobs.kubeflow.org \
  xgboostjobs.kubeflow.org

# trustyai
oc delete crd \
  guardrailsorchestrators.trustyai.opendatahub.io \
  lmevaljobs.trustyai.opendatahub.io \
  trustyaiservices.trustyai.opendatahub.io

# ray
oc delete crd \
  rayclusters.ray.io \
  rayjobs.ray.io \
  rayservices.ray.io

# codeflare
oc delete crd appwrappers.workload.codeflare.dev

# feast
oc delete crd feastoperators.components.platform.opendatahub.io
oc delete crd featurestores.feast.dev

# llamastack
oc delete crd llamastackdistributions.llamastack.io

# RHOAI / ODH platform components
oc delete crd \
  accounts.nim.opendatahub.io \
  applications.app.k8s.io \
  auths.services.platform.opendatahub.io \
  codeflares.components.platform.opendatahub.io \
  dashboards.components.platform.opendatahub.io \
  kserves.components.platform.opendatahub.io \
  kueues.components.platform.opendatahub.io \
  llamastackoperators.components.platform.opendatahub.io \
  modelcontrollers.components.platform.opendatahub.io \
  modelmeshservings.components.platform.opendatahub.io \
  modelregistries.components.platform.opendatahub.io \
  modelregistries.modelregistry.opendatahub.io \
  monitorings.services.platform.opendatahub.io \
  rays.components.platform.opendatahub.io \
  servicemeshes.services.platform.opendatahub.io \
  trainingoperators.components.platform.opendatahub.io \
  trustyais.components.platform.opendatahub.io \
  workbenches.components.platform.opendatahub.io

# RHOAI core
oc delete crd \
  datascienceclusters.datasciencecluster.opendatahub.io \
  dscinitializations.dscinitialization.opendatahub.io \
  featuretrackers.features.opendatahub.io \
  acceleratorprofiles.dashboard.opendatahub.io \
  hardwareprofiles.dashboard.opendatahub.io \
  hardwareprofiles.infrastructure.opendatahub.io \
  odhapplications.dashboard.opendatahub.io \
  odhdashboardconfigs.opendatahub.io \
  odhdocuments.dashboard.opendatahub.io \
  odhquickstarts.console.openshift.io
```


NS cleanup
```
oc delete project redhat-ods-applications
oc delete project redhat-ods-monitoring
oc delete project redhat-ods-operator
oc delete project rhods-notebooks
```
