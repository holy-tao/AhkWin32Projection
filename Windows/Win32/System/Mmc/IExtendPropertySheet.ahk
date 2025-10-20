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
     * 
     * @param {Pointer<IPropertySheetCallback>} lpProvider 
     * @param {Pointer} handle 
     * @param {Pointer<IDataObject>} lpIDataObject 
     * @returns {HRESULT} 
     */
    CreatePropertyPages(lpProvider, handle, lpIDataObject) {
        result := ComCall(3, this, "ptr", lpProvider, "ptr", handle, "ptr", lpIDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} lpDataObject 
     * @returns {HRESULT} 
     */
    QueryPagesFor(lpDataObject) {
        result := ComCall(4, this, "ptr", lpDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
