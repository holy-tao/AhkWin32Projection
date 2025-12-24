#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FSRTL_PER_FILE_CONTEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    Links{
        get {
            if(!this.HasProp("__Links"))
                this.__Links := LIST_ENTRY(0, this)
            return this.__Links
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    OwnerId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    InstanceId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PFREE_FUNCTION>}
     */
    FreeCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
