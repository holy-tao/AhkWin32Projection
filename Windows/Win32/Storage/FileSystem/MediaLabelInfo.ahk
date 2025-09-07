#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MediaLabelInfo structure conveys information to the RSM database about a tape OMID. The media label library fills in this structure for all media labels the library recognizes.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsmli/ns-ntmsmli-medialabelinfo
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class MediaLabelInfo extends Win32Struct
{
    static sizeof => 900

    static packingSize => 4

    /**
     * Unicode string that identifies the source of the media label. Often this is the name of the backup application or Windows command that wrote the label,
     * for example, "Microsoft Windows Wbadmin".
     * @type {String}
     */
    LabelType {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * Number of bytes that are used in the <b>LabelID</b> member.
     * @type {Integer}
     */
    LabelIDSize {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Unique identifier for the media label.
     * @type {Array<Byte>}
     */
    LabelID{
        get {
            if(!this.HasProp("__LabelIDProxyArray"))
                this.__LabelIDProxyArray := Win32FixedArray(this.ptr + 132, 1, Primitive, "char")
            return this.__LabelIDProxyArray
        }
    }

    /**
     * Unicode string that describes the media. For example, the description for a backup media label would be similar to "Tape created on 04/14/97".
     * @type {String}
     */
    LabelAppDescr {
        get => StrGet(this.ptr + 388, 255, "UTF-16")
        set => StrPut(value, this.ptr + 388, 255, "UTF-16")
    }
}
