#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIFramework interface is implemented by the Windows Ribbon framework and defines the methods that provide the core functionality for the framework.
 * @remarks
 * 
 * This interface is used to initialize and dismantle the Ribbon framework.
 * 
 * Ribbon framework UI functionality is differentiated by Views, which are essentially 
 * 				built-in core controls, such as the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> and <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextpopup">ContextPopup</a>.
 * 
 * To get an interface pointer to the implementation of IUIFramework, use <a href="https://docs.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>to 
 * 			create a COM object with the class identifier (CLSID) of CLSID_UIRibbonFramework.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuiframework
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
     * @param {HWND} frameWnd Type: <b>HWND</b>
     * 
     * Handle to the top-level window that will contain the Ribbon.
     * @param {IUIApplication} application Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiapplication">IUIApplication</a>*</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiframework-initialize
     */
    Initialize(frameWnd, application) {
        frameWnd := frameWnd is Win32Handle ? NumGet(frameWnd, "ptr") : frameWnd

        result := ComCall(3, this, "ptr", frameWnd, "ptr", application, "HRESULT")
        return result
    }

    /**
     * Terminates and releases all objects, hooks, and references for an instance of the Windows Ribbon framework.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiframework-destroy
     */
    Destroy() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Loads the Windows Ribbon framework UI resource, or compiled markup, file.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiframework-loadui
     */
    LoadUI(instance, resourceName) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance
        resourceName := resourceName is String ? StrPtr(resourceName) : resourceName

        result := ComCall(5, this, "ptr", instance, "ptr", resourceName, "HRESULT")
        return result
    }

    /**
     * Retrieves the address of a pointer to an interface that represents a Windows Ribbon framework View, such as IUIRibbon or IUIContextualUI.
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
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiframework-getview
     */
    GetView(viewId, riid) {
        result := ComCall(6, this, "uint", viewId, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiframework-getuicommandproperty
     */
    GetUICommandProperty(commandId, key) {
        value := PROPVARIANT()
        result := ComCall(7, this, "uint", commandId, "ptr", key, "ptr", value, "HRESULT")
        return value
    }

    /**
     * Sets a command property, value, or state.
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
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiframework-setuicommandproperty
     */
    SetUICommandProperty(commandId, key, value) {
        result := ComCall(8, this, "uint", commandId, "ptr", key, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Invalidates a Windows Ribbon framework Command property, value, or state.
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
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiframework-invalidateuicommand
     */
    InvalidateUICommand(commandId, flags, key) {
        result := ComCall(9, this, "uint", commandId, "int", flags, "ptr", key, "HRESULT")
        return result
    }

    /**
     * Processes all pending Command updates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful; otherwise, an error value.
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiframework-flushpendinginvalidations
     */
    FlushPendingInvalidations() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Specifies the application modes to enable.
     * @param {Integer} iModes Type: <b>INT32</b>
     * 
     * A bit mask that identifies the modes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nf-uiribbon-iuiframework-setmodes
     */
    SetModes(iModes) {
        result := ComCall(11, this, "int", iModes, "HRESULT")
        return result
    }
}
