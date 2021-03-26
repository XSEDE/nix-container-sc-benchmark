with import <nixpkgs> { };
{ openmpiProdEnv = buildEnv {
  name = "sc-benchmark-prod-env";
  paths = [
    # Always include nix, or environment will break
    # Include bash for base OSes without bash
    nix
    bash
    
    # Dependencies
    
    
    # Benchmark
    
    ];
  };
}

