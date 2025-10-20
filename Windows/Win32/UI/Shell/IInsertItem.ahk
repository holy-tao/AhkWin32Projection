#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IInsertItem may be altered or unavailable.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iinsertitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInsertItem extends IUnknown{
    /**
     * The interface identifier for IInsertItem
     * @type {Guid}
     */
    static IID => Guid("{d2b57227-3d23-4b95-93c0-492bd454c356}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    InsertItem(pidl) {
        result := ComCall(3, this, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
