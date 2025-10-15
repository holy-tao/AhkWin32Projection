#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class HANG_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fAppHangMonitorEnabled{
        get {
            if(!this.HasProp("__fAppHangMonitorEnabled"))
                this.__fAppHangMonitorEnabled := BOOL(this.ptr + 0)
            return this.__fAppHangMonitorEnabled
        }
    }

    /**
     * @type {BOOL}
     */
    fTerminateOnHang{
        get {
            if(!this.HasProp("__fTerminateOnHang"))
                this.__fTerminateOnHang := BOOL(this.ptr + 4)
            return this.__fTerminateOnHang
        }
    }

    /**
     * @type {Integer}
     */
    DumpType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwHangTimeout {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwDumpCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwInfoMsgCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
