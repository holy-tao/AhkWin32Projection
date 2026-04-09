#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WER_REPORT_PARAMETER.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_REPORT_SIGNATURE extends Win32Struct {
    static sizeof => 7910

    static packingSize => 2

    /**
     * @type {String}
     */
    EventName {
        get => StrGet(this.ptr + 0, 64, "UTF-16")
        set => StrPut(value, this.ptr + 0, 64, "UTF-16")
    }

    /**
     * @type {WER_REPORT_PARAMETER}
     */
    Parameters {
        get {
            if(!this.HasProp("__ParametersProxyArray"))
                this.__ParametersProxyArray := Win32FixedArray(this.ptr + 130, 10, WER_REPORT_PARAMETER, "")
            return this.__ParametersProxyArray
        }
    }
}
