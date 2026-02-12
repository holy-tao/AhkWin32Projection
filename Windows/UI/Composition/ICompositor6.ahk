#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionGeometricClip.ahk
#Include .\RedirectVisual.ahk
#Include .\BooleanKeyFrameAnimation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositor6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositor6
     * @type {Guid}
     */
    static IID => Guid("{7a38b2bd-cec8-4eeb-830f-d8d07aedebc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateGeometricClip", "CreateGeometricClipWithGeometry", "CreateRedirectVisual", "CreateRedirectVisualWithSourceVisual", "CreateBooleanKeyFrameAnimation"]

    /**
     * 
     * @returns {CompositionGeometricClip} 
     */
    CreateGeometricClip() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionGeometricClip(result_)
    }

    /**
     * 
     * @param {CompositionGeometry} geometry_ 
     * @returns {CompositionGeometricClip} 
     */
    CreateGeometricClipWithGeometry(geometry_) {
        result := ComCall(7, this, "ptr", geometry_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionGeometricClip(result_)
    }

    /**
     * 
     * @returns {RedirectVisual} 
     */
    CreateRedirectVisual() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RedirectVisual(result_)
    }

    /**
     * 
     * @param {Visual} source 
     * @returns {RedirectVisual} 
     */
    CreateRedirectVisualWithSourceVisual(source) {
        result := ComCall(9, this, "ptr", source, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RedirectVisual(result_)
    }

    /**
     * 
     * @returns {BooleanKeyFrameAnimation} 
     */
    CreateBooleanKeyFrameAnimation() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BooleanKeyFrameAnimation(result_)
    }
}
