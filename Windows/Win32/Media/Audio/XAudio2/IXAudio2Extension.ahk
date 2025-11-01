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
        ComCall(3, this, "uint*", quantumNumerator, "uint*", quantumDenominator)
    }

    /**
     * 
     * @param {Pointer<Integer>} processor 
     * @returns {String} Nothing - always returns an empty string
     */
    GetProcessor(processor) {
        ComCall(4, this, "uint*", processor)
    }
}
