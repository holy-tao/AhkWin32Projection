#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITimePickerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimePickerStatics3
     * @type {Guid}
     */
    static IID => Guid("{cfef1763-ba87-54d8-82d4-7c6b9734dc9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedTimeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectedTimeProperty {
        get => this.get_SelectedTimeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedTimeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
