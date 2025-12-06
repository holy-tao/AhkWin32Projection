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
     * Creates a presentation factory.
     * @param {IUnknown} d3dDevice Type: **[IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown)\***
     * 
     * The D3D device the presentation factory is bound to.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the interface identifier (IID) of the presentation factory.
     * @returns {Pointer<Pointer<Void>>} Type: **[void](/windows/desktop/winprog/windows-data-types)\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-createpresentationfactory
     */
    static CreatePresentationFactory(d3dDevice, riid) {
        result := DllCall("dcomp.dll\CreatePresentationFactory", "ptr", d3dDevice, "ptr", riid, "ptr*", &presentationFactory := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return presentationFactory
    }

;@endregion Methods
}
