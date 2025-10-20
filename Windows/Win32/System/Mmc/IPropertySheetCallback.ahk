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
     * 
     * @param {HPROPSHEETPAGE} hPage 
     * @returns {HRESULT} 
     */
    AddPage(hPage) {
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := ComCall(3, this, "ptr", hPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HPROPSHEETPAGE} hPage 
     * @returns {HRESULT} 
     */
    RemovePage(hPage) {
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := ComCall(4, this, "ptr", hPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
