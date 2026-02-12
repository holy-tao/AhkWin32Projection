#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to controls that act as containers for a collection of child elements. The children of this element must implement [ITableItemProvider](itableitemprovider.md) and be organized in a two-dimensional logical coordinate system that can be traversed (a Microsoft UI Automation client can move to adjacent controls, which are headers or cells of the table) by using the keyboard.
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [Table Control Pattern](/windows/desktop/WinAuto/uiauto-implementingtable).
 * 
 * ITableProvider isn't implemented by any existing Windows Runtime automation peers. The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * Use [TablePatternIdentifiers](../windows.ui.xaml.automation/tablepatternidentifiers.md) if you want to reference the ITableProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itableprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITableProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITableProvider
     * @type {Guid}
     */
    static IID => Guid("{7a8ed399-6824-4595-bab3-464bc9a04417}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RowOrColumnMajor", "GetColumnHeaders", "GetRowHeaders"]

    /**
     * Gets the primary direction of traversal for the table.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itableprovider.roworcolumnmajor
     * @type {Integer} 
     */
    RowOrColumnMajor {
        get => this.get_RowOrColumnMajor()
    }

    /**
     * Specifies the primary direction of traversal for the table.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itableprovider-get_roworcolumnmajor
     */
    get_RowOrColumnMajor() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets a collection of Microsoft UI Automation providers that represents all the column headers in a table.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itableprovider-getcolumnheaders
     */
    GetColumnHeaders(result_) {
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a collection of Microsoft UI Automation providers that represents all the row headers in a table.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itableprovider-getrowheaders
     */
    GetRowHeaders(result_) {
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
