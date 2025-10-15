#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLFS_NODE_ID.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_SCAN_CONTEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {CLFS_NODE_ID}
     */
    cidNode{
        get {
            if(!this.HasProp("__cidNode"))
                this.__cidNode := CLFS_NODE_ID(this.ptr + 0)
            return this.__cidNode
        }
    }

    /**
     * @type {HANDLE}
     */
    hLog{
        get {
            if(!this.HasProp("__hLog"))
                this.__hLog := HANDLE(this.ptr + 8)
            return this.__hLog
        }
    }

    /**
     * @type {Integer}
     */
    cIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cContainers {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    cContainersReturned {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    eScanMode {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {Pointer<CLS_CONTAINER_INFORMATION>}
     */
    pinfoContainer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
