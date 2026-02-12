#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarButtonStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarButtonStatics4
     * @type {Guid}
     */
    static IID => Guid("{1c0ae26a-c755-4fe6-a3b6-0e3394e952c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyboardAcceleratorTextOverrideProperty"]

    /**
     * @type {DependencyProperty} 
     */
    KeyboardAcceleratorTextOverrideProperty {
        get => this.get_KeyboardAcceleratorTextOverrideProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KeyboardAcceleratorTextOverrideProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
