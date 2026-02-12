#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a mechanism for determining if an audio capture endpoint supports acoustic echo cancellation (AEC) and, if so, allows the client to set the audio render endpoint that should be used as the reference stream.
 * @remarks
 * The following example illustrates the usage of **IAcousticEchoCancellationControl** interface. Call [IAudioClient::GetService](./nf-audioclient-iaudioclient-getservice.md), passing in the IID for the **IAcousticEchoCancellationControl** interface. If it succeeds, the capture endpoint supports control of the loopback reference endpoint for AEC. Note that an endpoint may support AEC, but may not support control of loopback reference endpoint for AEC. Call [SetEchoCancellationRenderEndpoint](./nf-audioclient-iacousticechocancellationcontrol-setechocancellationrenderendpoint.md) to set the reference stream for AEC. If the call to **GetService** fails with **E_NOINTERFACE**, then the AEC effect on the endpoint (if supported), does not allow control over the loopback reference endpoint.
 * 
 * ```cpp
 * wil::com_ptr_nothrow<IAudioClient> audioClient;
 * 
 * RETURN_IF_FAILED(device->Activate(_uuidof(IAudioClient), CLSCTX_INPROC_SERVER, nullptr, (void **)&audioClient));
 * 
 * // Call Initialize before calling GetService
 * // Implementation of IAudioClient::Initialize has been omitted from this sample for brevity.
 * 
 * RETURN_IF_FAILED(audioClient->Initialize(…));
 * 
 * // If the capture endpoint supports acoustic echo cancellation (AEC), pass it the endpoint id of the
 * // audio render endpoint that should be used as the reference stream. If the capture endpoint does not
 * // support AEC, the GetService call fails with E_NOINTERFACE, so errors from GetService are not
 * // treated as fatal.
 * 
 * wil::com_ptr_nothrow<IAcousticEchoCancellationControl> audioAcousticEchoCancellationControl;
 * 
 * if (SUCCEEDED(audioClient->GetService(IID_PPV_ARGS(&audioAcousticEchoCancellationControl))))
 * {
 * 
 * RETURN_IF_FAILED(audioAcousticEchoCancellationControl-> SetEchoCancellationRenderEndpoint(endpointIdOfReferenceAudioStream));
 * 
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nn-audioclient-iacousticechocancellationcontrol
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAcousticEchoCancellationControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAcousticEchoCancellationControl
     * @type {Guid}
     */
    static IID => Guid("{f4ae25b5-aaa3-437d-b6b3-dbbe2d0e9549}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEchoCancellationRenderEndpoint"]

    /**
     * Sets the audio render endpoint that should be used as the reference stream for acoustic echo cancellation (AEC).
     * @remarks
     * The following example illustrates the usage of **IAcousticEchoCancellationControl** interface. Call [IAudioClient::GetService](./nf-audioclient-iaudioclient-getservice.md), passing in the IID for the **IAcousticEchoCancellationControl** interface. If it succeeds, the capture endpoint supports control of the loopback reference endpoint for AEC. Note that an endpoint may support AEC, but may not support control of loopback reference endpoint for AEC. Call [SetEchoCancellationRenderEndpoint](./nf-audioclient-iacousticechocancellationcontrol-setechocancellationrenderendpoint.md) to set the reference stream for AEC. If the call to **GetService** fails with **E_NOINTERFACE**, then the AEC effect on the endpoint (if supported), does not allow control over the loopback reference endpoint.
     * 
     * ```cpp
     * wil::com_ptr_nothrow<IAudioClient> audioClient;
     * 
     * RETURN_IF_FAILED(device->Activate(_uuidof(IAudioClient), CLSCTX_INPROC_SERVER, nullptr, (void **)&audioClient));
     * 
     * // Call Initialize before calling GetService
     * // Implementation of IAudioClient::Initialize has been omitted from this sample for brevity.
     * 
     * RETURN_IF_FAILED(audioClient->Initialize(…));
     * 
     * // If the capture endpoint supports acoustic echo cancellation (AEC), pass it the endpoint id of the
     * // audio render endpoint that should be used as the reference stream. If the capture endpoint does not
     * // support AEC, the GetService call fails with E_NOINTERFACE, so errors from GetService are not
     * // treated as fatal.
     * 
     * wil::com_ptr_nothrow<IAcousticEchoCancellationControl> audioAcousticEchoCancellationControl;
     * 
     * if (SUCCEEDED(audioClient->GetService(IID_PPV_ARGS(&audioAcousticEchoCancellationControl))))
     * {
     * 
     * RETURN_IF_FAILED(audioAcousticEchoCancellationControl-> SetEchoCancellationRenderEndpoint(endpointIdOfReferenceAudioStream));
     * 
     * }
     * ```
     * @param {PWSTR} endpointId The endpoint ID of the ender endpoint that should be used as the reference stream for AEC. Setting an invalid render device ID will fail with E_INVALIDARG. Setting the value to NULL will result in Windows using its own algorithm to pick the loopback reference device
     * @returns {HRESULT} Returns an HRESULT value including the following:
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK | Success. |
     * | E_INVALIDARG | The *endpointId* value is invalid. |
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iacousticechocancellationcontrol-setechocancellationrenderendpoint
     */
    SetEchoCancellationRenderEndpoint(endpointId) {
        endpointId := endpointId is String ? StrPtr(endpointId) : endpointId

        result := ComCall(3, this, "ptr", endpointId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
