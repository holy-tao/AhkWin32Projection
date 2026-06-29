#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_DEVICE_TYPE.ahk" { FILE_DEVICE_TYPE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The NTMS_DRIVETYPEINFORMATION structure defines the properties specific to a type of drive supported by RSM. (ANSI)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_drivetypeinformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_DRIVETYPEINFORMATIONA {
    #StructPack 4

    /**
     * Name of the vendor of the drive. This is acquired directly from the device inquiry data.
     */
    szVendor : CHAR[128]

    /**
     * Name of the product of the drive. This is acquired directly from the device inquiry data.
     */
    szProduct : CHAR[128]

    /**
     * This member is reserved for future use and should be ignored.
     */
    NumberOfHeads : UInt32

    DeviceType : FILE_DEVICE_TYPE

}
