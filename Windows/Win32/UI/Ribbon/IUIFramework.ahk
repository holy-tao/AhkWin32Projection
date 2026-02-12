#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIFramework interface is implemented by the Windows Ribbon framework and defines the methods that provide the core functionality for the framework.
 * @remarks
 * This interface is used to initialize and dismantle the Ribbon framework.
 * 
 * Ribbon framework UI functionality is differentiated by Views, which are essentially 
 * 				built-in core controls, such as the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> and <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextpopup">ContextPopup</a>.
 * 
 * To get an interface pointer to the implementation of IUIFramework, use <a href="https://docs.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to 
 * 			create a COM object with the class identifier (CLSID) of CLSID_UIRibbonFramework.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nn-uiribbon-iuiframework
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIFramework extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIFramework
     * @type {Guid}
     */
    static IID => Guid("{f4f0385d-6872-43a8-ad09-4c339cb3f5c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Destroy", "LoadUI", "GetView", "GetUICommandProperty", "SetUICommandProperty", "InvalidateUICommand", "FlushPendingInvalidations", "SetModes"]

    /**
     * Connects the host application to the Windows Ribbon framework.
     * @remarks
     * This method must be called by the host application for each top-level window that requires a ribbon.
     * 			
     * 
     * This method is used to set up the hooks that enable the Ribbon framework to invoke callbacks in the host application.
     * 
     * To initialize the Ribbon successfully, a compiled Ribbon markup file must be available as a resource and specified in a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-loadui">IUIFramework::LoadUI</a>. This markup file is an integral component of the framework; it specifies the controls to be used and their layout.
     * 
     * If <b>IUIFramework::Initialize</b> returns successfully: 
     * 
     * <ul>
     * <li>To eliminate inconsistency, redundancy, and incompatibility between Ribbon and traditional command models, the Ribbon framework removes  the standard menu bar of the top-level window in the host application.</li>
     * <li>The framework removes references to the WS_EX_CLIENTEDGE style. <div class="alert"><b>Note</b>  The WS_EX_CLIENTEDGE style specifies that a window has a border with a sunken edge. This style visually interferes with the integration of the Ribbon and the host application.</div>
     * <div> </div>
     * </li>
     * <li>The framework requires that the WS_SYSMENU style be enabled. If WS_SYSMENU is not enabled, the framework does not provide alternate functionality and unpredictable rendering of the Ribbon may result.<div class="alert"><b>Note</b>  The WS_SYSMENU style specifies that the application window has a system menu on its title bar. By association, the WS_CAPTION style must also be specified (see ERROR_INVALID_WINDOW_HANDLE in <b>Return Values</b> above).</div>
     * <div> </div>
     * </li>
     * </ul>
     * @param {HWND} frameWnd Type: <b>HWND</b>
     * 
     * Handle to the top-level window that will contain the Ribbon.
     * @param {IUIApplication} application_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiapplication">IUIApplication</a>*</b>
     * 
     * Pointer to the IUIApplication implementation of the host application.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful; otherwise, an error value from the following list.
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_INVALID_WINDOW_HANDLE)</td>
     * <td><i>frameWnd</i> is <b>NULL</b>, does not point to an existing window, or is not a top-level window of the desktop.
     * 				<div class="alert"><b>Note</b>  This error is also returned if <i>frameWnd</i> is a child window (WS_CHILD), is declared as a tool window (WS_EX_TOOLWINDOW), or it lacks a caption property (WS_CAPTION is mandatory).</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_WINDOW_OF_OTHER_THREAD)</td>
     * <td><i>frameWnd</i> is not owned by the execution thread.</td>
     * </tr>
     * <tr>
     * <td>E_POINTER</td>
     * <td><i>application</i> is <b>NULL</b> or an invalid pointer.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiframework-initialize
     */
    Initialize(frameWnd, application_) {
        frameWnd := frameWnd is Win32Handle ? NumGet(frameWnd, "ptr") : frameWnd

        result := ComCall(3, this, "ptr", frameWnd, "ptr", application_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Terminates and releases all objects, hooks, and references for an instance of the Windows Ribbon framework.
     * @remarks
     * This method must be called once for each instance of <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiframework">IUIFramework</a>.
     * 			
     * 
     * If  <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-initialize">IUIFramework::Initialize</a> was called, then <b>IUIFramework::Destroy</b> must be called to free resources and ensure proper dismantling of the framework. Failure to call <b>IUIFramework::Destroy</b> may cause a memory leak.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiframework-destroy
     */
    Destroy() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads the Windows Ribbon framework UI resource, or compiled markup, file.
     * @remarks
     * <b>IUIFramework::LoadUI</b> should be called upon initialization. This method can be called multiple times during the lifecycle of an application, for example, to show or hide a Ribbon, provided that <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-destroy">IUIFramework::Destroy</a> is called in between. 
     * 			
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiapplication-oncreateuicommand">OnCreateUICommand</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiapplication-onviewchanged">OnViewChanged</a> 
     * 				are called during the execution of <b>IUIFramework::LoadUI</b>.
     * @param {HINSTANCE} instance Type: <b>HINSTANCE</b>
     * 
     * A handle to the Ribbon application instance.
     * @param {PWSTR} resourceName Type: <b>LPCWSTR</b>
     * 
     * The name of the resource that contains the compiled, binary markup.
     * 				
     * 
     * <div class="alert"><b>Note</b>  To initialize the Ribbon successfully, a compiled Ribbon markup file must be available as a resource. This markup file is an integral component of the Ribbon framework; it specifies the controls to use and their layout.
     * 			</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiframework-loadui
     */
    LoadUI(instance, resourceName) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance
        resourceName := resourceName is String ? StrPtr(resourceName) : resourceName

        result := ComCall(5, this, "ptr", instance, "ptr", resourceName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the address of a pointer to an interface that represents a Windows Ribbon framework View, such as IUIRibbon or IUIContextualUI.
     * @remarks
     * Ribbon framework UI functionality is differentiated by Views, which are essentially built-in core frameworks, 
     * 				such as the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> and <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextpopup">ContextPopup</a>.
     * 			
     * 
     * Rather than maintaining a pointer to an interface throughout the life of an application,
     * 				<b>IUIFramework::GetView</b> enables a host application to create a temporary interface pointer 
     * 				and call methods as necessary. 
     * 				
     * 
     * <div class="alert"><b>Note</b>  The host application must call <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the temporary interface pointer to avoid a memory leak.</div>
     * <div> </div>
     * For example, each time there is a change to the size of the ribbon, a host application calls 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiribbon-getheight">GetHeight</a> to adjust the size of the host client area 
     * 				appropriately.
     * @param {Integer} viewId Type: <b>UINT32</b>
     * 
     * The ID for the View. 
     * 				A value of 0 for a <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> or the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command-id">Command.Id</a> of a <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextpopup">ContextPopup</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The interface ID for <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiribbon">IUIRibbon</a> 
     * 					or <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicontextualui">IUIContextualUI</a>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiribbon">IUIRibbon</a> 
     * 					or an <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicontextualui">IUIContextualUI</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiframework-getview
     */
    GetView(viewId, riid) {
        result := ComCall(6, this, "uint", viewId, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Retrieves a command property, value, or state.
     * @param {Integer} commandId Type: <b>UINT32</b>
     * 
     * The ID for the Command, which is specified in the Markup resource file.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * The property key of the command property, value, or state.
     * @returns {PROPVARIANT} Type: <b>PROPVARIANT*</b>
     * 
     * When this method returns, contains the property, value, or state.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiframework-getuicommandproperty
     */
    GetUICommandProperty(commandId, key) {
        value := PROPVARIANT()
        result := ComCall(7, this, "uint", commandId, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets a command property, value, or state.
     * @remarks
     * A limited number of property keys can be set using <b>IUIFramework::SetUICommandProperty</b>. For those properties where <b>IUIFramework::SetUICommandProperty</b> returns <b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b>, <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-invalidateuicommand">IUIFramework::InvalidateUICommand</a> should be used instead.
     * 
     * For more information on how to set a property key for a specific control, see the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-entry">Windows Ribbon Framework Control Library</a> page for that control.
     * @param {Integer} commandId Type: <b>UINT32</b>
     * 
     * The ID for the Command, which is specified in the Markup resource file.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * The property key of the command property, value, or state.
     * @param {Pointer<PROPVARIANT>} value Type: <b>PROPVARIANT</b>
     * 
     * The property, value, or state.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, otherwise an error value from the following list.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</td>
     * <td>The property, value, or state does not support <b>IUIFramework::SetUICommandProperty</b>. 
     * 					They may support being set through invalidation only.
     * 				</td>
     * </tr>
     * <tr>
     * <td>E_FAIL</td>
     * <td>The operation failed.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiframework-setuicommandproperty
     */
    SetUICommandProperty(commandId, key, value) {
        result := ComCall(8, this, "uint", commandId, "ptr", key, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Invalidates a Windows Ribbon framework Command property, value, or state.
     * @remarks
     * Resources defined in the Ribbon framework markup are stored in a resource table that is created 
     * 				when the markup file is compiled into binary format. A resource cannot be reinstated from the Markup resource table after it has been invalidated.
     * 
     * After invalidation, the framework queries the host application for the resource details. 
     * 				
     * 			
     * 
     * When a Command value is invalidated (<i>flags</i> contains UI_INVALIDATIONS_VALUE) the value of <i>key</i> is <b>NULL</b>.
     * 
     * If <b>IUIFramework::InvalidateUICommand</b> is called multiple times
     * 				and the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_invalidations">UI_INVALIDATIONS</a> 
     * 				value passed in each call specifies overlapping properties, such as <b>UI_INVALIDATIONS_STATE</b> 
     * 				and <b>UI_INVALIDATIONS_ALLPROPERTIES</b>, then only one callback to the host application is created.
     * @param {Integer} commandId Type: <b>UINT32</b>
     * 
     * The ID for the Command, which is specified in the markup resource file.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_invalidations">UI_INVALIDATIONS</a></b>
     * 
     * Identifies which <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_invalidations">aspect</a> of a command to invalidate.
     * 					
     * 
     * <div class="alert"><b>Note</b>  Passing <b>UI_INVALIDATIONS_ALLPROPERTIES</b> invalidates all properties bound to a command, including value and state.
     * 					</div>
     * <div> </div>
     * @param {Pointer<PROPERTYKEY>} key Type: <b>const PROPERTYKEY*</b>
     * 
     * The property key of the command property or state.
     * 				This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful; otherwise, an error value from the following list.
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid value for <i>key</i> was supplied.
     * 				</td>
     * </tr>
     * <tr>
     * <td>E_FAIL</td>
     * <td>The operation failed. 
     * 					All the commands failed to invalidate, or none of the properties specified are supported.
     * 				</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiframework-invalidateuicommand
     */
    InvalidateUICommand(commandId, flags, key) {
        result := ComCall(9, this, "uint", commandId, "int", flags, "ptr", key, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Processes all pending Command updates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful; otherwise, an error value.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiframework-flushpendinginvalidations
     */
    FlushPendingInvalidations() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the application modes to enable.
     * @remarks
     * A mode indicates the functionality required and, therefore, which elements should be displayed (or 
     * 				hidden) at run time, depending on the state or context of an application. For example, network connectivity 
     * 				may directly impact the functionality of an application and require a "Network" mode of 
     * 				network-related commands whenever a connection is detected.
     * 			
     * 
     * Modes are specified for elements in the Ribbon markup and bound to individual controls at run time.
     * 			
     * 
     * Modes can be applied to a Ribbon <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-tab">Tab</a> and <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-group">Group</a>. 
     * 				
     * 
     * <div class="alert"><b>Note</b>  Modes can be applied to <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-button">Button</a>, <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-splitbutton">SplitButton</a>, and <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-dropdownbutton">DropDownButton</a> controls when hosted in the left 
     * 				column of the Application Menu. 
     * 				</div>
     * <div> </div>
     * @param {Integer} iModes Type: <b>INT32</b>
     * 
     * A bit mask that identifies the modes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiframework-setmodes
     */
    SetModes(iModes) {
        result := ComCall(11, this, "int", iModes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
