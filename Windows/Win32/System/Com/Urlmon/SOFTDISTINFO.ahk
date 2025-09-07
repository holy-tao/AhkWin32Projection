#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a software update.
 * @remarks
 * The most-significant unsigned long integer of a version number contains the major and minor version numbers. The least-significant unsigned long integer of the version number contains the custom version and build numbers.
 * @see https://learn.microsoft.com/windows/win32/api/urlmon/ns-urlmon-softdistinfo
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class SOFTDISTINFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwAdState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A string that contains the contents of the TITLE flag from the associated .cdf file.
     * @type {PWSTR}
     */
    szTitle{
        get {
            if(!this.HasProp("__szTitle"))
                this.__szTitle := PWSTR(this.ptr + 16)
            return this.__szTitle
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A string that contains the contents of the ABSTRACT flag from the associated .cdf file.
     * @type {PWSTR}
     */
    szAbstract{
        get {
            if(!this.HasProp("__szAbstract"))
                this.__szAbstract := PWSTR(this.ptr + 24)
            return this.__szAbstract
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A string that contains the URL of the webpage to advertise or install the update.
     * @type {PWSTR}
     */
    szHREF{
        get {
            if(!this.HasProp("__szHREF"))
                this.__szHREF := PWSTR(this.ptr + 32)
            return this.__szHREF
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The most-significant unsigned long integer value of the installed version number.
     * @type {Integer}
     */
    dwInstalledVersionMS {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The least-significant unsigned long integer value of the installed version number.
     * @type {Integer}
     */
    dwInstalledVersionLS {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The most-significant unsigned long integer value of the update version number.
     * @type {Integer}
     */
    dwUpdateVersionMS {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The least-significant unsigned long integer value of the update version number.
     * @type {Integer}
     */
    dwUpdateVersionLS {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The most-significant unsigned long integer value of the advertised version number.
     * @type {Integer}
     */
    dwAdvertisedVersionMS {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The least-significant unsigned long integer value of the advertised version number.
     * @type {Integer}
     */
    dwAdvertisedVersionLS {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved. Must be set to zero.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 72
    }
}
