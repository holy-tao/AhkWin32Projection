#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ISlideNavigationTransitionInfoStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISlideNavigationTransitionInfoStatics2
     * @type {Guid}
     */
    static IID => Guid("{8a861baa-981a-5ace-9f85-cb7fde648a67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EffectProperty"]

    /**
     * @type {DependencyProperty} 
     */
    EffectProperty {
        get => this.get_EffectProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EffectProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
