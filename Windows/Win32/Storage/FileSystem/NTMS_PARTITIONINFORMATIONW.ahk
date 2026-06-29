#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

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
 * @charset Unicode
 */
class NTMS_PARTITIONINFORMATIONW extends Win32Struct {
    static sizeof => 960

    static packingSize => 8

    /**
     * Unique physical media identifier for the medium that contains this side.
     * @type {Guid}
     */
    PhysicalMedia {
        get {
            if(!this.HasProp("__PhysicalMedia"))
                this.__PhysicalMedia := Guid(0, this)
            return this.__PhysicalMedia
        }
    }

    /**
     * Unique logical media identifier (LMID) for a piece of logical media that contains this side. This parameter is a <b>NULL</b> if the side is not allocated.
     * @type {Guid}
     */
    LogicalMedia {
        get {
            if(!this.HasProp("__LogicalMedia"))
                this.__LogicalMedia := Guid(16, this)
            return this.__LogicalMedia
        }
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Zero-relative value which indicates which side of a multi-sided media this is. For single-sided media, such as tape, this value is always zero. For dual-sided media one NTMS_PARITIONINFORMATION record has this property set to zero - the "A" side - and a second NTMS_PARTITIONINFORMATION record has it set to 1 - the "B" side.
     * @type {Integer}
     */
    Side {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * Length of the label ID string of the on-media identifier.
     * @type {Integer}
     */
    dwOmidLabelIdLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Label ID unique identifier of the on-media identifier.
     * @type {Array<Integer>}
     */
    OmidLabelId {
        get {
            if(!this.HasProp("__OmidLabelIdProxyArray"))
                this.__OmidLabelIdProxyArray := Win32FixedArray(this.ptr + 44, 255, Primitive, "char")
            return this.__OmidLabelIdProxyArray
        }
    }

    /**
     * Label type of the on-media identifier.
     * @type {String}
     */
    szOmidLabelType {
        get => StrGet(this.ptr + 300, 63, "UTF-16")
        set => StrPut(value, this.ptr + 300, 63, "UTF-16")
    }

    /**
     * Label information of the on-media identifier.
     * @type {String}
     */
    szOmidLabelInfo {
        get => StrGet(this.ptr + 428, 255, "UTF-16")
        set => StrPut(value, this.ptr + 428, 255, "UTF-16")
    }

    /**
     * Number of times this media has been mounted into a drive. This is initialized to zero when the objects are created in the database.
     * @type {Integer}
     */
    dwMountCount {
        get => NumGet(this, 940, "uint")
        set => NumPut("uint", value, this, 940)
    }

    /**
     * Number of times this media has been allocated.
     * @type {Integer}
     */
    dwAllocateCount {
        get => NumGet(this, 944, "uint")
        set => NumPut("uint", value, this, 944)
    }

    /**
     * Number bytes of storage available on this side.
     * @type {Integer}
     */
    Capacity {
        get => NumGet(this, 952, "int64")
        set => NumPut("int64", value, this, 952)
    }
}
