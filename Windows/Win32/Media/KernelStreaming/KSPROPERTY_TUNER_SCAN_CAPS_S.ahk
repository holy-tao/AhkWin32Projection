#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_TUNER_SCAN_CAPS_S extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {BOOL}
     */
    fSupportsHardwareAssistedScanning{
        get {
            if(!this.HasProp("__fSupportsHardwareAssistedScanning"))
                this.__fSupportsHardwareAssistedScanning := BOOL(this.ptr + 16)
            return this.__fSupportsHardwareAssistedScanning
        }
    }

    /**
     * @type {Integer}
     */
    SupportedBroadcastStandards {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<Void>}
     */
    GUIDBucket {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    lengthofBucket {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
