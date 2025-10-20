#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} type 
     * @param {Pointer<Single>} x 
     * @param {Pointer<Single>} y 
     * @param {Pointer<Single>} z 
     * @returns {HRESULT} 
     */
    GetStaticObjectPosition(type, x, y, z) {
        result := ComCall(3, this, "int", type, "float*", x, "float*", y, "float*", z, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} mask 
     * @returns {HRESULT} 
     */
    GetNativeStaticObjectTypeMask(mask) {
        result := ComCall(4, this, "int*", mask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} value 
     * @returns {HRESULT} 
     */
    GetMaxDynamicObjectCount(value) {
        result := ComCall(5, this, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioFormatEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    GetSupportedAudioObjectFormatEnumerator(enumerator) {
        result := ComCall(6, this, "ptr", enumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} objectFormat 
     * @param {Pointer<UInt32>} frameCountPerBuffer 
     * @returns {HRESULT} 
     */
    GetMaxFrameCount(objectFormat, frameCountPerBuffer) {
        result := ComCall(7, this, "ptr", objectFormat, "uint*", frameCountPerBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} objectFormat 
     * @returns {HRESULT} 
     */
    IsAudioObjectFormatSupported(objectFormat) {
        result := ComCall(8, this, "ptr", objectFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} streamUuid 
     * @param {Pointer<PROPVARIANT>} auxiliaryInfo 
     * @returns {HRESULT} 
     */
    IsSpatialAudioStreamAvailable(streamUuid, auxiliaryInfo) {
        result := ComCall(9, this, "ptr", streamUuid, "ptr", auxiliaryInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} activationParams 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} stream 
     * @returns {HRESULT} 
     */
    ActivateSpatialAudioStream(activationParams, riid, stream) {
        result := ComCall(10, this, "ptr", activationParams, "ptr", riid, "ptr", stream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
