#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Discriminant for the VSS_MGMT_OBJECT_UNION union within the VSS_MGMT_OBJECT_PROP structure.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/ne-vsmgmt-vss_mgmt_object_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_MGMT_OBJECT_TYPE extends Win32Enum{

    /**
     * The object type is unknown.
     * @type {Integer (Int32)}
     */
    static VSS_MGMT_OBJECT_UNKNOWN => 0

    /**
     * The object is a volume to be shadow copied.
     * @type {Integer (Int32)}
     */
    static VSS_MGMT_OBJECT_VOLUME => 1

    /**
     * The object is a volume to hold a shadow copy storage area.
     * @type {Integer (Int32)}
     */
    static VSS_MGMT_OBJECT_DIFF_VOLUME => 2

    /**
     * The object is an association between a volume to be shadow copied and a volume to hold the shadow copy storage area.
     * @type {Integer (Int32)}
     */
    static VSS_MGMT_OBJECT_DIFF_AREA => 3
}
