#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSDATAFORMAT.ahk
#Include .\BDA_TRANSPORT_INFO.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KS_DATARANGE_BDA_TRANSPORT extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataRange{
        get {
            if(!this.HasProp("__DataRange"))
                this.__DataRange := KSDATAFORMAT(this.ptr + 0)
            return this.__DataRange
        }
    }

    /**
     * @type {BDA_TRANSPORT_INFO}
     */
    BdaTransportInfo{
        get {
            if(!this.HasProp("__BdaTransportInfo"))
                this.__BdaTransportInfo := BDA_TRANSPORT_INFO(this.ptr + 48)
            return this.__BdaTransportInfo
        }
    }
}
