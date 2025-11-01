#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STnefProblem.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/stnefproblemarray
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class STnefProblemArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cProblem {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<STnefProblem>}
     */
    aProblem{
        get {
            if(!this.HasProp("__aProblemProxyArray"))
                this.__aProblemProxyArray := Win32FixedArray(this.ptr + 8, 1, STnefProblem, "")
            return this.__aProblemProxyArray
        }
    }
}
