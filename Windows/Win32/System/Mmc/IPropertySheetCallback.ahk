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
     * 
     * @param {HPROPSHEETPAGE} hPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ipropertysheetcallback-addpage
     */
    AddPage(hPage) {
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := ComCall(3, this, "ptr", hPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HPROPSHEETPAGE} hPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ipropertysheetcallback-removepage
     */
    RemovePage(hPage) {
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := ComCall(4, this, "ptr", hPage, "HRESULT")
        return result
    }
}
