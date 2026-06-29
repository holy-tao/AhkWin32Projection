#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the type of information being assigned to or retrieved from an access control list (ACL).
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-acl_information_class
 * @namespace Windows.Win32.Security
 */
export default struct ACL_INFORMATION_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
