#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DRMATTESTTYPE enumeration specifies what kind of signature to create for a data blob.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmattesttype
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRMATTESTTYPE{

    /**
     * Create a signature using full environment information.
     * @type {Integer (Int32)}
     */
    static DRMATTESTTYPE_FULLENVIRONMENT => 0

    /**
     * Create a signature using only a hash of the environment.
     * @type {Integer (Int32)}
     */
    static DRMATTESTTYPE_HASHONLY => 1
}
