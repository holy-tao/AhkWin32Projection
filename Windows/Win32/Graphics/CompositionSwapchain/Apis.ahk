#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class CompositionSwapchain {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {IUnknown} d3dDevice 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-createpresentationfactory
     */
    static CreatePresentationFactory(d3dDevice, riid) {
        result := DllCall("dcomp.dll\CreatePresentationFactory", "ptr", d3dDevice, "ptr", riid, "ptr*", &presentationFactory := 0, "int")
        if(result != 0)
            throw OSError(result)

        return presentationFactory
    }

;@endregion Methods
}
