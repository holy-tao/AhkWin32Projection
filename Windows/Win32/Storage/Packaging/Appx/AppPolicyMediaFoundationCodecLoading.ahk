#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AppPolicyMediaFoundationCodecLoading enumeration indicates whether a process’s policy allows it to load non-Windows (third-party) plugins.
 * @see https://docs.microsoft.com/windows/win32/api//appmodel/ne-appmodel-apppolicymediafoundationcodecloading
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class AppPolicyMediaFoundationCodecLoading{

    /**
     * Indicates that the process’s policy allows it to load non-Windows (third-party) plugins.
     * @type {Integer (Int32)}
     */
    static AppPolicyMediaFoundationCodecLoading_All => 0

    /**
     * Indicates that the process’s policy does not allow it to load non-Windows (third-party) plugins.
     * @type {Integer (Int32)}
     */
    static AppPolicyMediaFoundationCodecLoading_InboxOnly => 1
}
