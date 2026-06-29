#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\DSCBUFFERDESC.ahk" { DSCBUFFERDESC }
#Import ".\IDirectSoundBuffer8.ahk" { IDirectSoundBuffer8 }
#Import ".\IDirectSoundCapture.ahk" { IDirectSoundCapture }
#Import ".\IDirectSound8.ahk" { IDirectSound8 }
#Import ".\IDirectSoundCaptureBuffer8.ahk" { IDirectSoundCaptureBuffer8 }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IDirectSound.ahk" { IDirectSound }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DSBUFFERDESC.ahk" { DSBUFFERDESC }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDirectSoundFullDuplex.ahk" { IDirectSoundFullDuplex }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */

;@region Functions
/**
 * 
 * @param {Pointer<Guid>} pcGuidDevice 
 * @param {IUnknown} pUnkOuter 
 * @returns {IDirectSound} 
 */
export DirectSoundCreate(pcGuidDevice, pUnkOuter) {
    result := DllCall("DSOUND.dll\DirectSoundCreate", Guid.Ptr, pcGuidDevice, "ptr*", &ppDS := 0, "ptr", pUnkOuter, "HRESULT")
    return IDirectSound(ppDS)
}

/**
 * 
 * @param {Pointer<LPDSENUMCALLBACKA>} pDSEnumCallback 
 * @param {Pointer<Void>} pContext 
 * @returns {HRESULT} 
 */
export DirectSoundEnumerateA(pDSEnumCallback, pContext) {
    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("DSOUND.dll\DirectSoundEnumerateA", "ptr", pDSEnumCallback, pContextMarshal, pContext, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<LPDSENUMCALLBACKW>} pDSEnumCallback 
 * @param {Pointer<Void>} pContext 
 * @returns {HRESULT} 
 */
export DirectSoundEnumerateW(pDSEnumCallback, pContext) {
    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("DSOUND.dll\DirectSoundEnumerateW", "ptr", pDSEnumCallback, pContextMarshal, pContext, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Guid>} pcGuidDevice 
 * @param {IUnknown} pUnkOuter 
 * @returns {IDirectSoundCapture} 
 */
export DirectSoundCaptureCreate(pcGuidDevice, pUnkOuter) {
    result := DllCall("DSOUND.dll\DirectSoundCaptureCreate", Guid.Ptr, pcGuidDevice, "ptr*", &ppDSC := 0, "ptr", pUnkOuter, "HRESULT")
    return IDirectSoundCapture(ppDSC)
}

/**
 * 
 * @param {Pointer<LPDSENUMCALLBACKA>} pDSEnumCallback 
 * @param {Pointer<Void>} pContext 
 * @returns {HRESULT} 
 */
export DirectSoundCaptureEnumerateA(pDSEnumCallback, pContext) {
    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("DSOUND.dll\DirectSoundCaptureEnumerateA", "ptr", pDSEnumCallback, pContextMarshal, pContext, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<LPDSENUMCALLBACKW>} pDSEnumCallback 
 * @param {Pointer<Void>} pContext 
 * @returns {HRESULT} 
 */
export DirectSoundCaptureEnumerateW(pDSEnumCallback, pContext) {
    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("DSOUND.dll\DirectSoundCaptureEnumerateW", "ptr", pDSEnumCallback, pContextMarshal, pContext, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Guid>} pcGuidDevice 
 * @param {IUnknown} pUnkOuter 
 * @returns {IDirectSound8} 
 */
export DirectSoundCreate8(pcGuidDevice, pUnkOuter) {
    result := DllCall("DSOUND.dll\DirectSoundCreate8", Guid.Ptr, pcGuidDevice, "ptr*", &ppDS8 := 0, "ptr", pUnkOuter, "HRESULT")
    return IDirectSound8(ppDS8)
}

/**
 * 
 * @param {Pointer<Guid>} pcGuidDevice 
 * @param {IUnknown} pUnkOuter 
 * @returns {IDirectSoundCapture} 
 */
export DirectSoundCaptureCreate8(pcGuidDevice, pUnkOuter) {
    result := DllCall("DSOUND.dll\DirectSoundCaptureCreate8", Guid.Ptr, pcGuidDevice, "ptr*", &ppDSC8 := 0, "ptr", pUnkOuter, "HRESULT")
    return IDirectSoundCapture(ppDSC8)
}

/**
 * The DirectSoundFullDuplexCreate function is documented under a different name. For complete documentation of this function, see DirectSoundFullDuplexCreate8.
 * @param {Pointer<Guid>} pcGuidCaptureDevice 
 * @param {Pointer<Guid>} pcGuidRenderDevice 
 * @param {Pointer<DSCBUFFERDESC>} pcDSCBufferDesc 
 * @param {Pointer<DSBUFFERDESC>} pcDSBufferDesc 
 * @param {HWND} _hWnd 
 * @param {Integer} dwLevel 
 * @param {Pointer<IDirectSoundFullDuplex>} ppDSFD 
 * @param {Pointer<IDirectSoundCaptureBuffer8>} ppDSCBuffer8 
 * @param {Pointer<IDirectSoundBuffer8>} ppDSBuffer8 
 * @param {IUnknown} pUnkOuter 
 * @returns {HRESULT} *...* 
 * 
 * 
 * If this function succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/directsoundfullduplexcreate
 */
export DirectSoundFullDuplexCreate(pcGuidCaptureDevice, pcGuidRenderDevice, pcDSCBufferDesc, pcDSBufferDesc, _hWnd, dwLevel, ppDSFD, ppDSCBuffer8, ppDSBuffer8, pUnkOuter) {
    result := DllCall("DSOUND.dll\DirectSoundFullDuplexCreate", Guid.Ptr, pcGuidCaptureDevice, Guid.Ptr, pcGuidRenderDevice, DSCBUFFERDESC.Ptr, pcDSCBufferDesc, DSBUFFERDESC.Ptr, pcDSBufferDesc, HWND, _hWnd, "uint", dwLevel, IDirectSoundFullDuplex.Ptr, ppDSFD, IDirectSoundCaptureBuffer8.Ptr, ppDSCBuffer8, IDirectSoundBuffer8.Ptr, ppDSBuffer8, "ptr", pUnkOuter, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Guid>} pGuidSrc 
 * @param {Pointer<Guid>} pGuidDest 
 * @returns {HRESULT} 
 */
export GetDeviceID(pGuidSrc, pGuidDest) {
    result := DllCall("DSOUND.dll\GetDeviceID", Guid.Ptr, pGuidSrc, Guid.Ptr, pGuidDest, "HRESULT")
    return result
}

;@endregion Functions
