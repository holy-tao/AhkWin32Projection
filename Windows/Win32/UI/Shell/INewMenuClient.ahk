#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow manipulation of items in a Windows 7 menu.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-inewmenuclient
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INewMenuClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INewMenuClient
     * @type {Guid}
     */
    static IID => Guid("{dcb07fdc-3bb5-451c-90be-966644fed7b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IncludeItems", "SelectAndEditItem"]

    /**
     * 
     * @param {Pointer<Integer>} pflags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inewmenuclient-includeitems
     */
    IncludeItems(pflags) {
        result := ComCall(3, this, "int*", pflags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidlItem 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inewmenuclient-selectandedititem
     */
    SelectAndEditItem(pidlItem, flags) {
        result := ComCall(4, this, "ptr", pidlItem, "int", flags, "HRESULT")
        return result
    }
}
