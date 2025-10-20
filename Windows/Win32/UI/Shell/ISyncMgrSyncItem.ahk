#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that act on and retrieve information from a single sync item, allowing handlers to manage sync items as independent objects.
 * @remarks
 * 
  * A sync item typically represents a group of data, for example, a folder that contains several files. By representing this sync item as an interface, the item can be easily managed and implemented as an object. That object maintains the state of the item when the item is accessed.
  * 
  * Representing a sync item as <b>ISyncMgrSyncItem</b> also allows support for a sync item that contains other sync items.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrsyncitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSyncItem extends IUnknown{
    /**
     * The interface identifier for ISyncMgrSyncItem
     * @type {Guid}
     */
    static IID => Guid("{b20b24ce-2593-4f04-bd8b-7ad6c45051cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszItemID 
     * @returns {HRESULT} 
     */
    GetItemID(ppszItemID) {
        result := ComCall(3, this, "ptr", ppszItemID, "int")
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
        result := ComCall(4, this, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncMgrSyncItemInfo>} ppItemInfo 
     * @returns {HRESULT} 
     */
    GetItemInfo(ppItemInfo) {
        result := ComCall(5, this, "ptr", ppItemInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} rguidObjectID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(rguidObjectID, riid, ppv) {
        result := ComCall(6, this, "ptr", rguidObjectID, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pmCapabilities 
     * @returns {HRESULT} 
     */
    GetCapabilities(pmCapabilities) {
        result := ComCall(7, this, "int*", pmCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pmPolicies 
     * @returns {HRESULT} 
     */
    GetPolicies(pmPolicies) {
        result := ComCall(8, this, "int*", pmPolicies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    Enable(fEnable) {
        result := ComCall(9, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
