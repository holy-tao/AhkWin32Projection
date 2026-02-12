#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IReference.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include .\EasingFunctionBase.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IColorAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorAnimation
     * @type {Guid}
     */
    static IID => Guid("{b8ae8a15-0f63-4694-9467-bdafac1253ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_From", "put_From", "get_To", "put_To", "get_By", "put_By", "get_EasingFunction", "put_EasingFunction", "get_EnableDependentAnimation", "put_EnableDependentAnimation"]

    /**
     * @type {IReference<Color>} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * @type {IReference<Color>} 
     */
    By {
        get => this.get_By()
        set => this.put_By(value)
    }

    /**
     * @type {EasingFunctionBase} 
     */
    EasingFunction {
        get => this.get_EasingFunction()
        set => this.put_EasingFunction(value)
    }

    /**
     * @type {Boolean} 
     */
    EnableDependentAnimation {
        get => this.get_EnableDependentAnimation()
        set => this.put_EnableDependentAnimation(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_From() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_To() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_To(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_By() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetColor(), value)
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_By(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {EasingFunctionBase} 
     */
    get_EasingFunction() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EasingFunctionBase(value)
    }

    /**
     * 
     * @param {EasingFunctionBase} value 
     * @returns {HRESULT} 
     */
    put_EasingFunction(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableDependentAnimation() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_EnableDependentAnimation(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
