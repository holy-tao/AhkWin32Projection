#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IAcrylicBrushStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAcrylicBrushStatics
     * @type {Guid}
     */
    static IID => Guid("{2787fd79-a3da-423f-b81a-599147971523}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundSourceProperty", "get_TintColorProperty", "get_TintOpacityProperty", "get_TintTransitionDurationProperty", "get_AlwaysUseFallbackProperty"]

    /**
     * @type {DependencyProperty} 
     */
    BackgroundSourceProperty {
        get => this.get_BackgroundSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TintColorProperty {
        get => this.get_TintColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TintOpacityProperty {
        get => this.get_TintOpacityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TintTransitionDurationProperty {
        get => this.get_TintTransitionDurationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlwaysUseFallbackProperty {
        get => this.get_AlwaysUseFallbackProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BackgroundSourceProperty() {
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
    get_TintColorProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TintOpacityProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TintTransitionDurationProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlwaysUseFallbackProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
