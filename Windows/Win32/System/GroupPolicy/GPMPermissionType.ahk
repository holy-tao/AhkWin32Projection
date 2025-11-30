#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The categories, permissions included in the categories, and the object to which they can be applied.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/ne-gpmgmt-gpmpermissiontype
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMPermissionType extends Win32Enum{

    /**
     * The trustee can apply the GPO; corresponds to the READ and APPLY Group Policy access rights being set to "Allow" for a user.
     * @type {Integer (Int32)}
     */
    static permGPOApply => 65536

    /**
     * The trustee can read the GPO; corresponds to the READ Group Policy access right set to "Allow" for a user.
     * @type {Integer (Int32)}
     */
    static permGPORead => 65792

    /**
     * The trustee can read and edit the policy settings for the GPO; corresponds to the READ, WRITE, CREATE CHILD OBJECT, and DELETE CHILD OBJECT Group Policy access rights set to "Allow" for a user.
     * @type {Integer (Int32)}
     */
    static permGPOEdit => 65793

    /**
     * The trustee can read, edit and delete the permissions for the GPO; corresponds to the Group Policy access rights specified by <b>permGPOEdit</b> plus the DELETE, MODIFY PERMISSIONS, and MODIFY OWNER access rights set to "Allow" for a user.
     * @type {Integer (Int32)}
     */
    static permGPOEditSecurityAndDelete => 65794

    /**
     * The trustee has custom permissions for the GPO.
     * @type {Integer (Int32)}
     */
    static permGPOCustom => 65795

    /**
     * The trustee can edit the WMI filter.
     * @type {Integer (Int32)}
     */
    static permWMIFilterEdit => 131072

    /**
     * The trustee has full control over the WMI filter.
     * @type {Integer (Int32)}
     */
    static permWMIFilterFullControl => 131073

    /**
     * The trustee has custom  permissions  for the WMI filter.
     * @type {Integer (Int32)}
     */
    static permWMIFilterCustom => 131074

    /**
     * he trustee can link GPOs to the SOM. Applies to sites, domains and OUs.
     * @type {Integer (Int32)}
     */
    static permSOMLink => 1835008

    /**
     * The trustee can generate RSoP logging data for the SOM. Applies to domains and OUs.
     * @type {Integer (Int32)}
     */
    static permSOMLogging => 1573120

    /**
     * The trustee can generate RSoP planning data for the SOM. Applies to domains and OUs.
     * @type {Integer (Int32)}
     */
    static permSOMPlanning => 1573376

    /**
     * The trustee can create WMI filters in the domain. Applies to domains only.
     * @type {Integer (Int32)}
     */
    static permSOMWMICreate => 1049344

    /**
     * The trustee has full control over all WMI filters in the domain. Applies to domains only.
     * @type {Integer (Int32)}
     */
    static permSOMWMIFullControl => 1049345

    /**
     * The trustee can create GPOs in the domain. Applies to domains only.
     * @type {Integer (Int32)}
     */
    static permSOMGPOCreate => 1049600

    /**
     * The trustee can read the Starter GPO; corresponds to the READ Group Policy access right set to "Allow" for a user.
     * @type {Integer (Int32)}
     */
    static permStarterGPORead => 197888

    /**
     * The trustee can read and edit the administrative template policy settings for the Starter GPO; corresponds to the READ, WRITE, CREATE CHILD OBJECT, and DELETE CHILD OBJECT Group Policy access rights set to "Allow" for a user.
     * @type {Integer (Int32)}
     */
    static permStarterGPOEdit => 197889

    /**
     * The trustee has full control for the Starter GPO. Applies to domains only.
     * @type {Integer (Int32)}
     */
    static permStarterGPOFullControl => 197890

    /**
     * The trustee has custom permissions for the Starter GPO.
     * @type {Integer (Int32)}
     */
    static permStarterGPOCustom => 197891

    /**
     * The trustee can create Starter GPOs in the domain. Applies to domains only.
     * @type {Integer (Int32)}
     */
    static permSOMStarterGPOCreate => 1049856
}
