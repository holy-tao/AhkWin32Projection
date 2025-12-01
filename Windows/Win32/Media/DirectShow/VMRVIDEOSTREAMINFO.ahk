#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\DirectDraw\DDCOLORKEY.ahk
#Include .\NORMALIZEDRECT.ahk

/**
 * This topic applies to Windows XP or later. The VMRVIDEOSTREAMINFO structure is used in the VMR-7 filter's call to IVMRImageCompositor::CompositeImage on the image compositor.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrvideostreaminfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRVIDEOSTREAMINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies the DirectDraw surface that contains the video to be composited.
     * @type {IDirectDrawSurface7}
     */
    pddsVideoSurface {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the width of the video rectangle.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the height of the video rectangle.
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
     * Specifies the alpha value for this stream. (Not per-pixel alpha.)
     * @type {Float}
     */
    fAlpha {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Specifies the source color key value or -1 if color keying is not to be used for this stream.
     * @type {DDCOLORKEY}
     */
    ddClrKey{
        get {
            if(!this.HasProp("__ddClrKey"))
                this.__ddClrKey := DDCOLORKEY(24, this)
            return this.__ddClrKey
        }
    }

    /**
     * Specifies the position of the image in composition space.
     * @type {NORMALIZEDRECT}
     */
    rNormal{
        get {
            if(!this.HasProp("__rNormal"))
                this.__rNormal := NORMALIZEDRECT(32, this)
            return this.__rNormal
        }
    }
}
