#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarCustomPenButtonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarCustomPenButtonStatics
     * @type {Guid}
     */
    static IID => Guid("{373c25f4-e555-4e85-a80d-da6b8433dbde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CustomPenProperty", "get_ConfigurationContentProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CustomPenProperty {
        get => this.get_CustomPenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ConfigurationContentProperty {
        get => this.get_ConfigurationContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CustomPenProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ConfigurationContentProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
