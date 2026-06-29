#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The NTMS_CHANGERINFORMATION structure defines properties specific to a robotic changer object. (ANSI)
 * @remarks
 * The 
 * <b>NTMS_CHANGERINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntmsapi.h header defines NTMS_CHANGERINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_changerinformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
class NTMS_CHANGERINFORMATIONA extends Win32Struct {
    static sizeof => 172

    static packingSize => 4

    /**
     * Number of the changer within the library.
     * @type {Integer}
     */
    Number {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Identifier of the changer type of this changer.
     * @type {Guid}
     */
    ChangerType {
        get {
            if(!this.HasProp("__ChangerType"))
                this.__ChangerType := Guid(4, this)
            return this.__ChangerType
        }
    }

    /**
     * Serial number for the changer represented as a string. Devices that do not support serial numbers report <b>NULL</b> for this member.
     * @type {String}
     */
    szSerialNumber {
        get => StrGet(this.ptr + 20, 31, "UTF-8")
        set => StrPut(value, this.ptr + 20, 31, "UTF-8")
    }

    /**
     * Revision for the changer, represented as a string.
     * @type {String}
     */
    szRevision {
        get => StrGet(this.ptr + 52, 31, "UTF-8")
        set => StrPut(value, this.ptr + 52, 31, "UTF-8")
    }

    /**
     * Name of the device used to access the changer.
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 84, 63, "UTF-8")
        set => StrPut(value, this.ptr + 84, 63, "UTF-8")
    }

    /**
     * SCSI host adapter to which the changer is connected.
     * @type {Integer}
     */
    ScsiPort {
        get => NumGet(this, 148, "ushort")
        set => NumPut("ushort", value, this, 148)
    }

    /**
     * SCSI bus to which the changer is connected.
     * @type {Integer}
     */
    ScsiBus {
        get => NumGet(this, 150, "ushort")
        set => NumPut("ushort", value, this, 150)
    }

    /**
     * SCSI target ID for the changer.
     * @type {Integer}
     */
    ScsiTarget {
        get => NumGet(this, 152, "ushort")
        set => NumPut("ushort", value, this, 152)
    }

    /**
     * SCSI logical unit ID for the changer.
     * @type {Integer}
     */
    ScsiLun {
        get => NumGet(this, 154, "ushort")
        set => NumPut("ushort", value, this, 154)
    }

    /**
     * Unique identifier of the library that contains the changer.
     * @type {Guid}
     */
    Library {
        get {
            if(!this.HasProp("__Library"))
                this.__Library := Guid(156, this)
            return this.__Library
        }
    }
}
