#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IComboBoxStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBoxStatics4
     * @type {Guid}
     */
    static IID => Guid("{d9f58358-f7b0-46ce-8061-ad83ec2f2dd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionChangedTriggerProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectionChangedTriggerProperty {
        get => this.get_SelectionChangedTriggerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionChangedTriggerProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
