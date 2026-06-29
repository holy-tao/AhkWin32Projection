#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides progress information related to the reply portion of an upload-reply job.
 * @see https://learn.microsoft.com/windows/win32/api/bits1_5/ns-bits1_5-bg_job_reply_progress
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_JOB_REPLY_PROGRESS {
    #StructPack 8

    /**
     * Size of the file in bytes. The value is <b>BG_SIZE_UNKNOWN</b> if the reply has not begun.
     */
    BytesTotal : Int64

    /**
     * Number of bytes transferred.
     */
    BytesTransferred : Int64

}
