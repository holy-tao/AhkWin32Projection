#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_devinfo_list_detail_data_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_DEVINFO_LIST_DETAIL_DATA_W extends Win32Struct
{
    static sizeof => 552

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ClassGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HANDLE}
     */
    RemoteMachineHandle{
        get {
            if(!this.HasProp("__RemoteMachineHandle"))
                this.__RemoteMachineHandle := HANDLE(16, this)
            return this.__RemoteMachineHandle
        }
    }

    /**
     * @type {String}
     */
    RemoteMachineName {
        get => StrGet(this.ptr + 24, 262, "UTF-16")
        set => StrPut(value, this.ptr + 24, 262, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 552
    }
}
