#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CoreIndependentInputSourceController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreIndependentInputSourceControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreIndependentInputSourceControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{3edc4e20-9a8a-5691-8586-fca4cb57526d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForVisual", "CreateForIVisualElement"]

    /**
     * 
     * @param {Visual} visual_ 
     * @returns {CoreIndependentInputSourceController} 
     */
    CreateForVisual(visual_) {
        result := ComCall(6, this, "ptr", visual_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreIndependentInputSourceController(result_)
    }

    /**
     * 
     * @param {IVisualElement} visualElement_ 
     * @returns {CoreIndependentInputSourceController} 
     */
    CreateForIVisualElement(visualElement_) {
        result := ComCall(7, this, "ptr", visualElement_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreIndependentInputSourceController(result_)
    }
}
