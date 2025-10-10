#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MXDC_ESCAPE_HEADER_T.ahk
#Include .\MXDC_S0PAGE_DATA_T.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_S0PAGE_PASSTHROUGH_ESCAPE_T extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {MXDC_ESCAPE_HEADER_T}
     */
    mxdcEscape{
        get {
            if(!this.HasProp("__mxdcEscape"))
                this.__mxdcEscape := MXDC_ESCAPE_HEADER_T(this.ptr + 0)
            return this.__mxdcEscape
        }
    }

    /**
     * @type {MXDC_S0PAGE_DATA_T}
     */
    xpsS0PageData{
        get {
            if(!this.HasProp("__xpsS0PageData"))
                this.__xpsS0PageData := MXDC_S0PAGE_DATA_T(this.ptr + 16)
            return this.__xpsS0PageData
        }
    }
}
