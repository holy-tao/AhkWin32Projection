#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MXDC_ESCAPE_HEADER_T.ahk
#Include .\MXDC_PRINTTICKET_DATA_T.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_PRINTTICKET_ESCAPE_T extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {MXDC_ESCAPE_HEADER_T}
     */
    mxdcEscape{
        get {
            if(!this.HasProp("__mxdcEscape"))
                this.__mxdcEscape := MXDC_ESCAPE_HEADER_T(0, this)
            return this.__mxdcEscape
        }
    }

    /**
     * @type {MXDC_PRINTTICKET_DATA_T}
     */
    printTicketData{
        get {
            if(!this.HasProp("__printTicketData"))
                this.__printTicketData := MXDC_PRINTTICKET_DATA_T(16, this)
            return this.__printTicketData
        }
    }
}
