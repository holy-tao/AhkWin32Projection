#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a file association in RemoteApp and Desktop Connection.
 * @remarks
 * <b>MAX_FILE_ASSOC_EXTENSION_SIZE</b> is declared as follows:
 * 
 * <c>#define MAX_FILE_ASSOC_EXTENSION_SIZE 256</c>
 * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/ns-tspubplugin2com-pluginresource2fileassociation
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct pluginResource2FileAssociation {
    #StructPack 8

    /**
     * A null-terminated string that contains the file name extension. The length of this string is limited to <b>MAX_FILE_ASSOC_EXTENSION_SIZE</b> characters, including the terminating <b>NULL</b> character.
     */
    extName : WCHAR[256]

    /**
     * Indicates if this is the primary handler for the file association.
     */
    primaryHandler : Int8

    /**
     * The size, in bytes, of the <b>iconContents</b> buffer.
     */
    pceIconSize : UInt32

    /**
     * A byte array that contains the icon to display for files with the specified extension.
     */
    iconContents : IntPtr

}
