#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STnefProblem.ahk" { STnefProblem }

/**
 * Contains an array of STnefProblem structures describing one or more processing problems that occurred during the encoding or decoding of a TNEF stream.
 * @remarks
 * If a problem occurs during attribute or property processing, an output parameter in the [ITnef::ExtractProps](itnef-extractprops.md) method and in the [ITnef::Finish](itnef-finish.md) method each receive a pointer to an **STnefProblemArray** structure and **ExtractProps** and **Finish** each return the value MAPI_W_ERRORS_RETURNED. This error value indicates that a problem arose during processing and an **STnefProblemArray** structure was generated. 
 *   
 * If an **STnefProblem** structure is not generated during the processing of an attribute or property, the client application can continue under the assumption that the processing of that attribute or property succeeded. The only exception occurs when the problem arose during decoding of an encapsulation block. If the error occurred during this decoding, MAPI_E_UNABLE_TO_COMPLETE can be returned as the [SCODE](scode.md) in the structure. In this case, the decoding of the component corresponding to the block is stopped and decoding is continued in another component.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/stnefproblemarray
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct STnefProblemArray {
    #StructPack 4

    /**
     * > Count of elements in the array specified in the **aProblem** member.
     */
    cProblem : UInt32

    /**
     * > Array of [STnefProblem](stnefproblem.md) structures. Each structure contains information about a property or attribute processing problem.
     */
    aProblem : STnefProblem[1]

}
