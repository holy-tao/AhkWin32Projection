#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\DICOLORSET.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset Unicode
 */
class DICONFIGUREDEVICESPARAMSW extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwcUsers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    lptszUserNames{
        get {
            if(!this.HasProp("__lptszUserNames"))
                this.__lptszUserNames := PWSTR(this.ptr + 8)
            return this.__lptszUserNames
        }
    }

    /**
     * @type {Integer}
     */
    dwcFormats {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<DIACTIONFORMATW>}
     */
    lprgFormats {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 32)
            return this.__hwnd
        }
    }

    /**
     * @type {DICOLORSET}
     */
    dics{
        get {
            if(!this.HasProp("__dics"))
                this.__dics := DICOLORSET(this.ptr + 40)
            return this.__dics
        }
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    lpUnkDDSTarget {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
