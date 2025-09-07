#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MONITORINIT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    hSpooler{
        get {
            if(!this.HasProp("__hSpooler"))
                this.__hSpooler := HANDLE(this.ptr + 8)
            return this.__hSpooler
        }
    }

    /**
     * @type {HKEY}
     */
    hckRegistryRoot{
        get {
            if(!this.HasProp("__hckRegistryRoot"))
                this.__hckRegistryRoot := HKEY(this.ptr + 16)
            return this.__hckRegistryRoot
        }
    }

    /**
     * @type {Pointer<MONITORREG>}
     */
    pMonitorReg {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    bLocal {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {PWSTR}
     */
    pszServerName{
        get {
            if(!this.HasProp("__pszServerName"))
                this.__pszServerName := PWSTR(this.ptr + 40)
            return this.__pszServerName
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
