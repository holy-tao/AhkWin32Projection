#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirect_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _KF_REDIRECT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_USER_EXCLUSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_COPY_SOURCE_DACL => 2

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_OWNER_USER => 4

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_SET_OWNER_EXPLICIT => 8

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_CHECK_ONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_WITH_UI => 32

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_UNPIN => 64

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_PIN => 128

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_COPY_CONTENTS => 512

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_DEL_SOURCE_CONTENTS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECT_EXCLUDE_ALL_KNOWN_SUBFOLDERS => 2048
}
