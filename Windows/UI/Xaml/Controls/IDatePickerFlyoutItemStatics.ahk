#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDatePickerFlyoutItemStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatePickerFlyoutItemStatics
     * @type {Guid}
     */
    static IID => Guid("{aa9c91da-07f6-4cdf-89b4-dda3bdb0ea6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrimaryTextProperty", "get_SecondaryTextProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PrimaryTextProperty {
        get => this.get_PrimaryTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SecondaryTextProperty {
        get => this.get_SecondaryTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PrimaryTextProperty() {
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
    get_SecondaryTextProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
