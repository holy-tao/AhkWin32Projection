#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class INavigationThemeTransitionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationThemeTransitionStatics
     * @type {Guid}
     */
    static IID => Guid("{ea2f06e0-5e60-4f8e-bcaf-431487a294ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultNavigationTransitionInfoProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DefaultNavigationTransitionInfoProperty {
        get => this.get_DefaultNavigationTransitionInfoProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DefaultNavigationTransitionInfoProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
