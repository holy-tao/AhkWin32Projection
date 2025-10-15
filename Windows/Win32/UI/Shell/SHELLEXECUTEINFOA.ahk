#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class SHELLEXECUTEINFOA extends Win32Struct
{
    static sizeof => 112

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
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 8)
            return this.__hwnd
        }
    }

    /**
     * @type {PSTR}
     */
    lpVerb{
        get {
            if(!this.HasProp("__lpVerb"))
                this.__lpVerb := PSTR(this.ptr + 16)
            return this.__lpVerb
        }
    }

    /**
     * @type {PSTR}
     */
    lpFile{
        get {
            if(!this.HasProp("__lpFile"))
                this.__lpFile := PSTR(this.ptr + 24)
            return this.__lpFile
        }
    }

    /**
     * @type {PSTR}
     */
    lpParameters{
        get {
            if(!this.HasProp("__lpParameters"))
                this.__lpParameters := PSTR(this.ptr + 32)
            return this.__lpParameters
        }
    }

    /**
     * @type {PSTR}
     */
    lpDirectory{
        get {
            if(!this.HasProp("__lpDirectory"))
                this.__lpDirectory := PSTR(this.ptr + 40)
            return this.__lpDirectory
        }
    }

    /**
     * @type {Integer}
     */
    nShow {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {HINSTANCE}
     */
    hInstApp{
        get {
            if(!this.HasProp("__hInstApp"))
                this.__hInstApp := HINSTANCE(this.ptr + 56)
            return this.__hInstApp
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    lpIDList {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {PSTR}
     */
    lpClass{
        get {
            if(!this.HasProp("__lpClass"))
                this.__lpClass := PSTR(this.ptr + 72)
            return this.__lpClass
        }
    }

    /**
     * @type {HKEY}
     */
    hkeyClass{
        get {
            if(!this.HasProp("__hkeyClass"))
                this.__hkeyClass := HKEY(this.ptr + 80)
            return this.__hkeyClass
        }
    }

    /**
     * @type {Integer}
     */
    dwHotKey {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {HANDLE}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HANDLE(this.ptr + 96)
            return this.__hIcon
        }
    }

    /**
     * @type {HANDLE}
     */
    hMonitor{
        get {
            if(!this.HasProp("__hMonitor"))
                this.__hMonitor := HANDLE(this.ptr + 96)
            return this.__hMonitor
        }
    }

    /**
     * @type {HANDLE}
     */
    hProcess{
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(this.ptr + 104)
            return this.__hProcess
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 112
    }
}
