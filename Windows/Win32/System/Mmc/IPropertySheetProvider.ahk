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
     * Creates a property sheet frame.
     * @param {PWSTR} title A pointer to a null-terminated string that contains the title of the property page. This parameter cannot be <b>NULL</b>.
     * @param {Integer} type <b>TRUE</b> creates a property sheet and <b>FALSE</b> creates a wizard.
     * @param {Pointer} cookie Cookie value of the currently selected item. This can be <b>NULL</b> when 
     * CreatePropertySheet is called by an extension snap-in.
     * @param {IDataObject} pIDataObjectm A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object for the cookie. If the value of this parameter is <b>NULL</b>, MMC will not call any of the 
     * IExtendPropertySheet2 methods implemented by extension snap-ins.
     * @param {Integer} dwOptions 
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ipropertysheetprovider-createpropertysheet
     */
    CreatePropertySheet(title, type, cookie, pIDataObjectm, dwOptions) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(3, this, "ptr", title, "char", type, "ptr", cookie, "ptr", pIDataObjectm, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * Determines whether a specific property sheet exists.
     * @param {Pointer} hItem A handle to the selected item in the scope pane.
     * @param {IComponent} lpComponent A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a> interface on the selected object. <b>NULL</b> if the object selected is a folder (on the scope or result panes), and  
     * <b>IComponent</b> of the snap-in if it is a result pane leaf item.
     * @param {IDataObject} lpDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ipropertysheetprovider-findpropertysheet
     */
    FindPropertySheet(hItem, lpComponent, lpDataObject) {
        result := ComCall(4, this, "ptr", hItem, "ptr", lpComponent, "ptr", lpDataObject, "HRESULT")
        return result
    }

    /**
     * The IPropertySheetProvider::AddPrimaryPages method collects the pages from the primary snap-in.
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
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ipropertysheetprovider-addprimarypages
     */
    AddPrimaryPages(lpUnknown, bCreateHandle, hNotifyWindow, bScopePane) {
        hNotifyWindow := hNotifyWindow is Win32Handle ? NumGet(hNotifyWindow, "ptr") : hNotifyWindow

        result := ComCall(5, this, "ptr", lpUnknown, "int", bCreateHandle, "ptr", hNotifyWindow, "int", bScopePane, "HRESULT")
        return result
    }

    /**
     * The IPropertySheetProvider::AddExtensionPages method collects the pages from the extension snap-ins.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ipropertysheetprovider-addextensionpages
     */
    AddExtensionPages() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * If the type that has been set in IPropertySheetProvider::CreatePropertySheet is a property sheet, IPropertySheetProvider::Show displays a property sheet frame that is parented to a hidden window.
     * @param {Pointer} window A value that specifies the handle to the parent window.
     * @param {Integer} page A value that specifies which page on the property sheet is shown. It is zero-indexed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-ipropertysheetprovider-show
     */
    Show(window, page) {
        result := ComCall(7, this, "ptr", window, "int", page, "HRESULT")
        return result
    }
}
