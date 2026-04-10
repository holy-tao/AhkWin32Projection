#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 */
class AUTHZ_ACCESS_CHECK_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_ACCESS_CHECK_NO_DEEP_COPY_SD => 1
}
