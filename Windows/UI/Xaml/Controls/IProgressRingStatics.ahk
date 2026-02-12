#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IProgressRingStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProgressRingStatics
     * @type {Guid}
     */
    static IID => Guid("{e8b62507-4e2c-47d5-a54a-c6c48a5e6989}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsActiveProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsActiveProperty {
        get => this.get_IsActiveProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsActiveProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
