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
     * 
     * @param {PWSTR} title 
     * @param {Integer} type 
     * @param {Pointer} cookie 
     * @param {Pointer<IDataObject>} pIDataObjectm 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    CreatePropertySheet(title, type, cookie, pIDataObjectm, dwOptions) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(3, this, "ptr", title, "char", type, "ptr", cookie, "ptr", pIDataObjectm, "uint", dwOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hItem 
     * @param {Pointer<IComponent>} lpComponent 
     * @param {Pointer<IDataObject>} lpDataObject 
     * @returns {HRESULT} 
     */
    FindPropertySheet(hItem, lpComponent, lpDataObject) {
        result := ComCall(4, this, "ptr", hItem, "ptr", lpComponent, "ptr", lpDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} lpUnknown 
     * @param {BOOL} bCreateHandle 
     * @param {HWND} hNotifyWindow 
     * @param {BOOL} bScopePane 
     * @returns {HRESULT} 
     */
    AddPrimaryPages(lpUnknown, bCreateHandle, hNotifyWindow, bScopePane) {
        hNotifyWindow := hNotifyWindow is Win32Handle ? NumGet(hNotifyWindow, "ptr") : hNotifyWindow

        result := ComCall(5, this, "ptr", lpUnknown, "int", bCreateHandle, "ptr", hNotifyWindow, "int", bScopePane, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddExtensionPages() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} window 
     * @param {Integer} page 
     * @returns {HRESULT} 
     */
    Show(window, page) {
        result := ComCall(7, this, "ptr", window, "int", page, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
