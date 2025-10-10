#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the calling convention used by a member function described in the METHODDATA structure.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ne-oaidl-callconv
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CALLCONV{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_FASTCALL => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_CDECL => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_MSCPASCAL => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_PASCAL => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_MACPASCAL => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_STDCALL => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_FPFASTCALL => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_SYSCALL => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_MPWCDECL => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_MPWPASCAL => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CC_MAX => 9
}
