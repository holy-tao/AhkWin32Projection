#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes a method to support Microsoft UI Automation access to controls that initiate or perform a single, unambiguous action and do not maintain state when activated. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Invoke](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * An example of a control that meets the guidelines of IInvokeProvider is [Button](../windows.ui.xaml.controls/button.md). Controls that do maintain state, such as check boxes and radio buttons, must instead implement [IToggleProvider](itoggleprovider.md) and [ISelectionProvider](iselectionprovider.md) respectively. Controls implement IInvokeProvider if the same behavior is not exposed through another control pattern provider. For more info on what this pattern is for, see [Invoke Control Pattern](/windows/desktop/WinAuto/uiauto-implementinginvoke).
 * 
 * IInvokeProvider is implemented by the existing Windows Runtime automation peers for [Button](../windows.ui.xaml.controls/button.md) ([ButtonAutomationPeer](../windows.ui.xaml.automation.peers/buttonautomationpeer.md)), [RepeatButton](../windows.ui.xaml.controls.primitives/repeatbutton.md) ([RepeatButtonAutomationPeer](../windows.ui.xaml.automation.peers/repeatbuttonautomationpeer.md)) and [HyperlinkButton](../windows.ui.xaml.controls/hyperlinkbutton.md) ([HyperlinkButtonAutomationPeer](../windows.ui.xaml.automation.peers/hyperlinkbuttonautomationpeer.md)).
 * 
 * If you implement IInvokeProvider for a list/list items scenario and a control that uses [ListViewBase](../windows.ui.xaml.controls/listviewbase.md), implement IInvokeProvider for the list and not for individual items.
 * 
 * The IInvokeProvider pattern doesn't have a pattern property identifier class, the only API to implement is [Invoke](iinvokeprovider_invoke_1893356988.md), a method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iinvokeprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IInvokeProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInvokeProvider
     * @type {Guid}
     */
    static IID => Guid("{f7d1a187-b13c-4540-b09e-6778e2dc9ba5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

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
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
