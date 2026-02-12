#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IQuaternionKeyFrameAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQuaternionKeyFrameAnimation
     * @type {Guid}
     */
    static IID => Guid("{404e5835-ecf6-4240-8520-671279cf36bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertKeyFrame", "InsertKeyFrameWithEasingFunction"]

    /**
     * 
     * @param {Float} normalizedProgressKey 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    InsertKeyFrame(normalizedProgressKey, value) {
        result := ComCall(6, this, "float", normalizedProgressKey, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} normalizedProgressKey 
     * @param {Quaternion} value 
     * @param {CompositionEasingFunction} easingFunction 
     * @returns {HRESULT} 
     */
    InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction) {
        result := ComCall(7, this, "float", normalizedProgressKey, "ptr", value, "ptr", easingFunction, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
