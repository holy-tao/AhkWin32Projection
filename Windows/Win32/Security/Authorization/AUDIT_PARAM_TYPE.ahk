#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of audit parameters that are available.
 * @see https://learn.microsoft.com/windows/win32/api/adtgen/ne-adtgen-audit_param_type
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUDIT_PARAM_TYPE{

    /**
     * No audit options.
     * @type {Integer (Int32)}
     */
    static APT_None => 1

    /**
     * A string that terminates with <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static APT_String => 2

    /**
     * An unsigned long.
     * @type {Integer (Int32)}
     */
    static APT_Ulong => 3

    /**
     * A pointer that is used to specify handles and pointers. These are 32-bit on 32-bit systems and 64-bit on 64-bit systems. Use this option when you are interested in the absolute value of the pointer. The memory to which the pointer points is not marshaled when using this type.
     * @type {Integer (Int32)}
     */
    static APT_Pointer => 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @type {Integer (Int32)}
     */
    static APT_Sid => 5

    /**
     * The logon identifier (LUID) that results in three output parameters:
 * 
 * <ul>
 * <li>Account name</li>
 * <li>Authority name</li>
 * <li>LogonID""</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static APT_LogonId => 6

    /**
     * Object type list.
     * @type {Integer (Int32)}
     */
    static APT_ObjectTypeList => 7

    /**
     * LUID that is not translated to LogonId.
     * @type {Integer (Int32)}
     */
    static APT_Luid => 8

    /**
     * GUID.
     * @type {Integer (Int32)}
     */
    static APT_Guid => 9

    /**
     * Time as FILETIME.
     * @type {Integer (Int32)}
     */
    static APT_Time => 10

    /**
     * ULONGLONG.
     * @type {Integer (Int32)}
     */
    static APT_Int64 => 11

    /**
     * IP Address (IPv4 and IPv6). This logs the address as the first parameter and the port as the second parameter. You must ensure that two entries are added in the event message file. You should ensure that the buffer size is 128 bytes.
     * @type {Integer (Int32)}
     */
    static APT_IpAddress => 12

    /**
     * Logon ID with SID that results in four output parameters:
 * 
 * <ul>
 * <li>SID</li>
 * <li>Account name</li>
 * <li>Authority name</li>
 * <li>LogonID</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static APT_LogonIdWithSid => 13
}
