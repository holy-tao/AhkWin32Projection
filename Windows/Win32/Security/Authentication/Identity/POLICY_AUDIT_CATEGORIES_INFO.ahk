#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POLICY_AUDIT_SUBCATEGORIES_INFO.ahk" { POLICY_AUDIT_SUBCATEGORIES_INFO }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_AUDIT_CATEGORIES_INFO {
    #StructPack 8

    MaximumCategoryCount : UInt32

    SubCategoriesInfo : POLICY_AUDIT_SUBCATEGORIES_INFO.Ptr

}
