#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */

;@region Functions
/**
 * Creates a presentation factory.
 * @param {IUnknown} d3dDevice Type: **[IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown)\***
 * 
 * The D3D device the presentation factory is bound to.
 * @param {Pointer<Guid>} riid Type: **REFIID**
 * 
 * A reference to the interface identifier (IID) of the presentation factory.
 * @returns {Pointer<Void>} Type: **[void](/windows/desktop/winprog/windows-data-types)\*\***
 * 
 * The address of a pointer to an interface with the IID specified in the *riid* parameter.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-createpresentationfactory
 */
export CreatePresentationFactory(d3dDevice, riid) {
    result := DllCall("dcomp.dll\CreatePresentationFactory", "ptr", d3dDevice, Guid.Ptr, riid, "ptr*", &presentationFactory := 0, "HRESULT")
    return presentationFactory
}

;@endregion Functions
