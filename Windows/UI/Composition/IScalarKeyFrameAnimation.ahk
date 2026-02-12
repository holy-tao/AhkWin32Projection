#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IScalarKeyFrameAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScalarKeyFrameAnimation
     * @type {Guid}
     */
    static IID => Guid("{ae288fa9-252c-4b95-a725-bf85e38000a1}")

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
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    InsertKeyFrame(normalizedProgressKey, value) {
        result := ComCall(6, this, "float", normalizedProgressKey, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} normalizedProgressKey 
     * @param {Float} value 
     * @param {CompositionEasingFunction} easingFunction 
     * @returns {HRESULT} 
     */
    InsertKeyFrameWithEasingFunction(normalizedProgressKey, value, easingFunction) {
        result := ComCall(7, this, "float", normalizedProgressKey, "float", value, "ptr", easingFunction, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
