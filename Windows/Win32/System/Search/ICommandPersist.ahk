#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandPersist extends IUnknown{
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
     * 
     * @param {Pointer<DBID>} pCommandID 
     * @returns {HRESULT} 
     */
    DeleteCommand(pCommandID) {
        result := ComCall(3, this, "ptr", pCommandID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} ppCommandID 
     * @returns {HRESULT} 
     */
    GetCurrentCommand(ppCommandID) {
        result := ComCall(4, this, "ptr", ppCommandID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pCommandID 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    LoadCommand(pCommandID, dwFlags) {
        result := ComCall(5, this, "ptr", pCommandID, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pCommandID 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SaveCommand(pCommandID, dwFlags) {
        result := ComCall(6, this, "ptr", pCommandID, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
