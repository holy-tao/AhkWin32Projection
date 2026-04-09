#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\XSAVE_FORMAT.ahk
#Include .\M128A.ahk
#Include .\XSAVE_AREA_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class XSAVE_AREA extends Win32Struct {
    static sizeof => 576

    static packingSize => 8

    /**
     * @type {XSAVE_FORMAT}
     */
    LegacyState {
        get {
            if(!this.HasProp("__LegacyState"))
                this.__LegacyState := XSAVE_FORMAT(0, this)
            return this.__LegacyState
        }
    }

    /**
     * @type {XSAVE_AREA_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := XSAVE_AREA_HEADER(512, this)
            return this.__Header
        }
    }
}
