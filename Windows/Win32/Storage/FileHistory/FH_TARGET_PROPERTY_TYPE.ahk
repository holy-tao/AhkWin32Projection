#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a property of a backup target.
 * @remarks
 * 
  * To query a backup target property, call the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhtarget-getstringproperty">IFhTarget::GetStringProperty</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhtarget-getnumericalproperty">IFhTarget::GetNumericalProperty</a> method.
  * 
  * For local disks, the <b>FH_TARGET_URL</b> property contains the drive letter. This path must end with a trailing backslash (for example, "X:\").
  * 
  * For network shares, the <b>FH_TARGET_URL</b> property contains the full path of the share.  This path must end with a trailing backslash (for example, "\\myserver\myshare\").
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/ne-fhcfg-fh_target_property_type
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FH_TARGET_PROPERTY_TYPE{

    /**
     * The property is a string that contains the backup target’s friendly name.  The friendly name is set during target provisioning by calling the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-provisionandsetnewtarget">IFhConfigMgr::ProvisionAndSetNewTarget</a> method.
     * @type {Integer (Int32)}
     */
    static FH_TARGET_NAME => 0

    /**
     * The property is a string that contains a path to the backup target.
     * @type {Integer (Int32)}
     */
    static FH_TARGET_URL => 1

    /**
     * The property is a numeric property that specifies the target type of the backup target. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_drive_types">FH_TARGET_DRIVE_TYPES</a> enumeration for the list of possible backup target types.
     * @type {Integer (Int32)}
     */
    static FH_TARGET_DRIVE_TYPE => 2

    /**
     * The maximum enumeration value for this enumeration. This value and all values greater than it are reserved for system use.
     * @type {Integer (Int32)}
     */
    static MAX_TARGET_PROPERTY => 3
}
