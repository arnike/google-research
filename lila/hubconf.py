dependencies = ["torch", "torchvision"]

from lila.dpt_lila import load_lila_model


def lila(
    encoder="dinov2_vitb14",
    pretrained=False,
    checkpoint_path=None,
    checkpoint_url=None,
    checkpoints_dir=None,
    model_name=None,
    checkpoint_name="best_checkpoint.pt",
    strict=False,
    device=None,
):
    """Load a LILA model from Torch Hub."""
    return load_lila_model(
        encoder_name=encoder,
        pretrained=pretrained,
        checkpoint_path=checkpoint_path,
        checkpoint_url=checkpoint_url,
        checkpoints_dir=checkpoints_dir,
        model_name=model_name,
        checkpoint_name=checkpoint_name,
        strict=strict,
        device=device,
    )


def lila_dinov2_vits14(**kwargs):
    return lila(encoder="dinov2_vits14", **kwargs)


def lila_dinov2_vitb14(**kwargs):
    return lila(encoder="dinov2_vitb14", **kwargs)


def lila_dinov2_vitl14(**kwargs):
    return lila(encoder="dinov2_vitl14", **kwargs)


def lila_dinov2reg_vits14(**kwargs):
    return lila(encoder="dinov2reg_vits14", **kwargs)


def lila_dinov2reg_vitb14(**kwargs):
    return lila(encoder="dinov2reg_vitb14", **kwargs)


def lila_dinov2reg_vitl14(**kwargs):
    return lila(encoder="dinov2reg_vitl14", **kwargs)
