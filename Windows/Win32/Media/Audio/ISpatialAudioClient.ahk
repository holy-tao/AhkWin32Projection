#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioFormatEnumerator.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISpatialAudioClient interface enables a client to create audio streams that emit audio from a position in 3D space.
 * @remarks
 * 
 * Get an instance of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-activateaudiointerfaceasync">ActivateAudioInterfaceAsync</a>, using the  <a href="https://docs.microsoft.com/cpp/cpp/uuidof-operator">__uuidof</a> operator to get the class ID of the <b>ISpatialAudioClient</b> interface. The following example code shows how to initialize this interface.
 * 
 * 
 * ```cpp
 * PROPVARIANT var; 
 * PropVariantInit(&var);  
 * auto p = reinterpret_cast<SpatialAudioClientActivationParams *>(CoTaskMemAlloc(sizeof(SpatialAudioClientActivationParams)));  
 * if (nullptr == p) { ... } 
 * p->tracingContextId = // context identifier ;  
 * p->appId = // app identifier ;  
 * p->majorVersion = // app version info ;  
 * p->majorVersionN = // app version info ;
 * var.vt = VT_BLOB;
 * var.blob.cbSize = sizeof(*p);
 * var.blob.pBlobData = reinterpret_cast<BYTE *>(p); 
 * hr = ActivateAudioInterfaceAsync(device, __uuidof(ISpatialAudioClient), &var, ...);
 * // ...
 * ropVariantClear(&var);
 * ```
 * 
 * 
 * <div class="alert"><b>Note</b>  When using the <b>ISpatialAudioClient</b> interfaces on an Xbox One Development Kit (XDK) title, you must first call <b>EnableSpatialAudio</b> before calling <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-enumaudioendpoints">IMMDeviceEnumerator::EnumAudioEndpoints</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-getdefaultaudioendpoint">IMMDeviceEnumerator::GetDefaultAudioEndpoint</a>. Failure to do so will result in an E_NOINTERFACE error being returned from the call to Activate. <b>EnableSpatialAudio</b> is only available for XDK titles, and does not need to be called for Universal Windows Platform apps running on Xbox One, nor for any non-Xbox One devices.</div>
 * <div> </div>
 * To access the <b>ActivateAudioIntefaceAsync</b>, you will need to link to mmdevapi.lib.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioClient
     * @type {Guid}
     */
    static IID => Guid("{bbf8e066-aaaa-49be-9a4d-fd2a858ea27f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStaticObjectPosition", "GetNativeStaticObjectTypeMask", "GetMaxDynamicObjectCount", "GetSupportedAudioObjectFormatEnumerator", "GetMaxFrameCount", "IsAudioObjectFormatSupported", "IsSpatialAudioStreamAvailable", "ActivateSpatialAudioStream"]

    /**
     * Gets the position in 3D space of the specified static spatial audio channel.
     * @param {Integer} type A value indicating the static spatial audio channel for which the position is being queried. This method will return E_INVALIDARG  if the value does not represent a static channel, including <b>AudioObjectType_Dynamic</b> and <b>AudioObjectType_None</b>.
     * @param {Pointer<Float>} x The x coordinate of the static audio channel, in meters, relative to the listener. Positive values are to the right of the listener and negative values are to the left.
     * @param {Pointer<Float>} y The y coordinate of the static audio channel, in meters, relative to the listener. Positive values are above the listener and negative values are below.
     * @param {Pointer<Float>} z The z coordinate of the static audio channel, in meters, relative to the listener. Positive values are behind the listener and negative values are in front.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied  <a href="/windows/desktop/api/spatialaudioclient/ne-spatialaudioclient-audioobjecttype">AudioObjectType</a> value does not represent a static channel.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getstaticobjectposition
     */
    GetStaticObjectPosition(type, x, y, z) {
        xMarshal := x is VarRef ? "float*" : "ptr"
        yMarshal := y is VarRef ? "float*" : "ptr"
        zMarshal := z is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, "int", type, xMarshal, x, yMarshal, y, zMarshal, z, "HRESULT")
        return result
    }

    /**
     * Gets a channel mask which represents the subset of static speaker bed channels native to current rendering engine.
     * @returns {Integer} A bitwise combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ne-spatialaudioclient-audioobjecttype">AudioObjectType</a> enumeration indicating a subset of static speaker channels. The values returned will only include the static channel values and will not include <b>AudioObjectType_Dynamic</b>.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getnativestaticobjecttypemask
     */
    GetNativeStaticObjectTypeMask() {
        result := ComCall(4, this, "int*", &mask := 0, "HRESULT")
        return mask
    }

    /**
     * Gets the maximum number of dynamic audio objects for the spatial audio client.
     * @returns {Integer} Gets the maximum dynamic object count for this client.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getmaxdynamicobjectcount
     */
    GetMaxDynamicObjectCount() {
        result := ComCall(5, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets an IAudioFormatEnumerator that contains all supported audio formats for spatial audio objects, the first item in the list represents the most preferable format.
     * @returns {IAudioFormatEnumerator} Pointer to the pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-iaudioformatenumerator">IAudioFormatEnumerator</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getsupportedaudioobjectformatenumerator
     */
    GetSupportedAudioObjectFormatEnumerator() {
        result := ComCall(6, this, "ptr*", &enumerator := 0, "HRESULT")
        return IAudioFormatEnumerator(enumerator)
    }

    /**
     * Gets the maximum possible frame count per processing pass. This method can be used to determine the size of the source buffer that should be allocated to convey audio data for each processing pass.
     * @param {Pointer<WAVEFORMATEX>} objectFormat The audio format used to calculate the maximum frame count. This should be the same format specified in the <b>ObjectFormat</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ns-spatialaudioclient-spatialaudioobjectrenderstreamactivationparams">SpatialAudioObjectRenderStreamActivationParams</a> passed to  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream">ActivateSpatialAudioStream</a>.
     * @returns {Integer} The maximum number of audio frames that will be processed in one pass.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getmaxframecount
     */
    GetMaxFrameCount(objectFormat) {
        result := ComCall(7, this, "ptr", objectFormat, "uint*", &frameCountPerBuffer := 0, "HRESULT")
        return frameCountPerBuffer
    }

    /**
     * Gets a value indicating whether ISpatialAudioObjectRenderStream supports a the specified format.
     * @param {Pointer<WAVEFORMATEX>} objectFormat The format for which support is queried.
     * @returns {HRESULT} If the specified format is supported, it returns S_OK. If specified format is unsupported, this method returns AUDCLNT_E_UNSUPPORTED_FORMAT.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-isaudioobjectformatsupported
     */
    IsAudioObjectFormatSupported(objectFormat) {
        result := ComCall(8, this, "ptr", objectFormat, "HRESULT")
        return result
    }

    /**
     * When successful, gets a value indicating whether the currently active spatial rendering engine supports the specified spatial audio render stream.
     * @param {Pointer<Guid>} streamUuid The interface ID of the interface for which availability is queried.
     * @param {Pointer<PROPVARIANT>} auxiliaryInfo A structure containing additional information to be used when support is queried. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_STREAM_IS_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified stream interface can't be activated by the currently active rendering engine.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_METADATA_FORMAT_IS_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The metadata format supplied in the <i>auxiliaryInfo</i> parameter is not supported by the current rendering engine. For more information, see Remarks..
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-isspatialaudiostreamavailable
     */
    IsSpatialAudioStreamAvailable(streamUuid, auxiliaryInfo) {
        result := ComCall(9, this, "ptr", streamUuid, "ptr", auxiliaryInfo, "HRESULT")
        return result
    }

    /**
     * Activates and initializes spatial audio stream using one of the spatial audio stream activation structures.
     * @param {Pointer<PROPVARIANT>} activationParams The structure defining the activation parameters for the spatial audio stream. The <b>vt</b> field should be set to VT_BLOB and the <b>blob</b> field should be  populated with a <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ns-spatialaudioclient-spatialaudioobjectrenderstreamactivationparams">SpatialAudioObjectRenderStreamActivationParams</a> or a <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiometadata/ns-spatialaudiometadata-spatialaudioobjectrenderstreamformetadataactivationparams">SpatialAudioObjectRenderStreamForMetadataActivationParams</a>.
     * @param {Pointer<Guid>} riid The UUID of the spatial audio stream interface to activate.
     * @returns {Pointer<Void>} A pointer to the pointer which receives the activated spatial audio interface.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream
     */
    ActivateSpatialAudioStream(activationParams, riid) {
        result := ComCall(10, this, "ptr", activationParams, "ptr", riid, "ptr*", &stream := 0, "HRESULT")
        return stream
    }
}
