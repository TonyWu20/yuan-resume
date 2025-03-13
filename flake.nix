{
  description = "Nix devshell to compile yuan-resume";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      tex = (pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-small
          titlesec
          enumitem
          # tabularx
          ragged2e
          ;
      });
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          packages = with pkgs; [
            fish
            tex
          ];

          shellHook = ''
            		  exec fish
            		  '';
        };
      };
    };
}
