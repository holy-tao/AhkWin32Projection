#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides progress information related to the reply portion of an upload-reply job.
 * @see https://docs.microsoft.com/windows/win32/api//bits1_5/ns-bits1_5-bg_job_reply_progress
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_JOB_REPLY_PROGRESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size of the file in bytes. The value is <b>BG_SIZE_UNKNOWN</b> if the reply has not begun.
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
}
