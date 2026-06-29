#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

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
class SpatialAudioClientActivationParams extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * An app-defined context identifier, used for event logging.
     * @type {Guid}
     */
    tracingContextId {
        get {
            if(!this.HasProp("__tracingContextId"))
                this.__tracingContextId := Guid(0, this)
            return this.__tracingContextId
        }
    }

    /**
     * An identifier for the client app, used for event logging.
     * @type {Guid}
     */
    appId {
        get {
            if(!this.HasProp("__appId"))
                this.__appId := Guid(16, this)
            return this.__appId
        }
    }

    /**
     * @type {Integer}
     */
    majorVersion {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    minorVersion1 {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    minorVersion2 {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    minorVersion3 {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
