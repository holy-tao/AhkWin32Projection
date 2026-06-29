#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AppPolicyMediaFoundationCodecLoading enumeration indicates whether a process’s policy allows it to load non-Windows (third-party) plugins.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicymediafoundationcodecloading
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct AppPolicyMediaFoundationCodecLoading {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
