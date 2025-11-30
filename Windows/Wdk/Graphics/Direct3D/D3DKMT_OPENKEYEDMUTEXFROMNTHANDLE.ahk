#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_OPENKEYEDMUTEXFROMNTHANDLE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    hNtHandle{
        get {
            if(!this.HasProp("__hNtHandle"))
                this.__hNtHandle := HANDLE(0, this)
            return this.__hNtHandle
        }
    }

    /**
     * @type {Integer}
     */
    hKeyedMutex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    pPrivateRuntimeData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PrivateRuntimeDataSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
