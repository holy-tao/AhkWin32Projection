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
     * 
     * @param {Integer} type 
     * @param {Pointer<Float>} x 
     * @param {Pointer<Float>} y 
     * @param {Pointer<Float>} z 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getstaticobjectposition
     */
    GetStaticObjectPosition(type, x, y, z) {
        xMarshal := x is VarRef ? "float*" : "ptr"
        yMarshal := y is VarRef ? "float*" : "ptr"
        zMarshal := z is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, "int", type, xMarshal, x, yMarshal, y, zMarshal, z, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getnativestaticobjecttypemask
     */
    GetNativeStaticObjectTypeMask() {
        result := ComCall(4, this, "int*", &mask := 0, "HRESULT")
        return mask
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getmaxdynamicobjectcount
     */
    GetMaxDynamicObjectCount() {
        result := ComCall(5, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {IAudioFormatEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getsupportedaudioobjectformatenumerator
     */
    GetSupportedAudioObjectFormatEnumerator() {
        result := ComCall(6, this, "ptr*", &enumerator := 0, "HRESULT")
        return IAudioFormatEnumerator(enumerator)
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} objectFormat 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-getmaxframecount
     */
    GetMaxFrameCount(objectFormat) {
        result := ComCall(7, this, "ptr", objectFormat, "uint*", &frameCountPerBuffer := 0, "HRESULT")
        return frameCountPerBuffer
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} objectFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-isaudioobjectformatsupported
     */
    IsAudioObjectFormatSupported(objectFormat) {
        result := ComCall(8, this, "ptr", objectFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} streamUuid 
     * @param {Pointer<PROPVARIANT>} auxiliaryInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-isspatialaudiostreamavailable
     */
    IsSpatialAudioStreamAvailable(streamUuid, auxiliaryInfo) {
        result := ComCall(9, this, "ptr", streamUuid, "ptr", auxiliaryInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} activationParams 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream
     */
    ActivateSpatialAudioStream(activationParams, riid) {
        result := ComCall(10, this, "ptr", activationParams, "ptr", riid, "ptr*", &stream := 0, "HRESULT")
        return stream
    }
}
