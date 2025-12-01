#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FAX_JOB_STATUS_ENUM enumeration defines the status values for a fax job.Note  The members fjsPAUSED and fjsNOLINE are modifiers; they can be used in combination with any other member of this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_job_status_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_JOB_STATUS_ENUM extends Win32Enum{

    /**
     * The fax job is in the queue and pending service.
     * @type {Integer (Int32)}
     */
    static fjsPENDING => 1

    /**
     * The fax job is in progress.
     * @type {Integer (Int32)}
     */
    static fjsINPROGRESS => 2

    /**
     * The fax job failed.
     * @type {Integer (Int32)}
     */
    static fjsFAILED => 8

    /**
     * The fax server paused the fax job. This value can arrive in a bitwise combination with another value.
     * @type {Integer (Int32)}
     */
    static fjsPAUSED => 16

    /**
     * There is no line available to send the fax. The fax server will send the transmission when a line is available. This value can arrive in a bitwise combination with another value.
     * @type {Integer (Int32)}
     */
    static fjsNOLINE => 32

    /**
     * The fax job failed. The fax server will attempt to retransmit the fax after a specified interval.
     * @type {Integer (Int32)}
     */
    static fjsRETRYING => 64

    /**
     * The fax server exceeded the maximum number of retransmission attempts allowed. The fax will not be sent.
     * @type {Integer (Int32)}
     */
    static fjsRETRIES_EXCEEDED => 128

    /**
     * The fax job is completed.
     * @type {Integer (Int32)}
     */
    static fjsCOMPLETED => 256

    /**
     * The fax job was canceled.
     * @type {Integer (Int32)}
     */
    static fjsCANCELED => 512

    /**
     * The fax job is being canceled.
     * @type {Integer (Int32)}
     */
    static fjsCANCELING => 1024

    /**
     * The fax job is being routed.
     * @type {Integer (Int32)}
     */
    static fjsROUTING => 2048
}
