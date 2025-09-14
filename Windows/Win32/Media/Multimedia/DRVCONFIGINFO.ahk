#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the registry key and value names associated with the installable driver.
 * @see https://learn.microsoft.com/windows/win32/api/mmiscapi/ns-mmiscapi-drvconfiginfo
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class DRVCONFIGINFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    dwDCISize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Address of a null-terminated, wide-character string specifying the name of the registry key associated with the driver.
     * @type {Pointer<PWSTR>}
     */
    lpszDCISectionName {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * Address of a null-terminated, wide-character string specifying the name of the registry value associated with the driver.
     * @type {Pointer<PWSTR>}
     */
    lpszDCIAliasName {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }
}
