#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STnefProblem.ahk

/**
 * Contains an array of STnefProblem structures describing one or more processing problems that occurred during the encoding or decoding of a TNEF stream.
 * @remarks
 * If a problem occurs during attribute or property processing, an output parameter in the [ITnef::ExtractProps](itnef-extractprops.md) method and in the [ITnef::Finish](itnef-finish.md) method each receive a pointer to an **STnefProblemArray** structure and **ExtractProps** and **Finish** each return the value MAPI_W_ERRORS_RETURNED. This error value indicates that a problem arose during processing and an **STnefProblemArray** structure was generated. 
  *   
  * If an **STnefProblem** structure is not generated during the processing of an attribute or property, the client application can continue under the assumption that the processing of that attribute or property succeeded. The only exception occurs when the problem arose during decoding of an encapsulation block. If the error occurred during this decoding, MAPI_E_UNABLE_TO_COMPLETE can be returned as the [SCODE](scode.md) in the structure. In this case, the decoding of the component corresponding to the block is stopped and decoding is continued in another component.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/stnefproblemarray
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class STnefProblemArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of elements in the array specified in the **aProblem** member.
     * @type {Integer}
     */
    cProblem {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Array of [STnefProblem](stnefproblem.md) structures. Each structure contains information about a property or attribute processing problem.
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
