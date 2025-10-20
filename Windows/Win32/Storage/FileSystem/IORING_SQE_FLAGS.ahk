#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_sqe_flags
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_SQE_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static IOSQE_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static IOSQE_FLAGS_DRAIN_PRECEDING_OPS => 1
}
