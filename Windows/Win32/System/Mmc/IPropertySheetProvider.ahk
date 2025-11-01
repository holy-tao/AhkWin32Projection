#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IPropertySheetProvider interface implements Windows property sheets as COM objects.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-ipropertysheetprovider
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IPropertySheetProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertySheetProvider
     * @type {Guid}
     */
    static IID => Guid("{85de64de-ef21-11cf-a285-00c04fd8dbe6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePropertySheet", "FindPropertySheet", "AddPrimaryPages", "AddExtensionPages", "Show"]

    /**
     * 
     * @param {PWSTR} title 
     * @param {Integer} type 
     * @param {Pointer} cookie 
     * @param {IDataObject} pIDataObjectm 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ipropertysheetprovider-createpropertysheet
     */
    CreatePropertySheet(title, type, cookie, pIDataObjectm, dwOptions) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(3, this, "ptr", title, "char", type, "ptr", cookie, "ptr", pIDataObjectm, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hItem 
     * @param {IComponent} lpComponent 
     * @param {IDataObject} lpDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ipropertysheetprovider-findpropertysheet
     */
    FindPropertySheet(hItem, lpComponent, lpDataObject) {
        result := ComCall(4, this, "ptr", hItem, "ptr", lpComponent, "ptr", lpDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} lpUnknown 
     * @param {BOOL} bCreateHandle 
     * @param {HWND} hNotifyWindow 
     * @param {BOOL} bScopePane 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ipropertysheetprovider-addprimarypages
     */
    AddPrimaryPages(lpUnknown, bCreateHandle, hNotifyWindow, bScopePane) {
        hNotifyWindow := hNotifyWindow is Win32Handle ? NumGet(hNotifyWindow, "ptr") : hNotifyWindow

        result := ComCall(5, this, "ptr", lpUnknown, "int", bCreateHandle, "ptr", hNotifyWindow, "int", bScopePane, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ipropertysheetprovider-addextensionpages
     */
    AddExtensionPages() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} window 
     * @param {Integer} page 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ipropertysheetprovider-show
     */
    Show(window, page) {
        result := ComCall(7, this, "ptr", window, "int", page, "HRESULT")
        return result
    }
}
