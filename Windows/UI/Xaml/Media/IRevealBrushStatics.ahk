#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IRevealBrushStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRevealBrushStatics
     * @type {Guid}
     */
    static IID => Guid("{190f2625-7209-4d42-a847-1ac4bbbb3499}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColorProperty", "get_TargetThemeProperty", "get_AlwaysUseFallbackProperty", "get_StateProperty", "SetState", "GetState"]

    /**
     * @type {DependencyProperty} 
     */
    ColorProperty {
        get => this.get_ColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TargetThemeProperty {
        get => this.get_TargetThemeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlwaysUseFallbackProperty {
        get => this.get_AlwaysUseFallbackProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StateProperty {
        get => this.get_StateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ColorProperty() {
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
    get_TargetThemeProperty() {
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
    get_AlwaysUseFallbackProperty() {
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
    get_StateProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetState(element, value) {
        result := ComCall(10, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @param {UIElement} element 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetState(element) {
        result := ComCall(11, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
