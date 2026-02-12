#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\PalmRejectionDelayZonePreview.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Preview
 * @version WindowsRuntime 1.4
 */
class IPalmRejectionDelayZonePreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPalmRejectionDelayZonePreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{cdef5ee0-93d0-53a9-8f0e-9a379f8f7530}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForVisual", "CreateForVisualWithViewportClip"]

    /**
     * 
     * @param {Visual} inputPanelVisual 
     * @param {RECT} inputPanelRect 
     * @returns {PalmRejectionDelayZonePreview} 
     */
    CreateForVisual(inputPanelVisual, inputPanelRect) {
        result := ComCall(6, this, "ptr", inputPanelVisual, "ptr", inputPanelRect, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PalmRejectionDelayZonePreview(result_)
    }

    /**
     * 
     * @param {Visual} inputPanelVisual 
     * @param {RECT} inputPanelRect 
     * @param {Visual} viewportVisual 
     * @param {RECT} viewportRect 
     * @returns {PalmRejectionDelayZonePreview} 
     */
    CreateForVisualWithViewportClip(inputPanelVisual, inputPanelRect, viewportVisual, viewportRect) {
        result := ComCall(7, this, "ptr", inputPanelVisual, "ptr", inputPanelRect, "ptr", viewportVisual, "ptr", viewportRect, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PalmRejectionDelayZonePreview(result_)
    }
}
