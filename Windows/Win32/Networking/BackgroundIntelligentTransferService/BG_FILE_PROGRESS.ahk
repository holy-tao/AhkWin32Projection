#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Provides file-related progress information, such as the number of bytes transferred.
 * @remarks
 * 
  * To determine if BITS transferred the file, you can:
  * 
  * <ul>
  * <li>Compare <b>BytesTransferred</b> to <b>BytesTotal</b>.</li>
  * <li>Implement the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopycallback2-filetransferred">IBackgroundCopyCallback2::FileTransferred</a> callback.</li>
  * </ul>
  * Note that the progress values will be set back to zero if the time stamp of the URL changes.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bits/ns-bits-bg_file_progress
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_FILE_PROGRESS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Size of the file in bytes. If BITS cannot determine the size of the file (for example, if the file or server does not exist), the value is BG_SIZE_UNKNOWN.
     * 
     * If you are downloading ranges from a file, <b>BytesTotal</b> reflects the total number of bytes you want to download from the file.
     * @type {Integer}
     */
    BytesTotal {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of bytes transferred.
     * @type {Integer}
     */
    BytesTransferred {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * For downloads, the value is <b>TRUE</b> if the file is available to the user; otherwise, the value is <b>FALSE</b>. Files are available to the user after calling the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method. If the <b>Complete</b> method generates a  transient error, those files processed before the error occurred are available to the user; the others are not. Use the <b>Completed</b> member to determine if the file is available to the user when 
     * <b>Complete</b> fails. 
     * 
     * 
     * 
     * 
     * For uploads, the value is <b>TRUE</b> when the file upload is complete; otherwise, the value is <b>FALSE</b>.
     * @type {BOOL}
     */
    Completed{
        get {
            if(!this.HasProp("__Completed"))
                this.__Completed := BOOL(this.ptr + 16)
            return this.__Completed
        }
    }
}
