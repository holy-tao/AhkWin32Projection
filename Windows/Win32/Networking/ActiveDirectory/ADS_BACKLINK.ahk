#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The ADS_BACKLINK structure is an ADSI representation of the Back Link attribute syntax.
 * @remarks
 * A <b>Back Link</b> attribute contains one or more servers that hold an external reference to the attached object.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_backlink
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_BACKLINK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Identifier of the remote server that requires an external reference to the object specified by <b>ObjectName</b>. See below.
     * @type {Integer}
     */
    RemoteID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The null-terminated Unicode string that specifies the name of an object to which the <b>Back Link</b> attribute is attached.
     * @type {PWSTR}
     */
    ObjectName{
        get {
            if(!this.HasProp("__ObjectName"))
                this.__ObjectName := PWSTR(this.ptr + 8)
            return this.__ObjectName
        }
    }
}
