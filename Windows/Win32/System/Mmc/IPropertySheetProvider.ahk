#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IPropertySheetProvider interface implements Windows property sheets as COM objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nn-mmc-ipropertysheetprovider
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
     * Creates a property sheet frame.
     * @remarks
     * This method creates an object that collects all information required to create a property sheet. If the 
     * CreatePropertySheet call is successful, but subsequent errors occur, you must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-show">IPropertySheetProvider::Show</a>(
     *     –1, 0) to free objects. The return code can be ignored in this case.
     * 
     * In situations in which the snap-in creates a property sheet in a call to <b>IPropertySheetProvider::CreatePropertySheet</b> and then optionally calls <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-addprimarypages">IPropertySheetProvider::AddPrimaryPages</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-addextensionpages">IPropertySheetProvider::AddExtensionPages</a>, and then decides not to show the property sheet, it should call <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-show">IPropertySheetProvider::Show</a>(
     *     –1, 0) to delete the property sheet and free its resources. In this case, the snap-in must delete the property page handles it has created. This can be done before or after the snap-in calls <b>IPropertySheetProvider::Show</b>(
     *     –1, 0), because MMC does not use the property page handles.
     * 
     * For a snap-in that targets MMC 1.1, the snap-in must keep an extra reference on the IDataObject interface that it passes to MMC in the <b>IPropertySheetProvider::CreatePropertySheet</b> call. This reference must be kept from before the <b>IPropertySheetProvider::CreatePropertySheet</b> call until after the property sheet is possibly closed with a call to <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-show">IPropertySheetProvider::Show</a>(
     *     –1, 0).
     * @param {PWSTR} title A pointer to a null-terminated string that contains the title of the property page. This parameter cannot be <b>NULL</b>.
     * @param {Integer} type <b>TRUE</b> creates a property sheet and <b>FALSE</b> creates a wizard.
     * @param {Pointer} cookie Cookie value of the currently selected item. This can be <b>NULL</b> when 
     * CreatePropertySheet is called by an extension snap-in.
     * @param {IDataObject} pIDataObjectm A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object for the cookie. If the value of this parameter is <b>NULL</b>, MMC will not call any of the 
     * IExtendPropertySheet2 methods implemented by extension snap-ins.
     * @param {Integer} dwOptions 
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-ipropertysheetprovider-createpropertysheet
     */
    CreatePropertySheet(title, type, cookie, pIDataObjectm, dwOptions) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(3, this, "ptr", title, "char", type, "ptr", cookie, "ptr", pIDataObjectm, "uint", dwOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether a specific property sheet exists.
     * @remarks
     * Items in the scope pane are owned by the console so there is no need to interact with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a> interface. The snap-in must implement 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-compareobjects">IComponent::CompareObjects</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponentdata-compareobjects">IComponentData::CompareObjects</a> to compare the data object with other data objects for existing property sheets.
     * @param {Pointer} hItem A handle to the selected item in the scope pane.
     * @param {IComponent} lpComponent A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a> interface on the selected object. <b>NULL</b> if the object selected is a folder (on the scope or result panes), and  
     * <b>IComponent</b> of the snap-in if it is a result pane leaf item.
     * @param {IDataObject} lpDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-ipropertysheetprovider-findpropertysheet
     */
    FindPropertySheet(hItem, lpComponent, lpDataObject) {
        result := ComCall(4, this, "ptr", hItem, "ptr", lpComponent, "ptr", lpDataObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IPropertySheetProvider::AddPrimaryPages method collects the pages from the primary snap-in.
     * @remarks
     * The snap-in might not add any pages during this method call. If this is the case, extension pages should not be added.
     * @param {IUnknown} lpUnknown A pointer to snap-in interface that will be queried for the <b>IExtendPropertySheet</b> interface. If <i>bCreateHandle</i> is set to <b>TRUE</b>, this should also be a pointer to the snap-in's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a> interface that will be queried for <b>IExtendPropertySheet</b>. Be aware that this value can be <b>NULL</b>. See Remarks for details.
     * @param {BOOL} bCreateHandle A value that specifies whether to create a console-provided notification handle that is used to route the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-property-change">MMCN_PROPERTY_CHANGE</a> notification to the appropriate 
     * <b>IComponent</b> or 
     * <b>IComponentData</b> interface during calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-mmcpropertychangenotify">MMCPropertyChangeNotify</a>. The notification handle is passed back to the snap-in during calls to the snap-in's implementation of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814847(v=vs.85)">IExtendPropertySheet2::CreatePropertyPages</a> method.
     * 
     * If <i>bCreateHandle</i> is set to <b>TRUE</b>, the <i>lpUnknown</i> parameter should be a pointer to the 
     * <b>IComponent</b> or 
     * <b>IComponentData</b> that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-property-change">MMCN_PROPERTY_CHANGE</a> notification.
     * @param {HWND} hNotifyWindow Reserved for future use. This value should be <b>NULL</b>.
     * @param {BOOL} bScopePane Set to <b>TRUE</b> if the item is in the scope pane. Set to <b>FALSE</b> if it is in the result pane.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-ipropertysheetprovider-addprimarypages
     */
    AddPrimaryPages(lpUnknown, bCreateHandle, hNotifyWindow, bScopePane) {
        hNotifyWindow := hNotifyWindow is Win32Handle ? NumGet(hNotifyWindow, "ptr") : hNotifyWindow

        result := ComCall(5, this, "ptr", lpUnknown, "int", bCreateHandle, "ptr", hNotifyWindow, "int", bScopePane, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IPropertySheetProvider::AddExtensionPages method collects the pages from the extension snap-ins.
     * @remarks
     * Snap-ins that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-ipropertysheetprovider">IPropertySheetProvider</a> interface directly must add at least one page before extensions can add pages. They must also call the <b>IPropertySheetProvider::AddExtensionPages</b> method to allow extensions to add their own property pages.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-ipropertysheetprovider-addextensionpages
     */
    AddExtensionPages() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * If the type that has been set in IPropertySheetProvider::CreatePropertySheet is a property sheet, IPropertySheetProvider::Show displays a property sheet frame that is parented to a hidden window.
     * @remarks
     * <b>IPropertySheetProvider::Show(
     *     –1, 0)</b> returns <b>E_FAIL</b>. This return code can be ignored in this case.
     * 
     * In situations in which the snap-in creates a property sheet in a call to <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-createpropertysheet">IPropertySheetProvider::CreatePropertySheet</a>, optionally calls <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-addprimarypages">IPropertySheetProvider::AddPrimaryPages</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-addextensionpages">IPropertySheetProvider::AddExtensionPages</a>, and then decides not to show the property sheet, it should call <b>IPropertySheetProvider::Show(
     *     –1, 0)</b> to delete the property sheet and free its resources. In this case, the snap-in must delete the property page handles that it has created. This can be done before or after the snap-in calls <b>IPropertySheetProvider::Show(
     *     –1, 0)</b>, because MMC does not use the property page handles.
     * 
     * <b>IPropertySheetProvider::Show(
     *     –1, 0)</b> only deletes the current property sheet, that is, one that has been created, but is not yet shown. After a property sheet is shown, the snap-in cannot programmatically close it. Only the user can close a property sheet that is shown. In this case, MMC automatically deletes all associated property pages (<a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v3">PROPSHEETPAGE</a> structures) provided by the snap-in.
     * @param {Pointer} window A value that specifies the handle to the parent window.
     * @param {Integer} page A value that specifies which page on the property sheet is shown. It is zero-indexed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-ipropertysheetprovider-show
     */
    Show(window, page) {
        result := ComCall(7, this, "ptr", window, "int", page, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
