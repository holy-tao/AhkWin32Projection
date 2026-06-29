#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The FILE_IN_CABINET_INFO structure provides information about a file found in the cabinet. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines FILE_IN_CABINET_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-file_in_cabinet_info_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct FILE_IN_CABINET_INFO_A {
    #StructPack 8

    /**
     * File name as it exists within the cabinet file.
     */
    NameInCabinet : PSTR

    /**
     * Uncompressed size of the file in the cabinet, in bytes.
     */
    FileSize : UInt32

    /**
     * If an error occurs, this member is the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If no error has occurred, it is  NO_ERROR.
     */
    Win32Error : UInt32

    /**
     * Date that the file was last saved.
     */
    DosDate : UInt16

    /**
     * MS-DOS time stamp of the file in the cabinet.
     */
    DosTime : UInt16

    /**
     * Attributes of the file in the cabinet.
     */
    DosAttribs : UInt16

    /**
     * Target path and file name.
     */
    FullTargetName : CHAR[260]

}
