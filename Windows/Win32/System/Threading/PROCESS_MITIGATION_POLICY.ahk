#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the different process mitigation policies.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-process_mitigation_policy
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_MITIGATION_POLICY{

    /**
     * The data execution prevention (DEP) policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessDEPPolicy => 0

    /**
     * The Address Space Layout Randomization (ASLR) policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessASLRPolicy => 1

    /**
     * The policy that turns off the ability of the process to generate dynamic code or modify existing executable code.
     * @type {Integer (Int32)}
     */
    static ProcessDynamicCodePolicy => 2

    /**
     * The process will receive a fatal error if it manipulates an invalid handle. Useful for preventing downstream problems in a process due to handle misuse.
     * @type {Integer (Int32)}
     */
    static ProcessStrictHandleCheckPolicy => 3

    /**
     * Disables the ability to use NTUser/GDI functions at the lowest layer.
     * @type {Integer (Int32)}
     */
    static ProcessSystemCallDisablePolicy => 4

    /**
     * Returns the mask of valid bits for all the mitigation options on the system.  An application can set many mitigation options without querying the operating system for mitigation options by combining bitwise with the mask to exclude all non-supported bits at once.
     * @type {Integer (Int32)}
     */
    static ProcessMitigationOptionsMask => 5

    /**
     * The policy that prevents some built-in third party extension points from being turned on, which prevents legacy extension point DLLs from being loaded into the process.
     * @type {Integer (Int32)}
     */
    static ProcessExtensionPointDisablePolicy => 6

    /**
     * The Control Flow Guard (CFG) policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessControlFlowGuardPolicy => 7

    /**
     * The policy of a process that can restrict image loading to those images that are either signed by Microsoft, by the Windows Store, or by Microsoft, the Windows Store and the Windows Hardware Quality Labs (WHQL).
     * @type {Integer (Int32)}
     */
    static ProcessSignaturePolicy => 8

    /**
     * The policy that turns off the ability of the process to load non-system fonts.
     * @type {Integer (Int32)}
     */
    static ProcessFontDisablePolicy => 9

    /**
     * The policy that turns off the ability of the process to load images from some locations, such a remote devices or files that have the low mandatory label.
     * @type {Integer (Int32)}
     */
    static ProcessImageLoadPolicy => 10

    /**
     * The system call filter policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessSystemCallFilterPolicy => 11

    /**
     * The payload restriction policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessPayloadRestrictionPolicy => 12

    /**
     * The child process policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessChildProcessPolicy => 13

    /**
     * The side channel isolation policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessSideChannelIsolationPolicy => 14

    /**
     * Windows 10, version 2004 and above: The policy regarding user-mode Hardware-enforced Stack Protection for the process.
     * @type {Integer (Int32)}
     */
    static ProcessUserShadowStackPolicy => 15

    /**
     * The RedirectionGuard policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessRedirectionTrustPolicy => 16

    /**
     * The user pointer authentication policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessUserPointerAuthPolicy => 17

    /**
     * The Structured Exception Handling Overwrite Protection (SEHOP) policy of the process.
     * @type {Integer (Int32)}
     */
    static ProcessSEHOPPolicy => 18

    /**
     * Ends the enumeration.
     * @type {Integer (Int32)}
     */
    static MaxProcessMitigationPolicy => 19
}
