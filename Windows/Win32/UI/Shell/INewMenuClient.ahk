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
     * Allows the view to filter the items shown in the menu.
     * @returns {Integer} Type: <b>NMCII_FLAGS*</b>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inewmenuclient-includeitems
     */
    IncludeItems() {
        result := ComCall(3, this, "int*", &pflags := 0, "HRESULT")
        return pflags
    }

    /**
     * INewMenuClient::SelectAndEditItem method
     * @param {Pointer<ITEMIDLIST>} pidlItem Type: <b>PCIDLIST_ABSOLUTE</b>
     * @param {Integer} flags Type: <b>NMCSAEI_FLAGS</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inewmenuclient-selectandedititem
     */
    SelectAndEditItem(pidlItem, flags) {
        result := ComCall(4, this, "ptr", pidlItem, "int", flags, "HRESULT")
        return result
    }
}
