#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPickerFlyoutStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPickerFlyoutStatics
     * @type {Guid}
     */
    static IID => Guid("{af18a436-f38a-4abd-b933-6286c115b07f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentProperty", "get_ConfirmationButtonsVisibleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ContentProperty {
        get => this.get_ContentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ConfirmationButtonsVisibleProperty {
        get => this.get_ConfirmationButtonsVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContentProperty() {
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
    get_ConfirmationButtonsVisibleProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
