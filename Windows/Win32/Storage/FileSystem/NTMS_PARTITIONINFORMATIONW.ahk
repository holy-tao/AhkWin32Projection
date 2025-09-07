#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_PARTITIONINFORMATION structure defines the properties specific to the side object. (Unicode)
 * @remarks
 * The 
  * <b>NTMS_PARTITIONINFORMATION</b> structure is included in the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The ntmsapi.h header defines NTMS_PARTITIONINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_partitioninformationw
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class NTMS_PARTITIONINFORMATIONW extends Win32Struct
{
    static sizeof => 944

    static packingSize => 8

    /**
     * Unique physical media identifier for the medium that contains this side.
     * @type {Pointer<Guid>}
     */
    PhysicalMedia {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Unique logical media identifier (LMID) for a piece of logical media that contains this side. This parameter is a <b>NULL</b> if the side is not allocated.
     * @type {Pointer<Guid>}
     */
    LogicalMedia {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    State {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Zero-relative value which indicates which side of a multi-sided media this is. For single-sided media, such as tape, this value is always zero. For dual-sided media one NTMS_PARITIONINFORMATION record has this property set to zero - the "A" side - and a second NTMS_PARTITIONINFORMATION record has it set to 1 - the "B" side.
     * @type {Integer}
     */
    Side {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * Length of the label ID string of the on-media identifier.
     * @type {Integer}
     */
    dwOmidLabelIdLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Label ID unique identifier of the on-media identifier.
     * @type {Array<Byte>}
     */
    OmidLabelId{
        get {
            if(!this.HasProp("__OmidLabelIdProxyArray"))
                this.__OmidLabelIdProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__OmidLabelIdProxyArray
        }
    }

    /**
     * Label type of the on-media identifier.
     * @type {String}
     */
    szOmidLabelType {
        get => StrGet(this.ptr + 284, 63, "UTF-16")
        set => StrPut(value, this.ptr + 284, 63, "UTF-16")
    }

    /**
     * Label information of the on-media identifier.
     * @type {String}
     */
    szOmidLabelInfo {
        get => StrGet(this.ptr + 412, 255, "UTF-16")
        set => StrPut(value, this.ptr + 412, 255, "UTF-16")
    }

    /**
     * Number of times this media has been mounted into a drive. This is initialized to zero when the objects are created in the database.
     * @type {Integer}
     */
    dwMountCount {
        get => NumGet(this, 924, "uint")
        set => NumPut("uint", value, this, 924)
    }

    /**
     * Number of times this media has been allocated.
     * @type {Integer}
     */
    dwAllocateCount {
        get => NumGet(this, 928, "uint")
        set => NumPut("uint", value, this, 928)
    }

    /**
     * Number bytes of storage available on this side.
     * @type {Integer}
     */
    Capacity {
        get => NumGet(this, 936, "int64")
        set => NumPut("int64", value, this, 936)
    }
}
