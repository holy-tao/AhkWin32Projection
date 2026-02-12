#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IColorAnimationUsingKeyFramesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorAnimationUsingKeyFramesStatics
     * @type {Guid}
     */
    static IID => Guid("{b4723cdc-96e9-48f9-8d92-9b648b2f1cc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnableDependentAnimationProperty"]

    /**
     * @type {DependencyProperty} 
     */
    EnableDependentAnimationProperty {
        get => this.get_EnableDependentAnimationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EnableDependentAnimationProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
