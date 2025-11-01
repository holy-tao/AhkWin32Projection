#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPrivateEngineCallEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpPrivateEngineCallEx
     * @type {Guid}
     */
    static IID => Guid("{defd682a-fe0a-42b9-bfa1-56d3d6cecfaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CallEngineSynchronize", "CallEngineImmediate"]

    /**
     * 
     * @param {Pointer} pInFrame 
     * @param {Integer} ulInFrameSize 
     * @param {Pointer<Pointer<Void>>} ppCoMemOutFrame 
     * @param {Pointer<Integer>} pulOutFrameSize 
     * @returns {HRESULT} 
     */
    CallEngineSynchronize(pInFrame, ulInFrameSize, ppCoMemOutFrame, pulOutFrameSize) {
        pulOutFrameSizeMarshal := pulOutFrameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pInFrame, "uint", ulInFrameSize, "ptr*", ppCoMemOutFrame, pulOutFrameSizeMarshal, pulOutFrameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pInFrame 
     * @param {Integer} ulInFrameSize 
     * @param {Pointer<Pointer<Void>>} ppCoMemOutFrame 
     * @param {Pointer<Integer>} pulOutFrameSize 
     * @returns {HRESULT} 
     */
    CallEngineImmediate(pInFrame, ulInFrameSize, ppCoMemOutFrame, pulOutFrameSize) {
        pulOutFrameSizeMarshal := pulOutFrameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pInFrame, "uint", ulInFrameSize, "ptr*", ppCoMemOutFrame, pulOutFrameSizeMarshal, pulOutFrameSize, "HRESULT")
        return result
    }
}
