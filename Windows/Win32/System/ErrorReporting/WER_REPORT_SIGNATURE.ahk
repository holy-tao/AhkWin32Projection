#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WER_REPORT_PARAMETER.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_REPORT_SIGNATURE extends Win32Struct
{
    static sizeof => 216

    static packingSize => 8

    /**
     * @type {String}
     */
    EventName {
        get => StrGet(this.ptr + 0, 64, "UTF-16")
        set => StrPut(value, this.ptr + 0, 64, "UTF-16")
    }

    /**
     * @type {Array<WER_REPORT_PARAMETER>}
     */
    Parameters{
        get {
            if(!this.HasProp("__ParametersProxyArray"))
                this.__ParametersProxyArray := Win32FixedArray(this.ptr + 136, 10, WER_REPORT_PARAMETER, "")
            return this.__ParametersProxyArray
        }
    }
}
