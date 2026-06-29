#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Receives item data in response to a call to SHGetDataFromIDList.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shdescriptionid
 * @namespace Windows.Win32.UI.Shell
 */
class SHDESCRIPTIONID extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

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
     * @type {Guid}
     */
    clsid {
        get {
            if(!this.HasProp("__clsid"))
                this.__clsid := Guid(4, this)
            return this.__clsid
        }
    }
}
