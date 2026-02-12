#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IBooleanKeyFrameAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBooleanKeyFrameAnimation
     * @type {Guid}
     */
    static IID => Guid("{95e23a08-d1f4-4972-9770-3efe68d82e14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertKeyFrame"]

    /**
     * 
     * @param {Float} normalizedProgressKey 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    InsertKeyFrame(normalizedProgressKey, value) {
        result := ComCall(6, this, "float", normalizedProgressKey, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
