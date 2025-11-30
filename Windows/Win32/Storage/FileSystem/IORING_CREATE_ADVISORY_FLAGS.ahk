#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_create_advisory_flags
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_CREATE_ADVISORY_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static IORING_CREATE_ADVISORY_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static IORING_CREATE_SKIP_BUILDER_PARAM_CHECKS => 1
}
