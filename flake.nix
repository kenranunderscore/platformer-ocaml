{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      opkgs = pkgs.ocaml-ng.ocamlPackages_5_1;
    in {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = [
          # development
          opkgs.merlin
          opkgs.ocaml
          opkgs.ocaml-lsp
          opkgs.ocamlformat
          opkgs.utop
          pkgs.dune_3
          pkgs.opam

          # libraries
          opkgs.tsdl
          opkgs.tsdl-image
        ];
      };
    };
}
