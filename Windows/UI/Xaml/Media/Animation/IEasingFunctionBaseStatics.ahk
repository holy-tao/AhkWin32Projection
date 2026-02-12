#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IEasingFunctionBaseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEasingFunctionBaseStatics
     * @type {Guid}
     */
    static IID => Guid("{2a5031aa-2c50-4a1d-bb04-d75e07b71548}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EasingModeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    EasingModeProperty {
        get => this.get_EasingModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EasingModeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
