#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify ID values corresponding to BITS properties.
 * @see https://learn.microsoft.com/windows/win32/api/bits5_0/ne-bits5_0-bits_job_transfer_policy
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
class BITS_JOB_TRANSFER_POLICY extends Win32Enum {

    /**
     * Specifies that the job will be transferred when connectivity is available, regardless of the cost.
     * Native name: BITS_JOB_TRANSFER_POLICY_ALWAYS
     * @type {Integer (Int32)}
     */
    static ALWAYS => -2147483393

    /**
     * Specifies that the job will be transferred when connectivity is available, unless that connectivity is subject to roaming surcharges.
     * Native name: BITS_JOB_TRANSFER_POLICY_NOT_ROAMING
     * @type {Integer (Int32)}
     */
    static NOT_ROAMING => -2147483521

    /**
     * Specifies that the job will be transferred only when connectivity is available which is not subject to a surcharge.
     * Native name: BITS_JOB_TRANSFER_POLICY_NO_SURCHARGE
     * @type {Integer (Int32)}
     */
    static NO_SURCHARGE => -2147483537

    /**
     * Specifies that the job will be transferred only when connectivity is available which is neither subject to a surcharge nor near exhaustion.
     * Native name: BITS_JOB_TRANSFER_POLICY_STANDARD
     * @type {Integer (Int32)}
     */
    static STANDARD => -2147483545

    /**
     * Specifies that the job will be transferred only when connectivity is available which does not impose costs or traffic limits.
     * Native name: BITS_JOB_TRANSFER_POLICY_UNRESTRICTED
     * @type {Integer (Int32)}
     */
    static UNRESTRICTED => -2147483615
}
