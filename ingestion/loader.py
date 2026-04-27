from ucimlrepo import fetch_ucirepo
import pandas as pd

def load_wesad() -> tuple[pd.DataFrame, pd.DataFrame]:
    """Load WESAD dataset and return features and labels"""
    wesad = fetch_ucirepo(id=465)
    print(wesad.data)
    
    X = wesad.data.features
    y = wesad.data.targets

    print(f"Loaded {len(X)} samplse, {X.shape[1]} features")
    print(f"Label distribution:\n{y.value_counts()}")

    return X,y