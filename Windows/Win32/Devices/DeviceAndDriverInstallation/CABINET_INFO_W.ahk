#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class CABINET_INFO_W extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    CabinetPath{
        get {
            if(!this.HasProp("__CabinetPath"))
                this.__CabinetPath := PWSTR(this.ptr + 0)
            return this.__CabinetPath
        }
    }

    /**
     * @type {PWSTR}
     */
    CabinetFile{
        get {
            if(!this.HasProp("__CabinetFile"))
                this.__CabinetFile := PWSTR(this.ptr + 8)
            return this.__CabinetFile
        }
    }

    /**
     * @type {PWSTR}
     */
    DiskName{
        get {
            if(!this.HasProp("__DiskName"))
                this.__DiskName := PWSTR(this.ptr + 16)
            return this.__DiskName
        }
    }

    /**
     * @type {Integer}
     */
    SetId {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CabinetNumber {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }
}
