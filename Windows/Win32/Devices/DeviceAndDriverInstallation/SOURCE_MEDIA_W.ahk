#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SOURCE_MEDIA structure is used with the SPFILENOTIFY_NEEDMEDIA notification to pass source media information. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SOURCE_MEDIA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-source_media_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SOURCE_MEDIA_W extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * This member is not currently used.
     * @type {PWSTR}
     */
    Reserved {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Optional  tag file that can be used to identify the source media.
     * @type {PWSTR}
     */
    Tagfile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Human-readable description of the source media.
     * @type {PWSTR}
     */
    Description {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Path to the source that needs the new media.
     * @type {PWSTR}
     */
    SourcePath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Source file to be retrieved from the new media.
     * @type {PWSTR}
     */
    SourceFile {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
