#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_DEVINFO_LIST_DETAIL_DATA_A extends Win32Struct
{
    static sizeof => 288

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
                this.__RemoteMachineHandle := HANDLE(this.ptr + 16)
            return this.__RemoteMachineHandle
        }
    }

    /**
     * @type {String}
     */
    RemoteMachineName {
        get => StrGet(this.ptr + 24, 262, "UTF-8")
        set => StrPut(value, this.ptr + 24, 262, "UTF-8")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 288
    }
}
