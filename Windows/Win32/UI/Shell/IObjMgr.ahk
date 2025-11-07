#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a client to append or remove an object from a collection of objects managed by a server object.
 * @remarks
 * 
 * This interface is implemented by objects that manage a collection of other objects. It is exported to allow clients of the object to request that objects be added to or removed from the collection.
 * 
 * Use this interface to add or delete an object from the server object's collection of managed objects.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-iobjmgr
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IObjMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjMgr
     * @type {Guid}
     */
    static IID => Guid("{00bb2761-6a77-11d0-a535-00c04fd7d062}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Append", "Remove"]

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iobjmgr-append
     */
    Append(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iobjmgr-remove
     */
    Remove(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }
}
