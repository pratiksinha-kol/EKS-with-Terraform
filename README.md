# EKS Cluster using Terraform

Ensure that **`Terraform`**, **`kubectl`**, and **`AWS CLI`** are installed on your system.

## Step-by-Step Instructions

1. **Initialize Terraform and Apply Configuration**:
    Open your terminal and run the following commands sequentially:
    ```sh
    terraform init
    terraform fmt
    terraform plan
    terraform apply --auto-approve
    ```

2. **Get the Cluster Name**:
    After the cluster is created, retrieve the "Cluster Name" from the output or by running:
    ```sh
    terraform output
    ```

3. **Verify Kubeconfig Update**:
    Ensure your Kubeconfig file is updated:
    ```sh
    kubectl get nodes
    kubectl get pods
    ```

4. **Update Kubeconfig with Cluster Name**:
    Using the cluster name (in this example, `eks-cluster`), update the Kubeconfig file:
    ```sh
    aws eks --region ap-south-2 update-kubeconfig --name eks-cluster
    ```

5. **Verify the Update**:
    Confirm the Kubeconfig file is updated:
    ```sh
    kubectl get nodes
    kubectl get pods -A
    ```
5. **Deleting the EKS Cluster**:
    To delete the existing Cluster, use the following command that ensures that all terraform created resources are closed: 
    ```sh
    terraform destroy --auto-approve
    ```    

_Additionally, if you want to create **[RBAC](RBAC/)** policies, you can check the given hyperlink out._

---

All set! If you need any more help or additional tweaks, just let me know.
