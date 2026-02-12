#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IConnectedAnimation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectedAnimation2
     * @type {Guid}
     */
    static IID => Guid("{5d2f8e5c-584b-4ddd-b668-973891431459}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsScaleAnimationEnabled", "put_IsScaleAnimationEnabled", "TryStartWithCoordinatedElements", "SetAnimationComponent"]

    /**
     * @type {Boolean} 
     */
    IsScaleAnimationEnabled {
        get => this.get_IsScaleAnimationEnabled()
        set => this.put_IsScaleAnimationEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScaleAnimationEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsScaleAnimationEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {UIElement} destination 
     * @param {IIterable<UIElement>} coordinatedElements 
     * @returns {Boolean} 
     */
    TryStartWithCoordinatedElements(destination, coordinatedElements) {
        result := ComCall(8, this, "ptr", destination, "ptr", coordinatedElements, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} component_ 
     * @param {ICompositionAnimationBase} animation 
     * @returns {HRESULT} 
     */
    SetAnimationComponent(component_, animation) {
        result := ComCall(9, this, "int", component_, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
