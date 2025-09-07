#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\M128A.ahk
#Include .\XSAVE_FORMAT.ahk
#Include .\XSAVE_AREA_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class XSAVE_AREA extends Win32Struct
{
    static sizeof => 384

    static packingSize => 8

    /**
     * @type {XSAVE_FORMAT}
     */
    LegacyState{
        get {
            if(!this.HasProp("__LegacyState"))
                this.__LegacyState := XSAVE_FORMAT(this.ptr + 0)
            return this.__LegacyState
        }
    }

    /**
     * @type {XSAVE_AREA_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := XSAVE_AREA_HEADER(this.ptr + 320)
            return this.__Header
        }
    }
}
