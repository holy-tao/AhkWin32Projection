#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBAsynchStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDBAsynchStatus
     * @type {Guid}
     */
    static IID => Guid("{0c733a95-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Abort", "GetStatus"]

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @returns {HRESULT} 
     */
    Abort(hChapter, eOperation) {
        result := ComCall(3, this, "ptr", hChapter, "uint", eOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @param {Pointer<Pointer>} pulProgress 
     * @param {Pointer<Pointer>} pulProgressMax 
     * @param {Pointer<Integer>} peAsynchPhase 
     * @param {Pointer<PWSTR>} ppwszStatusText 
     * @returns {HRESULT} 
     */
    GetStatus(hChapter, eOperation, pulProgress, pulProgressMax, peAsynchPhase, ppwszStatusText) {
        pulProgressMarshal := pulProgress is VarRef ? "ptr*" : "ptr"
        pulProgressMaxMarshal := pulProgressMax is VarRef ? "ptr*" : "ptr"
        peAsynchPhaseMarshal := peAsynchPhase is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", hChapter, "uint", eOperation, pulProgressMarshal, pulProgress, pulProgressMaxMarshal, pulProgressMax, peAsynchPhaseMarshal, peAsynchPhase, "ptr", ppwszStatusText, "HRESULT")
        return result
    }
}
