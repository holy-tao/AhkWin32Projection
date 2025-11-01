#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_devinstall_params_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_DEVINSTALL_PARAMS_A extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    FlagsEx {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {HWND}
     */
    hwndParent{
        get {
            if(!this.HasProp("__hwndParent"))
                this.__hwndParent := HWND(16, this)
            return this.__hwndParent
        }
    }

    /**
     * @type {Pointer<PSP_FILE_CALLBACK_A>}
     */
    InstallMsgHandler {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    InstallMsgHandlerContext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    FileQueue {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    ClassInstallReserved {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {String}
     */
    DriverPath {
        get => StrGet(this.ptr + 60, 259, "UTF-8")
        set => StrPut(value, this.ptr + 60, 259, "UTF-8")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 320
    }
}
