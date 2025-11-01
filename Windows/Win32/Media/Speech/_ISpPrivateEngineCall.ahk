#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class _ISpPrivateEngineCall extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _ISpPrivateEngineCall
     * @type {Guid}
     */
    static IID => Guid("{8e7c791e-4467-11d3-9723-00c04f72db08}")

    /**
     * The class identifier for _ISpPrivateEngineCall
     * @type {Guid}
     */
    static CLSID => Guid("{8e7c791e-4467-11d3-9723-00c04f72db08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CallEngine", "CallEngineEx"]

    /**
     * 
     * @param {Pointer} pCallFrame 
     * @param {Integer} ulCallFrameSize 
     * @returns {HRESULT} 
     */
    CallEngine(pCallFrame, ulCallFrameSize) {
        result := ComCall(3, this, "ptr", pCallFrame, "uint", ulCallFrameSize, "HRESULT")
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
    CallEngineEx(pInFrame, ulInFrameSize, ppCoMemOutFrame, pulOutFrameSize) {
        pulOutFrameSizeMarshal := pulOutFrameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pInFrame, "uint", ulInFrameSize, "ptr*", ppCoMemOutFrame, pulOutFrameSizeMarshal, pulOutFrameSize, "HRESULT")
        return result
    }
}
