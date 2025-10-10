#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides job-related progress information, such as the number of bytes and files transferred.
 * @see https://docs.microsoft.com/windows/win32/api//bits/ns-bits-bg_job_progress
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_JOB_PROGRESS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Total number of bytes to transfer for all files in the job. If the value is BG_SIZE_UNKNOWN, the total size of all files in the job has not been determined. BITS does not set this value if it cannot determine the size of one of the files. For example, if the specified file or server does not exist, BITS cannot determine the size of the file.
     * 
     * If you are downloading ranges from the file, <b>BytesTotal</b> includes the total number of bytes you want to download from the file.
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
     * Total number of files to transfer for this job.
     * @type {Integer}
     */
    FilesTotal {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of files transferred.
     * @type {Integer}
     */
    FilesTransferred {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
