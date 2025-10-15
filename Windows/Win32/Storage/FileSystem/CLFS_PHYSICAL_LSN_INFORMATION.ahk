#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLS_LSN.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_PHYSICAL_LSN_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    StreamIdentifier {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {CLS_LSN}
     */
    VirtualLsn{
        get {
            if(!this.HasProp("__VirtualLsn"))
                this.__VirtualLsn := CLS_LSN(this.ptr + 8)
            return this.__VirtualLsn
        }
    }

    /**
     * @type {CLS_LSN}
     */
    PhysicalLsn{
        get {
            if(!this.HasProp("__PhysicalLsn"))
                this.__PhysicalLsn := CLS_LSN(this.ptr + 16)
            return this.__PhysicalLsn
        }
    }
}
