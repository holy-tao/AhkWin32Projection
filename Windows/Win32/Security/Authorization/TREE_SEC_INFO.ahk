#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The security information is reset on the object specified by the <i>pObjectName</i> parameter and the tree of child objects of that object. Any existing security information is removed from all objects on the tree.
  * 
  * If any object in the tree does not grant appropriate permissions to the caller to modify the security descriptor on the object, then the propagation of security information on that particular node of the tree and its objects is skipped. The operation continues on the rest of the tree under the object specified by the <i>pObjectName</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/aclapi/nf-aclapi-treesetnamedsecurityinfoa
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class TREE_SEC_INFO extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_SEC_INFO_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_SEC_INFO_RESET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_SEC_INFO_RESET_KEEP_EXPLICIT => 3
}
