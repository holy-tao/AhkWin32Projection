#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSDATAFORMAT.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KS_DATARANGE_BDA_ANTENNA extends Win32Struct
{
    static sizeof => 48

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
}
