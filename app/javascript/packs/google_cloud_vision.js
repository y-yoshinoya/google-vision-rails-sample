class GoogleCloudVisionUtils {
  static renderCanvas(canvasId, imageUrl, annotations, lineWidth = 3, lineColor = "rgb(0, 0, 255)") {
    const canvas = document.getElementById(canvasId);
    const ctx = canvas.getContext("2d");
    const img = new Image();
    img.src = imageUrl;
    const scale = canvas.width / img.width;
    canvas.height = img.height * scale;
    img.onload = () => {
      ctx.scale(scale, scale);
      ctx.drawImage(img, 0, 0);
      ctx.lineWidth = lineWidth;
      ctx.strokeStyle = lineColor;
      this.renderRect(ctx, annotations);
    };
  }

  static renderRect(ctx, annotations) {
    $(annotations).each((i, annotation) => {
      if (i == 0) {
        return true;
      }
      ctx.beginPath();
      $(annotation.boundingPoly.vertices).each((j, vertice) => {
        if (j == 0) {
          ctx.moveTo(vertice.x, vertice.y);
        } else {
          ctx.lineTo(vertice.x, vertice.y);
        }
      });
      ctx.closePath();
      ctx.stroke();
    });
  }
}

export default GoogleCloudVisionUtils;
