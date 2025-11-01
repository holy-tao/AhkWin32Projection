#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IMultipleResults extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultipleResults
     * @type {Guid}
     */
    static IID => Guid("{0c733a90-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResult"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} lResultFlag 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer>} pcRowsAffected 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    GetResult(pUnkOuter, lResultFlag, riid, pcRowsAffected, ppRowset) {
        pcRowsAffectedMarshal := pcRowsAffected is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", lResultFlag, "ptr", riid, pcRowsAffectedMarshal, pcRowsAffected, "ptr*", ppRowset, "HRESULT")
        return result
    }
}
