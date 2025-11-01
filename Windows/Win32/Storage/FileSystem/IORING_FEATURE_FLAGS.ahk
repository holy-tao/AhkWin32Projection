#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_feature_flags
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_FEATURE_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static IORING_FEATURE_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static IORING_FEATURE_UM_EMULATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static IORING_FEATURE_SET_COMPLETION_EVENT => 2
}
