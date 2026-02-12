#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarDatePickerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarDatePickerStatics3
     * @type {Guid}
     */
    static IID => Guid("{b188741d-cf69-568c-9707-baaaec2b64db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DescriptionProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DescriptionProperty {
        get => this.get_DescriptionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DescriptionProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
