#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that initiate or perform a single, unambiguous action and do not maintain state when activated.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must 
 *         support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinginvoke">Invoke</a> control pattern.
 * 		
 * 
 * Controls implement <b>IInvokeProvider</b> if the same behavior is not 
 *         exposed through another  control pattern provider. For example, if 
 *         the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iinvokeprovider-invoke">Invoke</a> method of a control performs the same 
 *         action as the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-expand">IExpandCollapseProvider::Expand</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-collapse">Collapse</a> 
 *         method, the control should not also implement <b>IInvokeProvider</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nn-uiautomationcore-iinvokeprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IInvokeProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInvokeProvider
     * @type {Guid}
     */
    static IID => Guid("{54fcb24b-e18e-47a2-b4d3-eccbe77599a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Sends a request to activate a control and initiate its single, unambiguous action. (IInvokeProvider.Invoke)
     * @remarks
     * <b>IInvokeProvider::Invoke</b> is an asynchronous call and must return immediately without blocking. 
     *         
     * 
     * <div class="alert"><b>Note</b>  This is particularly critical for controls that, directly or indirectly, launch a modal dialog when invoked. 
     *         Any Microsoft UI Automation client that instigated the event will remain blocked until the modal dialog is closed.
     *         </div>
     * <div> </div>
     * <b>IInvokeProvider::Invoke</b> raises the Invoked event after the control 
     * 			has completed its associated action, if possible. 
     *             
     * 
     * The event should be raised before servicing the Invoke request 
     * 			in the following scenarios:
     * 	
     * 
     * <ul>
     * <li>It is not possible or practical to wait until the action is complete.</li>
     * <li>The action requires user interaction.</li>
     * <li>The action is time-consuming and will cause the calling client to block for a significant length of time.
     * </li>
     * </ul>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iinvokeprovider-invoke
     */
    Invoke() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
