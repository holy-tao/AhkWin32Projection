#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * Exposes methods that are used to persist item identifier lists.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipersistidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPersistIDList extends IPersist{
    /**
     * The interface identifier for IPersistIDList
     * @type {Guid}
     */
    static IID => Guid("{1079acfc-29bd-11d3-8e0d-00c04f6837d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    SetIDList(pidl) {
        result := ComCall(4, this, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} ppidl 
     * @returns {HRESULT} 
     */
    GetIDList(ppidl) {
        result := ComCall(5, this, "ptr", ppidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
