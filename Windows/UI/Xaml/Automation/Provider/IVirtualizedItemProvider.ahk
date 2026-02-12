#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes a method to support the virtualized item control pattern. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.VirtualizedItem](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * Controls that contain a large number of child items can use virtualization to efficiently manage the items. With virtualization, the control maintains full information in memory for only a subset of items at any given time. Typically, the subset includes only those items that are currently visible to the user. Full information about the remaining virtualized items is kept in storage and is loaded into memory, or realized, as the control needs it, for example, as new items become visible to the user. For more info on this pattern, see [VirtualizedItem Control Pattern](/windows/desktop/WinAuto/uiauto-implementingvirtualizeditem).
 * 
 * IVirtualizedItemProvider is implemented by the Windows Runtime automation peer base class [ItemAutomationPeer](../windows.ui.xaml.automation.peers/itemautomationpeer.md).
 * 
 * The IVirtualizedItemProvider pattern doesn't have a pattern property identifier class, the only API to implement is a method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.ivirtualizeditemprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IVirtualizedItemProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualizedItemProvider
     * @type {Guid}
     */
    static IID => Guid("{17d4a04b-d658-48e0-a574-5a516c58dfa7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Realize"]

    /**
     * Makes the virtual item fully accessible as a UI Automation element. (IVirtualizedItemProvider.Realize)
     * @remarks
     * When an item is obtained from a virtual list, it is only a placeholder. Use this method to convert it to a full reference to UI Automation element.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-ivirtualizeditemprovider-realize
     */
    Realize() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
