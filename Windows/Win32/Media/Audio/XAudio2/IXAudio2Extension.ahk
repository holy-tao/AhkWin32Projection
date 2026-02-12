#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2Extension extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXAudio2Extension
     * @type {Guid}
     */
    static IID => Guid("{84ac29bb-d619-44d2-b197-e4acf7df3ed6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProcessingQuantum", "GetProcessor"]

    /**
     * 
     * @param {Pointer<Integer>} quantumNumerator 
     * @param {Pointer<Integer>} quantumDenominator 
     * @returns {String} Nothing - always returns an empty string
     */
    GetProcessingQuantum(quantumNumerator, quantumDenominator) {
        quantumNumeratorMarshal := quantumNumerator is VarRef ? "uint*" : "ptr"
        quantumDenominatorMarshal := quantumDenominator is VarRef ? "uint*" : "ptr"

        ComCall(3, this, quantumNumeratorMarshal, quantumNumerator, quantumDenominatorMarshal, quantumDenominator)
    }

    /**
     * Retrieves the cycle time each processor in the specified processor group spent executing deferred procedure calls (DPCs) and interrupt service routines (ISRs) since the processor became active.
     * @remarks
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0601 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<Integer>} processor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/sysinfoapi/nf-sysinfoapi-getprocessorsystemcycletime
     */
    GetProcessor(processor) {
        processorMarshal := processor is VarRef ? "uint*" : "ptr"

        ComCall(4, this, processorMarshal, processor)
    }
}
