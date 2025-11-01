#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a snap-in component to add pages to the property sheet of an item.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iextendpropertysheet
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IExtendPropertySheet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtendPropertySheet
     * @type {Guid}
     */
    static IID => Guid("{85de64dc-ef21-11cf-a285-00c04fd8dbe6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePropertyPages", "QueryPagesFor"]

    /**
     * 
     * @param {IPropertySheetCallback} lpProvider 
     * @param {Pointer} handle 
     * @param {IDataObject} lpIDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendpropertysheet-createpropertypages
     */
    CreatePropertyPages(lpProvider, handle, lpIDataObject) {
        result := ComCall(3, this, "ptr", lpProvider, "ptr", handle, "ptr", lpIDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} lpDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendpropertysheet-querypagesfor
     */
    QueryPagesFor(lpDataObject) {
        result := ComCall(4, this, "ptr", lpDataObject, "HRESULT")
        return result
    }
}
