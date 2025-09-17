#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides the local and remote names of the file to transfer.
 * @remarks
 * BITS supports the HTTP, HTTPS, and SMB protocols for <b>RemoteName</b>. For HTTP requirements, see <a href="https://docs.microsoft.com/windows/desktop/Bits/http-requirements-for-bits-downloads">HTTP Requirements for BITS Downloads</a>.
  * 
  * <b>BITS 1.5 and earlier:  </b>The SMB protocol for <b>RemoteName</b> is not supported.
  * 
  * The following identifies whether BITS propagates a file's time stamps:
  * 
  * <ul>
  * <li>For HTTP downloads, BITS propagates the file's modification time stamp and sets the file's creation time to the modification time.</li>
  * <li>For HTTP uploads, BITS does not propagate the file's time stamps.</li>
  * <li>For SMB downloads and uploads, BITS propagates the file's time stamps.</li>
  * </ul>
  * BITS does not support SMB paths to named pipes or devices.  To maintain the owner and ACL information for files downloaded using SMB, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-setfileaclflags">IBackgroundCopyJob3::SetFileACLFlags</a> method.
  * 
  * If the path and file name portion of the URL for an HTTP upload and upload-reply job contains Unicode characters not in common to the code page on both the client and server, the URL translation will fail on the server and the BITS job will be placed in the error state.
  * If the server portion of the URL contains Unicode characters, you must encode the server portion using <a href="https://docs.microsoft.com/windows/win32/intl/handling-internationalized-domain-names--idns">Internationalized Domain Names</a> (IDN).
  * 
  * BITS does not limit the size of file you can download using HTTP. For upload limits, see the <a href="https://docs.microsoft.com/windows/desktop/Bits/bits-iis-extension-properties">BITSMaximumUploadSize</a> 
  * IIS extension property. 
  * 
  * <b>IIS 5.0:  </b>Downloads are limited to 4 GB.
  * 
  * <b>BITS 1.2 and earlier:  </b>For HTTP downloads, the maximum file size you can transfer is 4 GB; BITS cannot guarantee the successful transfer of files over 4 GB. If the  URL contains Unicode characters that are not in the US-ASCII character set, encode the Unicode string in UTF-8 before passing it as the remote file name to BITS. If you do not encode the string, the HTTP server may receive an incorrect URL and the job may enter the error state.
 * @see https://learn.microsoft.com/windows/win32/api/bits/ns-bits-bg_file_info
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_FILE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Null-terminated string that contains the name of the file on the server (for example, http://&lt;server&gt;/&lt;path&gt;/file.ext). The format of the name must conform to the transfer protocol you use. You cannot use wildcards in the path or file name. The URL must  contain only legal URL characters; no escape processing is performed. The URL is limited to 2,200 characters, not including the null terminator. 
     * 
     * 
     * Each segment of the URL is limited to MAX_PATH characters.
     * 
     * You can use SMB to express the remote name of the file to download or upload; there is no SMB support for  upload-reply jobs. You can specify the remote name as a UNC path, full path with a network drive, or use the "file://" prefix. <b>BITS 1.5 and earlier:  </b>The SMB protocol for <b>RemoteName</b> is not supported.
     * @type {Pointer<Char>}
     */
    RemoteName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Null-terminated string that contains the name of the file on the client. The file name must include the full path  (for example, d:\myapp\updates\file.ext). You cannot use wildcards in the path or file name, and directories in the path must exist. The path is limited to MAX_PATH, not including the null terminator. 
     * 
     * The user must have permission to write to the local directory for downloads and the reply portion of an upload-reply job. BITS does not support NTFS streams. Instead of using network drives, which are session specific, use UNC paths (for example, \\server\share\path\file). Do not include the \\? prefix in the path.
     * @type {Pointer<Char>}
     */
    LocalName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
