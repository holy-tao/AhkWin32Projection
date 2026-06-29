#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TF_PRESERVEDKEY structure represents a preserved key.
 * @remarks
 * Preserved keys are registered by TSF text services and provide keyboard shortcuts to common commands implemented by the TSF text service.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_preservedkey
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_PRESERVEDKEY {
    #StructPack 4

    /**
     * Virtual key code of the keyboard shortcut.
     */
    uVKey : UInt32

    /**
     * Modifies the preserved key. This can be zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-mod--constants">TF_MOD_* constants</a>.
     */
    uModifiers : UInt32

}
