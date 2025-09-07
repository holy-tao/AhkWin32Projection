#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FILE_IN_CABINET_INFO structure provides information about a file found in the cabinet. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The setupapi.h header defines FILE_IN_CABINET_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-file_in_cabinet_info_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class FILE_IN_CABINET_INFO_W extends Win32Struct
{
    static sizeof => 542

    static packingSize => 1

    /**
     * File name as it exists within the cabinet file.
     * @type {Pointer<Ptr>}
     */
    NameInCabinet {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Uncompressed size of the file in the cabinet, in bytes.
     * @type {Integer}
     */
    FileSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If an error occurs, this member is the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If no error has occurred, it is  NO_ERROR.
     * @type {Integer}
     */
    Win32Error {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Date that the file was last saved.
     * @type {Integer}
     */
    DosDate {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * MS-DOS time stamp of the file in the cabinet.
     * @type {Integer}
     */
    DosTime {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Attributes of the file in the cabinet.
     * @type {Integer}
     */
    DosAttribs {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * Target path and file name.
     * @type {String}
     */
    FullTargetName {
        get => StrGet(this.ptr + 22, 259, "UTF-16")
        set => StrPut(value, this.ptr + 22, 259, "UTF-16")
    }
}
