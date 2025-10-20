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
     * @param {Pointer<Pointer<Void>>} presentationFactory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-createpresentationfactory
     */
    static CreatePresentationFactory(d3dDevice, riid, presentationFactory) {
        result := DllCall("dcomp.dll\CreatePresentationFactory", "ptr", d3dDevice, "ptr", riid, "ptr*", presentationFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
