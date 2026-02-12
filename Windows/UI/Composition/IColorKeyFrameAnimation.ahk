#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IColorKeyFrameAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorKeyFrameAnimation
     * @type {Guid}
     */
    static IID => Guid("{93adb5e9-8e05-4593-84a3-dca152781e56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InterpolationColorSpace", "put_InterpolationColorSpace", "InsertKeyFrame", "InsertKeyFrameWithEasingFunction"]

    /**
     * @type {Integer} 
     */
    InterpolationColorSpace {
        get => this.get_InterpolationColorSpace()
        set => this.put_InterpolationColorSpace(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InterpolationColorSpace() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InterpolationColorSpace(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} normalizedProgressKey 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    InsertKeyFrame(normalizedProgressKey, value) {
        result := ComCall(8, this, "float", normalizedProgressKey, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} normalizedProgressKey 
     * @param {Color} value 
     * @param {CompositionEasingFunction} easingFunction 
     * @returns {HRESULT} 
     */
    InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction) {
        result := ComCall(9, this, "float", normalizedProgressKey, "ptr", value, "ptr", easingFunction, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
