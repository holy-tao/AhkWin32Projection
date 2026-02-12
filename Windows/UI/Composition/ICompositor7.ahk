#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\System\DispatcherQueue.ahk
#Include .\AnimationPropertyInfo.ahk
#Include .\RectangleClip.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositor7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositor7
     * @type {Guid}
     */
    static IID => Guid("{d3483fad-9a12-53ba-bfc8-88b7ff7977c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DispatcherQueue", "CreateAnimationPropertyInfo", "CreateRectangleClip", "CreateRectangleClipWithSides", "CreateRectangleClipWithSidesAndRadius"]

    /**
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DispatcherQueue(value)
    }

    /**
     * 
     * @returns {AnimationPropertyInfo} 
     */
    CreateAnimationPropertyInfo() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AnimationPropertyInfo(result_)
    }

    /**
     * 
     * @returns {RectangleClip} 
     */
    CreateRectangleClip() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RectangleClip(result_)
    }

    /**
     * 
     * @param {Float} left 
     * @param {Float} top 
     * @param {Float} right 
     * @param {Float} bottom 
     * @returns {RectangleClip} 
     */
    CreateRectangleClipWithSides(left, top, right, bottom) {
        result := ComCall(9, this, "float", left, "float", top, "float", right, "float", bottom, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RectangleClip(result_)
    }

    /**
     * 
     * @param {Float} left 
     * @param {Float} top 
     * @param {Float} right 
     * @param {Float} bottom 
     * @param {Vector2} topLeftRadius 
     * @param {Vector2} topRightRadius 
     * @param {Vector2} bottomRightRadius 
     * @param {Vector2} bottomLeftRadius 
     * @returns {RectangleClip} 
     */
    CreateRectangleClipWithSidesAndRadius(left, top, right, bottom, topLeftRadius, topRightRadius, bottomRightRadius, bottomLeftRadius) {
        result := ComCall(10, this, "float", left, "float", top, "float", right, "float", bottom, "ptr", topLeftRadius, "ptr", topRightRadius, "ptr", bottomRightRadius, "ptr", bottomLeftRadius, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RectangleClip(result_)
    }
}
