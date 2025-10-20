#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/ns-spatialaudioclient-spatialaudioobjectrenderstreamactivationparams2
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioObjectRenderStreamActivationParams2 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    ObjectFormat {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StaticObjectTypeMask {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MinDynamicObjectCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    MaxDynamicObjectCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Category {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {HANDLE}
     */
    EventHandle{
        get {
            if(!this.HasProp("__EventHandle"))
                this.__EventHandle := HANDLE(24, this)
            return this.__EventHandle
        }
    }

    /**
     * @type {ISpatialAudioObjectRenderStreamNotify}
     */
    NotifyObject {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Options {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
