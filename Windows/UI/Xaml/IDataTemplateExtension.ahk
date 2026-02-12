#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines helper methods for phased rendering of a data template.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.idatatemplateextension
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDataTemplateExtension extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTemplateExtension
     * @type {Guid}
     */
    static IID => Guid("{595e9547-cdff-4b92-b773-ab396878f353}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResetTemplate", "ProcessBinding", "ProcessBindings"]

    /**
     * Disconnects any event listeners so the data template can be recycled.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.idatatemplateextension.resettemplate
     */
    ResetTemplate() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides phased rendering of bound data in a data template.
     * @param {Integer} phase Gets the number of times the method has been called.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.idatatemplateextension.processbinding
     */
    ProcessBinding(phase) {
        result := ComCall(7, this, "uint", phase, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Updates a list item container element with bound data.
     * @param {ContainerContentChangingEventArgs} arg Information about the item, item index, and rendering phase.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.idatatemplateextension.processbindings
     */
    ProcessBindings(arg) {
        result := ComCall(8, this, "ptr", arg, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
