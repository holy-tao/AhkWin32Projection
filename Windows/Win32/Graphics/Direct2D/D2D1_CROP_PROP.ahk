#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Crop effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_crop_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_CROP_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The region to be cropped specified as a vector in the form (left, top, width, height). Units are in DIPs.
     *             
     * 
     * <div class="alert"><b>Note</b>  The rectangle will be truncated if it overlaps the edge boundaries of the input image.</div>
     * <div> </div>
     * Type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_4f">D2D1_VECTOR_4F</a>
     * 
     * 
     * Default value is {-FLT_MAX, -FLT_MAX, FLT_MAX, FLT_MAX}
     * @type {Integer (Int32)}
     */
    static D2D1_CROP_PROP_RECT => 0

    /**
     * Indicates how the effect handles the crop rectangle falling on fractional pixel coordinates.
     *           
     * 
     * Type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_border_mode">D2D1_BORDER_MODE</a>.
     * 
     * Default value is D2D1_BORDER_MODE_SOFT.
     * @type {Integer (Int32)}
     */
    static D2D1_CROP_PROP_BORDER_MODE => 1
}
