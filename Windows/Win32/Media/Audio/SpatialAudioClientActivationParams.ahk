#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents optional activation parameters for a spatial audio render stream. Pass this structure to ActivateAudioInterfaceAsync when activating an ISpatialAudioClient interface.
 * @remarks
 * The following example code shows how to initialize this structure.
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
 * To access the <b>ActivateAudioIntefaceAsync</b>, you will need to link to mmdevapi.lib.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/ns-spatialaudioclient-spatialaudioclientactivationparams
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioClientActivationParams {
    #StructPack 4

    /**
     * An app-defined context identifier, used for event logging.
     */
    tracingContextId : Guid

    /**
     * An identifier for the client app, used for event logging.
     */
    appId : Guid

    majorVersion : Int32

    minorVersion1 : Int32

    minorVersion2 : Int32

    minorVersion3 : Int32

}
