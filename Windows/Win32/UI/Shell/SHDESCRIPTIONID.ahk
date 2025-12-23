#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Receives item data in response to a call to SHGetDataFromIDList.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shdescriptionid
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHDESCRIPTIONID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwDescriptionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>CLSID</b>
     * 
     * Receives the CLSID of the object to which the item belongs.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
