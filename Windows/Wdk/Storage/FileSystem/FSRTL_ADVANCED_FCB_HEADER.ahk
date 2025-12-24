#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FSRTL_ADVANCED_FCB_HEADER extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<FSRTL_COMMON_FCB_HEADER>}
     */
    Base {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<FAST_MUTEX>}
     */
    FastMutex {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {LIST_ENTRY}
     */
    FilterContexts{
        get {
            if(!this.HasProp("__FilterContexts"))
                this.__FilterContexts := LIST_ENTRY(16, this)
            return this.__FilterContexts
        }
    }

    /**
     * @type {Pointer}
     */
    PushLock {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Pointer<Void>>}
     */
    FileContextSupportPointer {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    Oplock {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Void>}
     */
    ReservedForRemote {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Void>}
     */
    AePushLock {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    BypassIoOpenCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
