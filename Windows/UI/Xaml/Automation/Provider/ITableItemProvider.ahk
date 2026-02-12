#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support Microsoft UI Automation client access to child controls of containers that implement [ITableProvider](itableprovider.md). Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.TableItem](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [TableItem Control Pattern](/windows/desktop/WinAuto/uiauto-implementingtableitem).
 * 
 * ITableItemProvider isn't implemented by any existing Windows Runtime automation peers. The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * Use the [TableItemPatternIdentifiers](../windows.ui.xaml.automation/tableitempatternidentifiers.md) if you want to reference the ITableItemProvider pattern properties from control code when you call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itableitemprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITableItemProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITableItemProvider
     * @type {Guid}
     */
    static IID => Guid("{3b2c49cd-1de2-4ee2-a3e1-fb553559d15d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColumnHeaderItems", "GetRowHeaderItems"]

    /**
     * Retrieves a collection of Microsoft UI Automation provider representing all the column headers associated with a table item or cell.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itableitemprovider-getcolumnheaderitems
     */
    GetColumnHeaderItems(result_) {
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a collection of Microsoft UI Automation provider representing all the row headers associated with a table item or cell.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itableitemprovider-getrowheaderitems
     */
    GetRowHeaderItems(result_) {
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
