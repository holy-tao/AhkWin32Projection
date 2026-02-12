#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IPathKeyFrameAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPathKeyFrameAnimation
     * @type {Guid}
     */
    static IID => Guid("{9d0d18c9-1576-4b3f-be60-1d5031f5e71b}")

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
     * @param {CompositionPath} path_ 
     * @returns {HRESULT} 
     */
    InsertKeyFrame(normalizedProgressKey, path_) {
        result := ComCall(6, this, "float", normalizedProgressKey, "ptr", path_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} normalizedProgressKey 
     * @param {CompositionPath} path_ 
     * @param {CompositionEasingFunction} easingFunction 
     * @returns {HRESULT} 
     */
    InsertKeyFrameWithEasingFunction(normalizedProgressKey, path_, easingFunction) {
        result := ComCall(7, this, "float", normalizedProgressKey, "ptr", path_, "ptr", easingFunction, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
