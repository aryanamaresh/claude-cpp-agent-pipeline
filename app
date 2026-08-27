import argparse
import json

from src.pipeline import AgenticCppPipeline


def main() -> None:
    parser = argparse.ArgumentParser(description="Claude SDK C++ generation pipeline")
    parser.add_argument("--spec", required=True, help="Path to YAML specification")
    parser.add_argument(
        "--offline",
        action="store_true",
        help="Use deterministic mapping instead of Claude API",
    )
    args = parser.parse_args()

    pipeline = AgenticCppPipeline(offline=args.offline)
    result = pipeline.run(args.spec)

    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
