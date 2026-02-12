#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IPropertySheetCallback interface is a COM-based interface used by a snap-in to add its property pages to a property sheet.
 * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nn-mmc-ipropertysheetcallback
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
     * @remarks
     * The snap-in cannot call 
     * AddPage from within a property page handler because the property page is created and runs on a secondary thread. A snap-in cannot call an MMC interface from a different thread than the one in which the snap-in was created. The correct place to call 
     * AddPage is in the snap-in's implementation of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814847(v=vs.85)">IExtendPropertySheet2::CreatePropertyPages</a> method.
     * 
     * If a snap-in uses the 
     * IPropertySheetProvider interface directly, it can use 
     * AddPage to add the primary pages and then call <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-addprimarypages">IPropertySheetProvider::AddPrimaryPages</a> (<b>NULL</b>, <b>FALSE</b>, <b>NULL</b>, [<b>TRUE</b> or <b>FALSE</b>]) so that the provider will add these pages to the property sheet. For more information about how to create your property pages in the snap-in's implementation of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814847(v=vs.85)">IExtendPropertySheet2::CreatePropertyPages</a>, see <b>IPropertySheetProvider::AddPrimaryPages</b>.
     * 
     * Pages are added to the sheet in the order in which they are presented. The primary snap-in's pages are always added first.
     * @param {HPROPSHEETPAGE} hPage A value that specifies the handle to the page to be added. The hPage parameter is a handle to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v3">PROPSHEETPAGE</a> structure created by the Windows API 
     * <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-ipropertysheetcallback-addpage
     */
    AddPage(hPage) {
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := ComCall(3, this, "ptr", hPage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IPropertySheetCallback::RemovePage method enables a snap-in to remove a page from a property sheet.
     * @remarks
     * RemovePage can be used only for pages that the snap-in has added.
     * @param {HPROPSHEETPAGE} hPage A handle to the page to be removed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-ipropertysheetcallback-removepage
     */
    RemovePage(hPage) {
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := ComCall(4, this, "ptr", hPage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
