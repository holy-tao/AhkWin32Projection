#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides job-related progress information, such as the number of bytes and files transferred.
 * @see https://learn.microsoft.com/windows/win32/api/bits/ns-bits-bg_job_progress
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_JOB_PROGRESS {
    #StructPack 8

    /**
     * Total number of bytes to transfer for all files in the job. If the value is BG_SIZE_UNKNOWN, the total size of all files in the job has not been determined. BITS does not set this value if it cannot determine the size of one of the files. For example, if the specified file or server does not exist, BITS cannot determine the size of the file.
     * 
     * If you are downloading ranges from the file, <b>BytesTotal</b> includes the total number of bytes you want to download from the file.
     */
    BytesTotal : Int64

    /**
     * Number of bytes transferred.
     */
    BytesTransferred : Int64

    /**
     * Total number of files to transfer for this job.
     */
    FilesTotal : UInt32

    /**
     * Number of files transferred.
     */
    FilesTransferred : UInt32

}
