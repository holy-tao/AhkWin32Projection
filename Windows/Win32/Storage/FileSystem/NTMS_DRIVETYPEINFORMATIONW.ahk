#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_DRIVETYPEINFORMATION structure defines the properties specific to a type of drive supported by RSM.
 * @remarks
 * 
 * The 
 * <b>NTMS_DRIVETYPEINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntmsapi.h header defines NTMS_DRIVETYPEINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ntmsapi/ns-ntmsapi-ntms_drivetypeinformationw
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class NTMS_DRIVETYPEINFORMATIONW extends Win32Struct
{
    static sizeof => 520

    static packingSize => 4

    /**
     * Name of the vendor of the drive. This is acquired directly from the device inquiry data.
     * @type {String}
     */
    szVendor {
        get => StrGet(this.ptr + 0, 127, "UTF-16")
        set => StrPut(value, this.ptr + 0, 127, "UTF-16")
    }

    /**
     * Name of the product of the drive. This is acquired directly from the device inquiry data.
     * @type {String}
     */
    szProduct {
        get => StrGet(this.ptr + 256, 127, "UTF-16")
        set => StrPut(value, this.ptr + 256, 127, "UTF-16")
    }

    /**
     * This member is reserved for future use and should be ignored.
     * @type {Integer}
     */
    NumberOfHeads {
        get => NumGet(this, 512, "uint")
        set => NumPut("uint", value, this, 512)
    }

    /**
     * 
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 516, "uint")
        set => NumPut("uint", value, this, 516)
    }
}
