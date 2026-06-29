#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a property or attribute processing problem that occurred during the encoding or decoding of a TNEF stream.
 * @remarks
 * If an **STnefProblem** structure is not generated during the processing of an attribute or property, the application can continue under the assumption that the processing of that attribute or property succeeded. The only exception occurs when the problem arose during decoding of an encapsulation block. In this case, the decoding of the component corresponding to the block is stopped and decoding is continued in another component.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/stnefproblem
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct STnefProblem {
    #StructPack 4

    /**
     * > The type of processing during which the problem occurred. If the problem occurred during message processing, the **ulComponent** member is set to zero. If the problem occurred during attachment processing, **ulComponent** is set equal to the corresponding attachment's **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) value.
     */
    ulComponent : UInt32

    /**
     * > Attribute associated with the property indicated by the **ulPropTag** member or, when the TNEF processing problem occurs when decoding an encapsulation block, one of the following values:
     */
    ulAttribute : UInt32

    /**
     * > Property tag of the property that caused the TNEF processing problem, except when the problem occurs when decoding an encapsulation block, in which case **ulPropTag** is set to zero.
     */
    ulPropTag : UInt32

    /**
     * > Error value indicating the problem encountered during processing.
     */
    scode : Int32

}
