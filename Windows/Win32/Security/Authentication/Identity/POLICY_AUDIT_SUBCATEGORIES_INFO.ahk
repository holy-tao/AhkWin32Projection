#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_AUDIT_SUBCATEGORIES_INFO {
    #StructPack 8

    MaximumSubCategoryCount : UInt32

    EventAuditingOptions : IntPtr

}
