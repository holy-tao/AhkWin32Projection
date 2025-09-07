#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FILESETINFO structure identifies the remote and local names of the file to download.
 * @see https://learn.microsoft.com/windows/win32/api/qmgr/ns-qmgr-filesetinfo
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class FILESETINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Null-terminated string that contains the name of the file on the server (for example, <b>http://</b><i>ServerName</i><b>/</b><i>Path</i><b>/</b><i>FileName</i><b>.</b><i>ext</i>). The format of the name must conform to the transfer protocol you use. You cannot use wildcards in the path or file name. The URL must only contain legal URL characters; no escape processing is performed. The URL is limited to 2,200 characters, not including the terminating null character.
     * @type {Pointer<Ptr>}
     */
    bstrRemoteFile {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Null-terminated string that contains the name of the file on the client. The file name must include the full path, for example, <b>D:\\</b><i>MyApp</i><b>\\</b><i>UpdatesPath</i><b>\\</b><i>FileName</i><b>.</b><i>ext</i>. You cannot use wildcards in the path or file name, and directories in the path must exist. The path is limited to MAX_PATH, not including the terminating null character. The user must have permission to write to the local directory for downloads and uploads that request a reply. BITS does not support NTFS streams. Instead of using network drives, which are session specific, use UNC paths (for example, <b>\\</b><i>ServerName</i><b>\\</b><i>ShareName</i><b>\\</b><i>Path</i><b>\\</b><i>FileName</i><b>.</b><i>ext</i>).
     * @type {Pointer<Ptr>}
     */
    bstrLocalFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Not supported.
     * @type {Integer}
     */
    dwSizeHint {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
