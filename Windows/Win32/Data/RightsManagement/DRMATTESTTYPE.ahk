#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DRMATTESTTYPE enumeration specifies what kind of signature to create for a data blob.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmattesttype
 * @namespace Windows.Win32.Data.RightsManagement
 */
class DRMATTESTTYPE extends Win32Enum {

    /**
     * Create a signature using full environment information.
     * Native name: DRMATTESTTYPE_FULLENVIRONMENT
     * @type {Integer (Int32)}
     */
    static FULLENVIRONMENT => 0

    /**
     * Create a signature using only a hash of the environment.
     * Native name: DRMATTESTTYPE_HASHONLY
     * @type {Integer (Int32)}
     */
    static HASHONLY => 1
}
