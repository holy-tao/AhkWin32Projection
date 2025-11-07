#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandPersist extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandPersist
     * @type {Guid}
     */
    static IID => Guid("{0c733aa7-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteCommand", "GetCurrentCommand", "LoadCommand", "SaveCommand"]

    /**
     * 
     * @param {Pointer<DBID>} pCommandID 
     * @returns {HRESULT} 
     */
    DeleteCommand(pCommandID) {
        result := ComCall(3, this, "ptr", pCommandID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<DBID>} 
     */
    GetCurrentCommand() {
        result := ComCall(4, this, "ptr*", &ppCommandID := 0, "HRESULT")
        return ppCommandID
    }

    /**
     * 
     * @param {Pointer<DBID>} pCommandID 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    LoadCommand(pCommandID, dwFlags) {
        result := ComCall(5, this, "ptr", pCommandID, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pCommandID 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SaveCommand(pCommandID, dwFlags) {
        result := ComCall(6, this, "ptr", pCommandID, "uint", dwFlags, "HRESULT")
        return result
    }
}
