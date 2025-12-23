#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify ID values corresponding to BITS properties.
 * @see https://learn.microsoft.com/windows/win32/api/bits5_0/ne-bits5_0-bits_job_transfer_policy
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BITS_JOB_TRANSFER_POLICY extends Win32Enum{

    /**
     * Specifies that the job will be transferred when connectivity is available, regardless of the cost.
     * @type {Integer (Int32)}
     */
    static BITS_JOB_TRANSFER_POLICY_ALWAYS => -2147483393

    /**
     * Specifies that the job will be transferred when connectivity is available, unless that connectivity is subject to roaming surcharges.
     * @type {Integer (Int32)}
     */
    static BITS_JOB_TRANSFER_POLICY_NOT_ROAMING => -2147483521

    /**
     * Specifies that the job will be transferred only when connectivity is available which is not subject to a surcharge.
     * @type {Integer (Int32)}
     */
    static BITS_JOB_TRANSFER_POLICY_NO_SURCHARGE => -2147483537

    /**
     * Specifies that the job will be transferred only when connectivity is available which is neither subject to a surcharge nor near exhaustion.
     * @type {Integer (Int32)}
     */
    static BITS_JOB_TRANSFER_POLICY_STANDARD => -2147483545

    /**
     * Specifies that the job will be transferred only when connectivity is available which does not impose costs or traffic limits.
     * @type {Integer (Int32)}
     */
    static BITS_JOB_TRANSFER_POLICY_UNRESTRICTED => -2147483615
}
