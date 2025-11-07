#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of modification to be made to security attributes by a call to the AuthzModifySecurityAttributes function.
 * @see https://docs.microsoft.com/windows/win32/api//authz/ne-authz-authz_security_attribute_operation
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_SECURITY_ATTRIBUTE_OPERATION{

    /**
     * Do not perform any modification.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_OPERATION_NONE => 0

    /**
     * Delete all existing security attributes and their values in the token and replace them with the specified attributes and values.
     * 
     * If no new attributes are specified, all existing attributes and values are deleted.
     * 
     * This operation must be the only operation specified and can be specified only once in a single call to <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzmodifysecurityattributes">AuthzModifySecurityAttributes</a>. If the operation is not specified as the first in the list of operations, the call to <b>AuthzModifySecurityAttributes</b> fails. If the operation is specified as the first in the array of operations performed, the rest of the operations are ignored.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE_ALL => 1

    /**
     * Add a new attribute or a new value to an existing attribute.
     * 
     * If the value specified for any attribute already exists for that attribute, the call to <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzmodifysecurityattributes">AuthzModifySecurityAttributes</a> fails.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_OPERATION_ADD => 2

    /**
     * Delete the specified values of the specified attributes. If an attribute is specified without a value, that attribute is deleted.
     * 
     * If this operation results in an attribute that does not contain any values, that attribute is deleted.
     * 
     * If a value is specified that does not match an existing attribute, no modifications are performed and the call to <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzmodifysecurityattributes">AuthzModifySecurityAttributes</a> fails.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_OPERATION_DELETE => 3

    /**
     * The existing values of the specified security attributes are replaced by the specified new values.
     * 
     * If any of the specified attributes does not already exist, they are added.
     * 
     * When no value is specified for an attribute, that attribute is deleted. Otherwise, the operation is simply ignored and no failure is reported.
     * @type {Integer (Int32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE => 4
}
