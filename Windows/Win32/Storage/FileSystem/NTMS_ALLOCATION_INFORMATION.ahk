#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The NTMS_ALLOCATION_INFORMATION structure contains information about the source media pool from which a medium was taken.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_allocation_information
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NTMS_ALLOCATION_INFORMATION extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * Size of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Pointer<Void>}
     */
    lpReserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Unique identifier of the original source of the media.
     * @type {Guid}
     */
    AllocatedFrom {
        get {
            if(!this.HasProp("__AllocatedFrom"))
                this.__AllocatedFrom := Guid(16, this)
            return this.__AllocatedFrom
        }
    }
}
