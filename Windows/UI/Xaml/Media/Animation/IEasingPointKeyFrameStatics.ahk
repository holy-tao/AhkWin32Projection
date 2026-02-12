#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IEasingPointKeyFrameStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEasingPointKeyFrameStatics
     * @type {Guid}
     */
    static IID => Guid("{e22dbfc4-080c-402c-a6b5-f48d0a98116b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EasingFunctionProperty"]

    /**
     * @type {DependencyProperty} 
     */
    EasingFunctionProperty {
        get => this.get_EasingFunctionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EasingFunctionProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
