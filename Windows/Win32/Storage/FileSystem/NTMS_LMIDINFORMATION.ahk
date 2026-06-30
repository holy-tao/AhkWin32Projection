#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The NTMS_LMIDINFORMATION structure defines the properties specific to a logical media object.
 * @remarks
 * The 
 * <b>NTMS_LMIDINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_lmidinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NTMS_LMIDINFORMATION extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * Unique identifier of the media pool that contains the logical media.
     * @type {Guid}
     */
    MediaPool {
        get {
            if(!this.HasProp("__MediaPool"))
                this.__MediaPool := Guid(0, this)
            return this.__MediaPool
        }
    }

    /**
     * Number of sides in the media object.
     * @type {Integer}
     */
    dwNumberOfPartitions {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
