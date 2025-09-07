#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSCAMERA_PROFILE_INFO.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDEVICE_PROFILE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {KSCAMERA_PROFILE_INFO}
     */
    Info{
        get {
            if(!this.HasProp("__Info"))
                this.__Info := KSCAMERA_PROFILE_INFO(this.ptr + 8)
            return this.__Info
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ConcurrencyCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<KSCAMERA_PROFILE_CONCURRENCYINFO>}
     */
    Concurrency {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
