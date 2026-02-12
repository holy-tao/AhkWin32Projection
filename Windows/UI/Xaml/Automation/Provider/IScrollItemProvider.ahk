#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by Microsoft UI Automation client to individual child controls of containers that implement [IScrollProvider](iscrollprovider.md). Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.ScrollItem](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This control pattern acts as a communication channel between a child control and its container to ensure that the container can change the currently visible content (or region) within its viewport to display the child control. The pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [ScrollItem Control Pattern](/windows/desktop/WinAuto/uiauto-implementingscrollitem).
 * 
 * IScrollItemProvider is implemented by these existing Windows Runtime classes:
 * + [ComboBoxItemDataAutomationPeer](../windows.ui.xaml.automation.peers/comboboxitemdataautomationpeer.md)
 * + [FlipViewItemDataAutomationPeer](../windows.ui.xaml.automation.peers/flipviewitemdataautomationpeer.md)
 * + [ListBoxItemDataAutomationPeer](../windows.ui.xaml.automation.peers/listboxitemdataautomationpeer.md)
 * + internal base class of [ListViewItemDataAutomationPeer](../windows.ui.xaml.automation.peers/listviewitemdataautomationpeer.md) and [GridViewItemDataAutomationPeer](../windows.ui.xaml.automation.peers/gridviewitemdataautomationpeer.md)
 * 
 * 
 * The IScrollItemProvider pattern doesn't have a pattern property identifier class, the only API to implement is [ScrollIntoView](iscrollitemprovider_scrollintoview_1265805467.md), a method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iscrollitemprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IScrollItemProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollItemProvider
     * @type {Guid}
     */
    static IID => Guid("{9a3ec090-5d2c-4e42-9ee6-9d58db100b55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ScrollIntoView"]

    /**
     * Scrolls the content area of a container object in order to display the control within the visible region (viewport) of the container.
     * @remarks
     * This method will not guarantee the position of the control 
     *             within the visible region (viewport) of the container.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iscrollitemprovider-scrollintoview
     */
    ScrollIntoView() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
