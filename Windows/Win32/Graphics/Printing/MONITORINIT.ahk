#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Registry\HKEY.ahk

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
                this.__hSpooler := HANDLE(8, this)
            return this.__hSpooler
        }
    }

    /**
     * @type {HKEY}
     */
    hckRegistryRoot{
        get {
            if(!this.HasProp("__hckRegistryRoot"))
                this.__hckRegistryRoot := HKEY(16, this)
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
     * @type {BOOL}
     */
    bLocal {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {PWSTR}
     */
    pszServerName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 48
    }
}
