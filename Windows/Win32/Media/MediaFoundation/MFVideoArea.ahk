#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFOffset.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * Specifies a rectangular area within a video frame.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ns-mfobjects-mfvideoarea
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoArea extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfoffset">MFOffset</a> structure that contains the x-coordinate of the upper-left corner of the rectangle. This coordinate might have a fractional value.
     * @type {MFOffset}
     */
    OffsetX{
        get {
            if(!this.HasProp("__OffsetX"))
                this.__OffsetX := MFOffset(this.ptr + 0)
            return this.__OffsetX
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfoffset">MFOffset</a> structure that contains the y-coordinate of the upper-left corner of the rectangle. This coordinate might have a fractional value.
     * @type {MFOffset}
     */
    OffsetY{
        get {
            if(!this.HasProp("__OffsetY"))
                this.__OffsetY := MFOffset(this.ptr + 4)
            return this.__OffsetY
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that contains the width and height of the rectangle.
     * @type {SIZE}
     */
    Area{
        get {
            if(!this.HasProp("__Area"))
                this.__Area := SIZE(this.ptr + 8)
            return this.__Area
        }
    }
}
