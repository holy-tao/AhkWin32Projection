#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the type of transfer job, such as download.
 * @see https://learn.microsoft.com/windows/win32/api/bits/ne-bits-bg_job_type
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_JOB_TYPE extends Win32Enum{

    /**
     * Specifies that the job downloads files to the client.
     * @type {Integer (Int32)}
     */
    static BG_JOB_TYPE_DOWNLOAD => 0

    /**
     * Specifies that the job uploads a file to the server. 
     * 
     * **BITS 1.2 and earlier:** not supported.
     * @type {Integer (Int32)}
     */
    static BG_JOB_TYPE_UPLOAD => 1

    /**
     * Specifies that the job uploads a file to the server, and receives a reply file from the server application. 
     * 
     * **BITS 1.2 and earlier:** not supported.
     * @type {Integer (Int32)}
     */
    static BG_JOB_TYPE_UPLOAD_REPLY => 2
}
