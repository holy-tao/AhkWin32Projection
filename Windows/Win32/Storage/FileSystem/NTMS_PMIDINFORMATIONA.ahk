#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 * @charset ANSI
 */
class NTMS_PMIDINFORMATIONA extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * Unique ID of the library in which the media is contained.
     * @type {Pointer<Guid>}
     */
    CurrentLibrary {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Unique ID of the media pool to which the media is assigned.
     * @type {Pointer<Guid>}
     */
    MediaPool {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Unique ID of the physical location object for the media.
     * @type {Pointer<Guid>}
     */
    Location {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Current location type of a piece of physical media. The value of this member can be set to NTMS_STORAGESLOT, NTMS_DRIVE, NTMS_IEPORT. (Offline media are in slots.)
     * @type {Integer}
     */
    LocationType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Unique ID of a media type object.
     * @type {Pointer<Guid>}
     */
    MediaType {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Unique ID of the library storage slot in which media is stored.
     * @type {Pointer<Guid>}
     */
    HomeSlot {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * String that matches the bar-code value on a bar-code label of a piece of physical media.
     * @type {String}
     */
    szBarCode {
        get => StrGet(this.ptr + 48, 63, "UTF-8")
        set => StrPut(value, this.ptr + 48, 63, "UTF-8")
    }

    /**
     * 
     * @type {Integer}
     */
    BarCodeState {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Sequential number assigned to the specified medium as a human-readable value that must be transcribed by a user on the medium so that the medium can be located in an offline library.
     * @type {String}
     */
    szSequenceNumber {
        get => StrGet(this.ptr + 116, 31, "UTF-8")
        set => StrPut(value, this.ptr + 116, 31, "UTF-8")
    }

    /**
     * 
     * @type {Integer}
     */
    MediaState {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Number of sides on the medium.
     * @type {Integer}
     */
    dwNumberOfPartitions {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * SCSI media type code.
     * @type {Integer}
     */
    dwMediaTypeCode {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * SCSI density code.
     * @type {Integer}
     */
    dwDensityCode {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Globally unique ID of the side of the media that is currently mounted.
     * @type {Pointer<Guid>}
     */
    MountedPartition {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }
}
