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
     * Adds pages to a property sheet.
     * @param {IPropertySheetCallback} lpProvider A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-ipropertysheetcallback">IPropertySheetCallback</a> interface.
     * @param {Pointer} handle A value that specifies the handle used to route the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-property-change">MMCN_PROPERTY_CHANGE</a> notification message to the appropriate 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a> interface.
     * 
     * For snap-ins that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-ipropertysheetprovider">IPropertySheetProvider</a> interface directly, MMC creates the handle when the snap-in calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-addprimarypages">IPropertySheetProvider::AddPrimaryPages</a> and specifies its bCreateHandle to be <b>TRUE</b>.
     * @param {IDataObject} lpIDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object that contains context information about the scope or result item.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendpropertysheet-createpropertypages
     */
    CreatePropertyPages(lpProvider, handle, lpIDataObject) {
        result := ComCall(3, this, "ptr", lpProvider, "ptr", handle, "ptr", lpIDataObject, "HRESULT")
        return result
    }

    /**
     * Determines whether the object requires pages.
     * @param {IDataObject} lpDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object that contains context information about the scope or result item.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iextendpropertysheet-querypagesfor
     */
    QueryPagesFor(lpDataObject) {
        result := ComCall(4, this, "ptr", lpDataObject, "HRESULT")
        return result
    }
}
