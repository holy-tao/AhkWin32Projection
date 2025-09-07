#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the chroma subsampling of the input chroma image used by the YCbCr effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_1/ne-d2d1effects_1-d2d1_ycbcr_chroma_subsampling
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_YCBCR_CHROMA_SUBSAMPLING{

    /**
     * This mode attempts to infer the chroma subsampling from the bounds of the input images. When this option is selected, 
 *           the smaller plane is upsampled to the size of the larger plane and this effect’s output rectangle is the intersection of the two planes. 
 *           When using this mode, care should be taken when applying effects to the input planes that change the image bounds, such as the border transform, 
 *           so that the desired size ratio between the planes is maintained.
     * @type {Integer (Int32)}
     */
    static D2D1_YCBCR_CHROMA_SUBSAMPLING_AUTO => 0

    /**
     * The chroma plane is horizontally subsampled by 1/2 and vertically subsampled by 1/2. 
 *           When this option is selected, the chroma plane is horizontally and vertically upsampled by 2x and this effect's output rectangle is the intersection of the two planes.
     * @type {Integer (Int32)}
     */
    static D2D1_YCBCR_CHROMA_SUBSAMPLING_420 => 1

    /**
     * The chroma plane is horizontally subsampled by 1/2. When this option is selected, 
 *           the chroma plane is horizontally upsampled by 2x and this effect's output rectangle is the intersection of the two planes.
     * @type {Integer (Int32)}
     */
    static D2D1_YCBCR_CHROMA_SUBSAMPLING_422 => 2

    /**
     * The chroma plane is not subsampled. When this option is selected this effect’s output rectangle is the intersection of the two planes.
     * @type {Integer (Int32)}
     */
    static D2D1_YCBCR_CHROMA_SUBSAMPLING_444 => 3

    /**
     * The chroma plane is vertically subsampled by 1/2. When this option is selected, the chroma plane is vertically upsampled by 2x and this effect's 
 *           output rectangle is the intersection of the two planes.
     * @type {Integer (Int32)}
     */
    static D2D1_YCBCR_CHROMA_SUBSAMPLING_440 => 4
}
