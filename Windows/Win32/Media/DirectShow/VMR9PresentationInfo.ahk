#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The VMR9PresentationInfo structure is used with the VMR-9 in the IVMRImagePresenter9::PresentImage method.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9presentationinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9PresentationInfo extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Contains a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9presentationflags">VMR9PresentationFlags</a> enumeration type. These flags describe the status of the video sample with respect to its presentation time.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the DirectDraw surface that contains the video frame.
     * @type {Pointer<IDirect3DSurface9>}
     */
    lpSurf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the start time for the video frame.
     * @type {Integer}
     */
    rtStart {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Specifies the end time for the video frame
     * @type {Integer}
     */
    rtEnd {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Specifies the aspect ratio of the video, as a <b>SIZE</b> structure.
     * @type {SIZE}
     */
    szAspectRatio{
        get {
            if(!this.HasProp("__szAspectRatio"))
                this.__szAspectRatio := SIZE(this.ptr + 32)
            return this.__szAspectRatio
        }
    }

    /**
     * Specifies the source rectangle.
     * @type {RECT}
     */
    rcSrc{
        get {
            if(!this.HasProp("__rcSrc"))
                this.__rcSrc := RECT(this.ptr + 40)
            return this.__rcSrc
        }
    }

    /**
     * Specifies the destination rectangle.
     * @type {RECT}
     */
    rcDst{
        get {
            if(!this.HasProp("__rcDst"))
                this.__rcDst := RECT(this.ptr + 56)
            return this.__rcDst
        }
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}
