#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommand
     * @type {Guid}
     */
    static IID => Guid("{0c733a63-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Execute", "GetDBSession"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<DBPARAMS>} pParams 
     * @param {Pointer<Pointer>} pcRowsAffected 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    Execute(pUnkOuter, riid, pParams, pcRowsAffected, ppRowset) {
        result := ComCall(4, this, "ptr", pUnkOuter, "ptr", riid, "ptr", pParams, "ptr*", pcRowsAffected, "ptr*", ppRowset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppSession 
     * @returns {HRESULT} 
     */
    GetDBSession(riid, ppSession) {
        result := ComCall(5, this, "ptr", riid, "ptr*", ppSession, "HRESULT")
        return result
    }
}
