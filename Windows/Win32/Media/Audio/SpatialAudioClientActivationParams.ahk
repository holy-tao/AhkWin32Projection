#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class SpatialAudioClientActivationParams extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An app-defined context identifier, used for event logging.
     * @type {Pointer<Guid>}
     */
    tracingContextId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * An identifier for the client app, used for event logging.
     * @type {Pointer<Guid>}
     */
    appId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    majorVersion {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    minorVersion1 {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    minorVersion2 {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    minorVersion3 {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
