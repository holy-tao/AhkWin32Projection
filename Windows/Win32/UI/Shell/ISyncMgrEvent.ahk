#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve data from an event store. An event store allows Sync Center to get an enumerator of all events in the store, as well as to retrieve individual events.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrevent
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrEvent extends IUnknown{
    /**
     * The interface identifier for ISyncMgrEvent
     * @type {Guid}
     */
    static IID => Guid("{fee0ef8b-46bd-4db4-b7e6-ff2c687313bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguidEventID 
     * @returns {HRESULT} 
     */
    GetEventID(pguidEventID) {
        result := ComCall(3, this, "ptr", pguidEventID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszHandlerID 
     * @returns {HRESULT} 
     */
    GetHandlerID(ppszHandlerID) {
        result := ComCall(4, this, "ptr", ppszHandlerID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszItemID 
     * @returns {HRESULT} 
     */
    GetItemID(ppszItemID) {
        result := ComCall(5, this, "ptr", ppszItemID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnLevel 
     * @returns {HRESULT} 
     */
    GetLevel(pnLevel) {
        result := ComCall(6, this, "int*", pnLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pnFlags) {
        result := ComCall(7, this, "int*", pnFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pfCreationTime 
     * @returns {HRESULT} 
     */
    GetTime(pfCreationTime) {
        result := ComCall(8, this, "ptr", pfCreationTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    GetName(ppszName) {
        result := ComCall(9, this, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDescription 
     * @returns {HRESULT} 
     */
    GetDescription(ppszDescription) {
        result := ComCall(10, this, "ptr", ppszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszLinkText 
     * @returns {HRESULT} 
     */
    GetLinkText(ppszLinkText) {
        result := ComCall(11, this, "ptr", ppszLinkText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszLinkReference 
     * @returns {HRESULT} 
     */
    GetLinkReference(ppszLinkReference) {
        result := ComCall(12, this, "ptr", ppszLinkReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszContext 
     * @returns {HRESULT} 
     */
    GetContext(ppszContext) {
        result := ComCall(13, this, "ptr", ppszContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
