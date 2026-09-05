#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The AppPolicyMediaFoundationCodecLoading enumeration indicates whether a process’s policy allows it to load non-Windows (third-party) plugins.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicymediafoundationcodecloading
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class AppPolicyMediaFoundationCodecLoading extends Win32Enum {

    /**
     * Indicates that the process’s policy allows it to load non-Windows (third-party) plugins.
     * Native name: AppPolicyMediaFoundationCodecLoading_All
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * Indicates that the process’s policy does not allow it to load non-Windows (third-party) plugins.
     * Native name: AppPolicyMediaFoundationCodecLoading_InboxOnly
     * @type {Integer (Int32)}
     */
    static InboxOnly => 1
}
