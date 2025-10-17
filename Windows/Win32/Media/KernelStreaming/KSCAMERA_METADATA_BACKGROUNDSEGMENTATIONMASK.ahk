#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSCAMERA_METADATA_ITEMHEADER.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_METADATA_BACKGROUNDSEGMENTATIONMASK extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {KSCAMERA_METADATA_ITEMHEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := KSCAMERA_METADATA_ITEMHEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {RECT}
     */
    MaskCoverageBoundingBox{
        get {
            if(!this.HasProp("__MaskCoverageBoundingBox"))
                this.__MaskCoverageBoundingBox := RECT(8, this)
            return this.__MaskCoverageBoundingBox
        }
    }

    /**
     * @type {SIZE}
     */
    MaskResolution{
        get {
            if(!this.HasProp("__MaskResolution"))
                this.__MaskResolution := SIZE(24, this)
            return this.__MaskResolution
        }
    }

    /**
     * @type {RECT}
     */
    ForegroundBoundingBox{
        get {
            if(!this.HasProp("__ForegroundBoundingBox"))
                this.__ForegroundBoundingBox := RECT(32, this)
            return this.__ForegroundBoundingBox
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MaskData{
        get {
            if(!this.HasProp("__MaskDataProxyArray"))
                this.__MaskDataProxyArray := Win32FixedArray(this.ptr + 48, 1, Primitive, "char")
            return this.__MaskDataProxyArray
        }
    }
}
