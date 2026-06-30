#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The NTMS_STORAGESLOTINFORMATION structure defines properties specific to a storage slot object.
 * @remarks
 * The 
 * <b>NTMS_STORAGESLOTINFORMATION</b> structure is part of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_storageslotinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NTMS_STORAGESLOTINFORMATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * Number of the slot in the library.
     * @type {Integer}
     */
    Number {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Library that contains the slot.
     * @type {Guid}
     */
    Library {
        get {
            if(!this.HasProp("__Library"))
                this.__Library := Guid(8, this)
            return this.__Library
        }
    }
}
