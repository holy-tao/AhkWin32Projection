#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class SECURITY_OPERATION_CODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SetSecurityDescriptor => 0

    /**
     * @type {Integer (Int32)}
     */
    static QuerySecurityDescriptor => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeleteSecurityDescriptor => 2

    /**
     * @type {Integer (Int32)}
     */
    static AssignSecurityDescriptor => 3
}
