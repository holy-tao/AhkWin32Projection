#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSQUALITY_MANAGER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    QualityManager{
        get {
            if(!this.HasProp("__QualityManager"))
                this.__QualityManager := HANDLE(this.ptr + 0)
            return this.__QualityManager
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
