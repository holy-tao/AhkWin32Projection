#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the type of information being assigned to or retrieved from an access control list (ACL).
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-acl_information_class
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ACL_INFORMATION_CLASS{

    /**
     * Indicates ACL revision information.
     * @type {Integer (Int32)}
     */
    static AclRevisionInformation => 1

    /**
     * Indicates ACL size information.
     * @type {Integer (Int32)}
     */
    static AclSizeInformation => 2
}
