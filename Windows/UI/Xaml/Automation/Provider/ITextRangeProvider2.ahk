#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends the [ITextRange](itextrangeprovider.md) interface to enable Microsoft UI Automation providers to programmatically open context menus that are contextual to text input operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itextrangeprovider2
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITextRangeProvider2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextRangeProvider2
     * @type {Guid}
     */
    static IID => Guid("{d3be3dfb-9f54-4642-a7a5-5c18d5ee2a3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContextMenu"]

    /**
     * Programmatically invokes a context menu on the target element. (ITextRangeProvider2.ShowContextMenu)
     * @remarks
     * This method should return an error code if the context menu could not be invoked.
     * 
     * <b>ShowContextMenu</b> should always show the context menu at the beginning end point of the range.  This should be equivalent to what would happen if the user pressed the context menu key or SHIFT + F10 with the insertion point at the beginning of the range.
     * 
     * If showing the context menu would typically result in the insertion point moving to a given location, then it should do so for programmatically invoking <b>ShowContextMenu</b> for Microsoft UI Automation support also.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider2-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
