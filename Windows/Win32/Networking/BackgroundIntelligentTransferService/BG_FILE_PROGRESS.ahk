#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Provides file-related progress information, such as the number of bytes transferred.
 * @remarks
 * To determine if BITS transferred the file, you can:
 * 
 * <ul>
 * <li>Compare <b>BytesTransferred</b> to <b>BytesTotal</b>.</li>
 * <li>Implement the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopycallback2-filetransferred">IBackgroundCopyCallback2::FileTransferred</a> callback.</li>
 * </ul>
 * Note that the progress values will be set back to zero if the time stamp of the URL changes.
 * @see https://learn.microsoft.com/windows/win32/api/bits/ns-bits-bg_file_progress
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_FILE_PROGRESS {
    #StructPack 8

    /**
     * Size of the file in bytes. If BITS cannot determine the size of the file (for example, if the file or server does not exist), the value is BG_SIZE_UNKNOWN.
     * 
     * If you are downloading ranges from a file, <b>BytesTotal</b> reflects the total number of bytes you want to download from the file.
     */
    BytesTotal : Int64

    /**
     * Number of bytes transferred.
     */
    BytesTransferred : Int64

    /**
     * For downloads, the value is <b>TRUE</b> if the file is available to the user; otherwise, the value is <b>FALSE</b>. Files are available to the user after calling the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method. If the <b>Complete</b> method generates a  transient error, those files processed before the error occurred are available to the user; the others are not. Use the <b>Completed</b> member to determine if the file is available to the user when 
     * <b>Complete</b> fails. 
     * 
     * 
     * 
     * 
     * For uploads, the value is <b>TRUE</b> when the file upload is complete; otherwise, the value is <b>FALSE</b>.
     */
    Completed : BOOL

}
