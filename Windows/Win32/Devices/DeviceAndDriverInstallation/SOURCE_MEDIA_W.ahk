#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
    static sizeof => 44

    static packingSize => 1

    /**
     * This member is not currently used.
     * @type {PWSTR}
     */
    Reserved{
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := PWSTR(this.ptr + 0)
            return this.__Reserved
        }
    }

    /**
     * Optional  tag file that can be used to identify the source media.
     * @type {PWSTR}
     */
    Tagfile{
        get {
            if(!this.HasProp("__Tagfile"))
                this.__Tagfile := PWSTR(this.ptr + 8)
            return this.__Tagfile
        }
    }

    /**
     * Human-readable description of the source media.
     * @type {PWSTR}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := PWSTR(this.ptr + 16)
            return this.__Description
        }
    }

    /**
     * Path to the source that needs the new media.
     * @type {PWSTR}
     */
    SourcePath{
        get {
            if(!this.HasProp("__SourcePath"))
                this.__SourcePath := PWSTR(this.ptr + 24)
            return this.__SourcePath
        }
    }

    /**
     * Source file to be retrieved from the new media.
     * @type {PWSTR}
     */
    SourceFile{
        get {
            if(!this.HasProp("__SourceFile"))
                this.__SourceFile := PWSTR(this.ptr + 32)
            return this.__SourceFile
        }
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
