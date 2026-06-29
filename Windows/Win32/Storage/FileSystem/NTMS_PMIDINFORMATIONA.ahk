#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The NTMS_PMIDINFORMATION structure defines the properties specific to a physical media object. (ANSI)
 * @remarks
 * The 
 * <b>NTMS_PMIDINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntmsapi.h header defines NTMS_PMIDINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_pmidinformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
class NTMS_PMIDINFORMATIONA extends Win32Struct {
    static sizeof => 216

    static packingSize => 4

    /**
     * Unique ID of the library in which the media is contained.
     * @type {Guid}
     */
    CurrentLibrary {
        get {
            if(!this.HasProp("__CurrentLibrary"))
                this.__CurrentLibrary := Guid(0, this)
            return this.__CurrentLibrary
        }
    }

    /**
     * Unique ID of the media pool to which the media is assigned.
     * @type {Guid}
     */
    MediaPool {
        get {
            if(!this.HasProp("__MediaPool"))
                this.__MediaPool := Guid(16, this)
            return this.__MediaPool
        }
    }

    /**
     * Unique ID of the physical location object for the media.
     * @type {Guid}
     */
    Location {
        get {
            if(!this.HasProp("__Location"))
                this.__Location := Guid(32, this)
            return this.__Location
        }
    }

    /**
     * Current location type of a piece of physical media. The value of this member can be set to NTMS_STORAGESLOT, NTMS_DRIVE, NTMS_IEPORT. (Offline media are in slots.)
     * @type {Integer}
     */
    LocationType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Unique ID of a media type object.
     * @type {Guid}
     */
    MediaType {
        get {
            if(!this.HasProp("__MediaType"))
                this.__MediaType := Guid(52, this)
            return this.__MediaType
        }
    }

    /**
     * Unique ID of the library storage slot in which media is stored.
     * @type {Guid}
     */
    HomeSlot {
        get {
            if(!this.HasProp("__HomeSlot"))
                this.__HomeSlot := Guid(68, this)
            return this.__HomeSlot
        }
    }

    /**
     * String that matches the bar-code value on a bar-code label of a piece of physical media.
     * @type {String}
     */
    szBarCode {
        get => StrGet(this.ptr + 84, 63, "UTF-8")
        set => StrPut(value, this.ptr + 84, 63, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    BarCodeState {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Sequential number assigned to the specified medium as a human-readable value that must be transcribed by a user on the medium so that the medium can be located in an offline library.
     * @type {String}
     */
    szSequenceNumber {
        get => StrGet(this.ptr + 152, 31, "UTF-8")
        set => StrPut(value, this.ptr + 152, 31, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    MediaState {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * Number of sides on the medium.
     * @type {Integer}
     */
    dwNumberOfPartitions {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * SCSI media type code.
     * @type {Integer}
     */
    dwMediaTypeCode {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * SCSI density code.
     * @type {Integer}
     */
    dwDensityCode {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * Globally unique ID of the side of the media that is currently mounted.
     * @type {Guid}
     */
    MountedPartition {
        get {
            if(!this.HasProp("__MountedPartition"))
                this.__MountedPartition := Guid(200, this)
            return this.__MountedPartition
        }
    }
}
