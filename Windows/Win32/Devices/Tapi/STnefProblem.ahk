#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a property or attribute processing problem that occurred during the encoding or decoding of a TNEF stream.
 * @remarks
 * If an **STnefProblem** structure is not generated during the processing of an attribute or property, the application can continue under the assumption that the processing of that attribute or property succeeded. The only exception occurs when the problem arose during decoding of an encapsulation block. In this case, the decoding of the component corresponding to the block is stopped and decoding is continued in another component.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/stnefproblem
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class STnefProblem extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * > The type of processing during which the problem occurred. If the problem occurred during message processing, the **ulComponent** member is set to zero. If the problem occurred during attachment processing, **ulComponent** is set equal to the corresponding attachment's **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) value.
     * @type {Integer}
     */
    ulComponent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Attribute associated with the property indicated by the **ulPropTag** member or, when the TNEF processing problem occurs when decoding an encapsulation block, one of the following values:
     * @type {Integer}
     */
    ulAttribute {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Property tag of the property that caused the TNEF processing problem, except when the problem occurs when decoding an encapsulation block, in which case **ulPropTag** is set to zero.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * > Error value indicating the problem encountered during processing.
     * @type {Integer}
     */
    scode {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
