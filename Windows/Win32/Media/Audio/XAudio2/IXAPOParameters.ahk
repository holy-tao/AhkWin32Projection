#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An optional interface that allows an XAPO to use effect-specific parameters.
 * @remarks
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xapo/nn-xapo-ixapoparameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAPOParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXAPOParameters
     * @type {Guid}
     */
    static IID => Guid("{26d95c66-80f2-499a-ad54-5ae7f01c6d98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetParameters", "GetParameters"]

    /**
     * Sets effect-specific parameters.
     * @remarks
     * 
     * The data in <i>pParameters</i> is completely effect-specific and determined by the implementation of the <b>IXAPOParameters::SetParameters</b> function. The data passed to <b>SetParameters</b> can be used to set the state of the XAPO and control the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-process">IXAPO::Process</a> function.
     * 
     * 
     * 
     * <b>SetParameters</b> can only be called on the real-time audio processing thread; no synchronization between <b>SetParameters</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-process">IXAPO::Process</a> method is necessary. However, the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-seteffectparameters">IXAudio2Voice::SetEffectParameters</a> method may be called from any thread as it adds in the required synchronization to deliver a copy (asynchronously) of the parameters to <b>SetParameters</b> on the real-time thread; no synchronization between <b>IXAudio2Voice::SetEffectParameters</b> and the <b>IXAPO::Process</b> method is necessary.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {Pointer} pParameters Effect-specific parameter block.
     * @param {Integer} ParameterByteSize Size of pParameters, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xapo/nf-xapo-ixapoparameters-setparameters
     */
    SetParameters(pParameters, ParameterByteSize) {
        ComCall(3, this, "ptr", pParameters, "uint", ParameterByteSize)
    }

    /**
     * Gets the current values for any effect-specific parameters.
     * @remarks
     * 
     * The data in <i>pParameters</i> is completely effect-specific and determined by the implementation of the <b>IXAPOParameters::GetParameters</b> function. The data returned in <i>pParameters</i> can be used to provide information about the current state of the XAPO.
     * 
     * 
     * 
     * Unlike SetParameters, XAudio2 does not call this method on the realtime audio processing thread. Thus, the XAPO must protect variables shared with <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapoparameters-setparameters">IXAPOParameters::SetParameters</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-process">IXAPO::Process</a> using appropriate synchronization. The <a href="https://docs.microsoft.com/windows/desktop/api/xapobase/nl-xapobase-cxapoparametersbase">CXAPOParametersBase</a> class is an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nn-xapo-ixapoparameters">IXAPOParameters</a> and its implementation of <b>GetParameters</b> efficiently handles this synchronization for the user.
     * 
     * 
     * 
     * XAudio2 calls this method from the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voice-geteffectparameters">IXAudio2Voice::GetEffectParameters</a> method.
     * 
     * 
     * 
     * This method may block and should never be called from the realtime audio processing thread instead get the current parameters from <a href="https://docs.microsoft.com/windows/desktop/api/xapobase/nf-xapobase-cxapoparametersbase-beginprocess">CXAPOParametersBase::BeginProcess</a>.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {Pointer} pParameters Receives an effect-specific parameter block.
     * @param {Integer} ParameterByteSize Size of pParameters, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xapo/nf-xapo-ixapoparameters-getparameters
     */
    GetParameters(pParameters, ParameterByteSize) {
        ComCall(4, this, "ptr", pParameters, "uint", ParameterByteSize)
    }
}
