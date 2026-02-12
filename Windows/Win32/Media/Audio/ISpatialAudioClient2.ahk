#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioClient.ahk

/**
 * The **ISpatialAudioClient2** interface inherits from ISpatialAudioClient and adds methods to query for support for offloading large audio buffers.
 * @remarks
 * Audio offloading allows an app to submit a large audio buffer (typically 1 to 2 seconds) the the audio device driver. Without offload, a typical audio buffer only contains 10ms of data, requiring the app to be awakened around 100 times per second to provide additional audio data. Using offloaded large buffers can provide battery savings, particularly for the scenario where the user is listening to audio with the screen off.
 * 
 * To use this feature, the driver for the audio device must support offloading. Query for support by calling [IsOffloadCapable](xref:NF:spatialaudioclient.ISpatialAudioClient2.IsOffloadCapable). Determine the maximum number of audio frames supported for offloading by calling [GetMaxFrameCountForCategory](xref:NF:spatialaudioclient.ISpatialAudioClient2.GetMaxFrameCountForCategory).
 * 
 * **ISpatialAudioClient2** was introduced in Windows 11 (Windows Build 22000), so your code should handle the case where it is running on an older version of Windows that doesn't include the interface. The following example illustrates using calling **QueryInterface** on **ISpatialAudioClient** to try to obtain an instance of **ISpatialAudioClient2** and checking that the retrieved interface is not null before calling its methods.
 * 
 * ```cpp
 * HRESULT hr;
 * Microsoft::WRL::ComPtr<IMMDeviceEnumerator> deviceEnum;
 * Microsoft::WRL::ComPtr<IMMDevice> defaultDevice;
 * 
 * hr = CoCreateInstance(__uuidof(MMDeviceEnumerator), nullptr, CLSCTX_ALL, __uuidof(IMMDeviceEnumerator), (void**)&deviceEnum);
 * hr = deviceEnum->GetDefaultAudioEndpoint(EDataFlow::eRender, eMultimedia, &defaultDevice);
 * 
 * Microsoft::WRL::ComPtr<ISpatialAudioClient> spatialAudioClient;
 * hr = defaultDevice->Activate(__uuidof(ISpatialAudioClient), CLSCTX_INPROC_SERVER, nullptr, (void**)&spatialAudioClient);
 * 
 * Microsoft::WRL::ComPtr<ISpatialAudioClient2> spatialAudioClient2;
 * hr = spatialAudioClient->QueryInterface(__uuidof(ISpatialAudioClient2), (void**)&spatialAudioClient2);
 * 
 * if (spatialAudioClient2 != nullptr)
 * {
 *     BOOL offloadCapable = false;
 * 
 *     // AudioCategory_Media is just for example purposes.
 *     // Specify the same audio category that you intend specify in the call toISpatialAudioClient::ActivateSpatialAudioStream
 *     hr = spatialAudioClient2->IsOffloadCapable(AudioCategory_Media, &offloadCapable);
 * }
 * ```
 * 
 * For UWP apps that do not have access to **IMMDevice**, you should get an instance of **ISpatialAudioClient** by calling <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-activateaudiointerfaceasync">ActivateAudioInterfaceAsync</a>. For an example, see the [WindowsAudioSession sample](https://github.com/microsoft/Windows-universal-samples/tree/b1cb20f191d3fd99ce89df50c5b7d1a6e2382c01/Samples/WindowsAudioSession).
 * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient2
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioClient2 extends ISpatialAudioClient{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioClient2
     * @type {Guid}
     */
    static IID => Guid("{caabe452-a66a-4bee-a93e-e320463f6a53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsOffloadCapable", "GetMaxFrameCountForCategory"]

    /**
     * Queries whether the audio rendering endpoint that the ISpatialAudioClient2 was created on supports hardware offloaded audio processing.
     * @param {Integer} category A value from the [AUDIO_STREAM_CATEGORY](xref:NE:audiosessiontypes._AUDIO_STREAM_CATEGORY) enumeration specifying the category of audio for which offload support is queried.
     * @returns {BOOL} Receives a boolean value indicating if offloaded audio processing is supported by the audio rendering endpoint.
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient2-isoffloadcapable
     */
    IsOffloadCapable(category) {
        result := ComCall(11, this, "int", category, "int*", &isOffloadCapable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isOffloadCapable
    }

    /**
     * Gets the maximum supported frame count per processing pass.
     * @remarks
     * The value returned by this method can be used to allocate source buffer. This value will change if the endpoint cadence changes. The caller must specify same [AUDIO_STREAM_CATEGORY](xref:NE:audiosessiontypes._AUDIO_STREAM_CATEGORY) and [WAVEFORMATEX](xref:NS:mmeapi.tWAVEFORMATEX) values that will be used when creating the stream. The *offloadEnabled* parameter must be set to TRUE if the stream will be created with the [SPATIAL_AUDIO_STREAM_OPTIONS_OFFLOAD](xref:NE:spatialaudioclient.SPATIAL_AUDIO_STREAM_OPTIONS) flag.
     * @param {Integer} category The <xref:NE:audiosessiontypes._AUDIO_STREAM_CATEGORY> of the audio stream for which support is queried.
     * @param {BOOL} offloadEnabled A boolean value specifying whether the returned frame count should be calculated with audio offload support considered. If this flag is set to true, the returned frame count is what it would be if the stream is activated for offload mode. However, if this flag is set to true but the audio endpoint does not support offload mode, then the flag has no effect. Use [ISpatialAudioClient2::IsOffloadCapable](nf-spatialaudioclient-ispatialaudioclient2-isoffloadcapable.md) to check if offload mode is supported.
     * @param {Pointer<WAVEFORMATEX>} objectFormat A pointer to a <xref:NS:mmeapi.tWAVEFORMATEX> structure specifying the format of the audio stream for which support is queried.
     * @returns {Integer} Receives a pointer to an **INT32** indicating the maximum supported frame count for the audio device and the specified input parameters.
     * @see https://learn.microsoft.com/windows/win32/api//content/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient2-getmaxframecountforcategory
     */
    GetMaxFrameCountForCategory(category, offloadEnabled, objectFormat) {
        result := ComCall(12, this, "int", category, "int", offloadEnabled, "ptr", objectFormat, "uint*", &frameCountPerBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return frameCountPerBuffer
    }
}
