#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IImageList.ahk
#Include .\IConsoleVerb.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Enables communication with the console.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iconsole
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsole extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsole
     * @type {Guid}
     */
    static IID => Guid("{43136eb1-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHeader", "SetToolbar", "QueryResultView", "QueryScopeImageList", "QueryResultImageList", "UpdateAllViews", "MessageBox", "QueryConsoleVerb", "SelectScopeItem", "GetMainWindow", "NewWindow"]

    /**
     * Sets the header interface to use for this instance of IComponent. This is used only by instances of IComponent.
     * @remarks
     * The snap-in must instruct the console to release the 
     * <b>IHeaderCtrl</b> interface by calling <b>IConsole::SetHeader</b>(NULL).
     * 
     * The best time to release the 
     * <b>IHeaderCtrl</b> interface is during a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-destroy">IComponent::Destroy</a>.
     * @param {IHeaderCtrl} pHeader A pointer to the 
     * <b>IHeaderCtrl</b> interface.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-setheader
     */
    SetHeader(pHeader) {
        result := ComCall(3, this, "ptr", pHeader, "HRESULT")
        return result
    }

    /**
     * Sets the toolbar interface to be used for this instance of IComponent. Be aware that this is used only by instances of IComponent.
     * @param {IToolbar} pToolbar A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-itoolbar">IToolbar</a> interface.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-settoolbar
     */
    SetToolbar(pToolbar) {
        result := ComCall(4, this, "ptr", pToolbar, "HRESULT")
        return result
    }

    /**
     * Queries IConsole for the result view object IUnknown interface pointer.
     * @remarks
     * <b>QueryResultView</b> can be used when the result view is an OLE custom control (OCX) that implements the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface. The user should call 
     * <b>QueryResultView</b> to get the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer to the OCX. This is necessary because the Node Manager handles the creation of the OCX.
     * @returns {IUnknown} A pointer to the location of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer to the result view object.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryresultview
     */
    QueryResultView() {
        result := ComCall(5, this, "ptr*", &pUnknown := 0, "HRESULT")
        return IUnknown(pUnknown)
    }

    /**
     * Queries the console-provided scope pane image list.
     * @returns {IImageList} The address of a variable that receives the scope pane 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iimagelist">IImageList</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryscopeimagelist
     */
    QueryScopeImageList() {
        result := ComCall(6, this, "ptr*", &ppImageList := 0, "HRESULT")
        return IImageList(ppImageList)
    }

    /**
     * Retrieves the console-provided result-view image list. This image list should be used only if the snap-in is using the default list view.
     * @returns {IImageList} Address of a variable that receives the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iimagelist">IImageList</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryresultimagelist
     */
    QueryResultImageList() {
        result := ComCall(7, this, "ptr*", &ppImageList := 0, "HRESULT")
        return IImageList(ppImageList)
    }

    /**
     * Called by a snap-in when there is a content change in the result pane. This method can be called either by IComponent or IComponentData.
     * @remarks
     * This method sends an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-view-change">MMCN_VIEW_CHANGE</a> notification to all instances of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a> associated with the snap-in instance calling this method. The <i>lpDataObject</i>, <i>data</i>, and <i>hint</i> parameters are passed as the <i>lpDataObject</i> arg, and param for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-notify">IComponent::Notify</a> method.
     * 
     * This method should be called from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsole">IConsole</a> interface pointer obtained through the snap-in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a> implementation.
     * @param {IDataObject} lpDataObject A pointer to a user-supplied data object.
     * @param {LPARAM} data A user-defined value, for example a pointer to the modified content.
     * @param {Pointer} hint A user-defined value, for example information about the type of content change.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-updateallviews
     */
    UpdateAllViews(lpDataObject, data, hint) {
        result := ComCall(8, this, "ptr", lpDataObject, "ptr", data, "ptr", hint, "HRESULT")
        return result
    }

    /**
     * Displays a message box.
     * @remarks
     * <b>MessageBox</b> should not be used for that displays errors that occur when the snap-in does not have the focus. Generally, 
     * 
     * <b>MessageBox</b> should be used only when the error demands user attention and when the result pane contains useful information despite the error.
     * 
     * In most cases, the MMC message OCX control is a more appropriate way of that displays error messages. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/using-the-mmc-message-ocx-control">Using the MMC Message OCX Control</a>.
     * @param {PWSTR} lpszText A pointer to a null-terminated string that contains the message to be displayed.
     * @param {PWSTR} lpszTitle A pointer to a null-terminated string used for the message box title. If this parameter is <b>NULL</b>, the default title "Error" is used.
     * @param {Integer} fuStyle A value that specifies a set of bit flags that determine the contents and behavior of the message box. This parameter can be a combination of flags from the following groups of flags taken from the documentation for the Windows API 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-messagebox">MessageBox</a>.
     * 
     * Specify one of the following flags to indicate which buttons appear in the message box.
     * @returns {Integer} A pointer to the return value.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-messagebox
     */
    MessageBox(lpszText, lpszTitle, fuStyle) {
        lpszText := lpszText is String ? StrPtr(lpszText) : lpszText
        lpszTitle := lpszTitle is String ? StrPtr(lpszTitle) : lpszTitle

        result := ComCall(9, this, "ptr", lpszText, "ptr", lpszTitle, "uint", fuStyle, "int*", &piRetval := 0, "HRESULT")
        return piRetval
    }

    /**
     * Queries for the IConsoleVerb interface.
     * @remarks
     * This method should be called from an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsole">IConsole</a> interface pointer obtained through the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a> interface.
     * @returns {IConsoleVerb} A pointer to the address of a variable that receives the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsoleverb">IConsoleVerb</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-queryconsoleverb
     */
    QueryConsoleVerb() {
        result := ComCall(10, this, "ptr*", &ppConsoleVerb := 0, "HRESULT")
        return IConsoleVerb(ppConsoleVerb)
    }

    /**
     * Selects the given scope item.
     * @remarks
     * Use this method to reselect the currently selected scope item or to select another scope item.
     * 
     * You can have a single scope item with several different views available, for example, several OLE custom control (OCX) views and the default list view. When the user selects a different view from a menu, the snap-in receives the command and should then call 
     * <b>SelectScopeItem</b> to reselect the item. 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getresultviewtype">IComponent::GetResultViewType</a> can then return the new view type.
     * 
     * If 
     * <b>SelectScopeItem</b> is called by the snap-in in its <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a> notification handler, MMC will not select the specified scope item, even though 
     * <b>SelectScopeItem</b> may return <b>S_OK</b>.
     * @param {Pointer} hScopeItem A handle to the item in the scope pane to be selected.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-selectscopeitem
     */
    SelectScopeItem(hScopeItem) {
        result := ComCall(11, this, "ptr", hScopeItem, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the main frame window.
     * @returns {HWND} A pointer to a variable that receives the window handle.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-getmainwindow
     */
    GetMainWindow() {
        phwnd := HWND()
        result := ComCall(12, this, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * Creates a new multiple-document interface (MDI) child window rooted at the specified scope item.
     * @param {Pointer} hScopeItem The scope item that forms the root of the new window.
     * @param {Integer} lOptions Options used to create the new window are listed in the following list.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole-newwindow
     */
    NewWindow(hScopeItem, lOptions) {
        result := ComCall(13, this, "ptr", hScopeItem, "uint", lOptions, "HRESULT")
        return result
    }
}
