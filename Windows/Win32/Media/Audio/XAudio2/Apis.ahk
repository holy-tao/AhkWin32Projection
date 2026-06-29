#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\IXAudio2.ahk" { IXAudio2 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\HrtfApoInit.ahk" { HrtfApoInit }
#Import ".\IXAPO.ahk" { IXAPO }

/**
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */

;@region Functions
/**
 * Creates an instance of the requested XAPOFX effect.
 * @remarks
 * The created XAPO will have a reference count of 1. Client code must call <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-release">IUnknown::Release</a> after passing the XAPO to XAudio2 to allow XAudio2 to dispose of the XAPO when it is no longer needed. Use <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-createsourcevoice"> IXAudio2::CreateSourceVoice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-seteffectchain">IXAudio2Voice::SetEffectChain</a> to pass an XAPO to XAudio2.
 * 
 * 
 * 
 * <div class="alert"><b>Note</b>  The DirectX SDK version of this function doesn't have the <i>pInitData</i> or <i>InitDataByteSize</i> parameters as it only takes the first 2 parameters. To set initial parameters for the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xapofx-overview">XAPOFX</a> effect that is  created with the DirectX SDK version of this function, you must bind that effect to a voice and use <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-seteffectparameters">IXAudio2Voice::SetEffectParameters</a>.
 * For info about how to do this, see <a href="https://docs.microsoft.com/windows/desktop/xaudio2/how-to--use-xapofx-in-xaudio2">How to: Use XAPOFX in XAudio2</a>.</div>
 * <div> </div>
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); 
 *             Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @param {Pointer<Guid>} clsid ID of the effect to create. Use the <b>__uuidof</b> on the effect class name to get the CLSID for an effect. For example, <b>__uuidof</b>(FXReverb) would provide the CLSID for the FXReverb effect. For a list of effects provided by XAPOFX, see <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xapofx-overview">XAPOFX Overview</a>. For an example of retrieving the CLSID for an effect, see <a href="https://docs.microsoft.com/windows/desktop/xaudio2/how-to--use-xapofx-in-xaudio2">How to: Use XAPOFX in XAudio2</a>.
 * @param {Integer} pInitDat 
 * @param {Integer} InitDataByteSize Size of <i>pInitData</i> in bytes. This is zero if <i>pInitData</i> is <b>NULL</b>.
 * @returns {IUnknown} Receives a pointer to the created XAPO instance. If <b>CreateFX</b> fails, <i>pEffect </i> is untouched.
 * @see https://learn.microsoft.com/windows/win32/api/xapofx/nf-xapofx-createfx
 */
export CreateFX(clsid, pInitDat, InitDataByteSize) {
    result := DllCall("XAudio2_8.dll\CreateFX", Guid.Ptr, clsid, "ptr*", &pEffect := 0, "ptr", pInitDat, "uint", InitDataByteSize, "HRESULT")
    return IUnknown(pEffect)
}

/**
 * 
 * @param {Integer} Flags 
 * @param {Integer} XAudio2Processor 
 * @param {Integer} ntddiVersion 
 * @returns {IXAudio2} 
 */
export XAudio2CreateWithVersionInfo(Flags, XAudio2Processor, ntddiVersion) {
    result := DllCall("XAudio2_8.dll\XAudio2CreateWithVersionInfo", "ptr*", &ppXAudio2 := 0, "uint", Flags, "uint", XAudio2Processor, "uint", ntddiVersion, "HRESULT")
    return IXAudio2(ppXAudio2)
}

/**
 * 
 * @returns {IUnknown} 
 */
export CreateAudioVolumeMeter() {
    result := DllCall("XAudio2_8.dll\CreateAudioVolumeMeter", "ptr*", &ppApo := 0, "HRESULT")
    return IUnknown(ppApo)
}

/**
 * 
 * @returns {IUnknown} 
 */
export CreateAudioReverb() {
    result := DllCall("XAudio2_8.dll\CreateAudioReverb", "ptr*", &ppApo := 0, "HRESULT")
    return IUnknown(ppApo)
}

/**
 * Creates an instance of the IXAPO interface for head-related transfer function (HRTF) processing.
 * @remarks
 * Audio is processed in blocks of 1024 samples.
 * 
 * Format requirements:
 * 
 * <ul>
 * <li>Input: mono, 48 kHz, 32-bit float PCM.</li>
 * <li>Output: stereo, 48 kHz, 32-bit float PCM.</li>
 * </ul>
 * The source and environment parameters of the HRTF XAPO are controlled through the <a href="https://docs.microsoft.com/windows/desktop/api/hrtfapoapi/nn-hrtfapoapi-ixapohrtfparameters">IXAPOHrtfParameters</a> interface.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9);
 * @param {Pointer<HrtfApoInit>} init Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/hrtfapoapi/ns-hrtfapoapi-hrtfapoinit">HrtfApoInit</a> struct. Specifies parameters for XAPO interface initialization.
 * @returns {IXAPO} The new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nn-xapo-ixapo">IXAPO</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nf-hrtfapoapi-createhrtfapo
 */
export CreateHrtfApo(init) {
    result := DllCall("HrtfApo.dll\CreateHrtfApo", HrtfApoInit.Ptr, init, "ptr*", &xApo := 0, "HRESULT")
    return IXAPO(xApo)
}

;@endregion Functions
