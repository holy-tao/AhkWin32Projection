#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VMR9NormalizedRect.ahk

/**
 * The VMR9VideoStreamInfo structure describes the rendering parameters for a video compositing operation in the VRM-9 filter. This structure is used in the IVMRImageCompositor9::CompositeImage method.
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ns-vmr9-vmr9videostreaminfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9VideoStreamInfo extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface of the Direct3D surface that contains the video to be composited.
     * @type {IDirect3DSurface9}
     */
    pddsVideoSurface {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The width of the video rectangle.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The height of the video rectangle.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the input stream. This value corresponds to the input pin.
     * @type {Integer}
     */
    dwStrmID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The alpha value for this stream. (Not per-pixel alpha.)
     * @type {Float}
     */
    fAlpha {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * The position of the image in composition space, as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9normalizedrect">VMR9NormalizedRect</a> structure.
     * @type {VMR9NormalizedRect}
     */
    rNormal{
        get {
            if(!this.HasProp("__rNormal"))
                this.__rNormal := VMR9NormalizedRect(24, this)
            return this.__rNormal
        }
    }

    /**
     * The start time of the video frame, in 100-nanosecond units.
     * @type {Integer}
     */
    rtStart {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * The end time of the video frame, in 100-nanosecond units.
     * @type {Integer}
     */
    rtEnd {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * The video interlacing format, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9_sampleformat">VMR9_SampleFormat</a> enumeration type.
     * @type {Integer}
     */
    SampleFormat {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
