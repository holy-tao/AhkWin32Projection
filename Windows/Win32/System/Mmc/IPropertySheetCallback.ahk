#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IPropertySheetCallback interface is a COM-based interface used by a snap-in to add its property pages to a property sheet.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-ipropertysheetcallback
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IPropertySheetCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertySheetCallback
     * @type {Guid}
     */
    static IID => Guid("{85de64dd-ef21-11cf-a285-00c04fd8dbe6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPage", "RemovePage"]

    /**
     * The IPropertySheetCallback::AddPage method enables a snap-in to add a page to a property sheet.
     * @param {HPROPSHEETPAGE} hPage A value that specifies the handle to the page to be added. The hPage parameter is a handle to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v3">PROPSHEETPAGE</a> structure created by the Windows API 
     * <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ipropertysheetcallback-addpage
     */
    AddPage(hPage) {
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := ComCall(3, this, "ptr", hPage, "HRESULT")
        return result
    }

    /**
     * The IPropertySheetCallback::RemovePage method enables a snap-in to remove a page from a property sheet.
     * @param {HPROPSHEETPAGE} hPage A handle to the page to be removed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ipropertysheetcallback-removepage
     */
    RemovePage(hPage) {
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := ComCall(4, this, "ptr", hPage, "HRESULT")
        return result
    }
}
