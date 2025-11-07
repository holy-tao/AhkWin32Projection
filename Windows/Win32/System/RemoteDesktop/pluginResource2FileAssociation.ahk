#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a file association in RemoteApp and Desktop Connection.
 * @remarks
 * 
 * <b>MAX_FILE_ASSOC_EXTENSION_SIZE</b> is declared as follows:
 * 
 * <c>#define MAX_FILE_ASSOC_EXTENSION_SIZE 256</c>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tspubplugin2com/ns-tspubplugin2com-pluginresource2fileassociation
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class pluginResource2FileAssociation extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * A null-terminated string that contains the file name extension. The length of this string is limited to <b>MAX_FILE_ASSOC_EXTENSION_SIZE</b> characters, including the terminating <b>NULL</b> character.
     * @type {String}
     */
    extName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * Indicates if this is the primary handler for the file association.
     * @type {Integer}
     */
    primaryHandler {
        get => NumGet(this, 512, "char")
        set => NumPut("char", value, this, 512)
    }

    /**
     * The size, in bytes, of the <b>iconContents</b> buffer.
     * @type {Integer}
     */
    pceIconSize {
        get => NumGet(this, 516, "uint")
        set => NumPut("uint", value, this, 516)
    }

    /**
     * A byte array that contains the icon to display for files with the specified extension.
     * @type {Pointer<Integer>}
     */
    iconContents {
        get => NumGet(this, 520, "ptr")
        set => NumPut("ptr", value, this, 520)
    }
}
