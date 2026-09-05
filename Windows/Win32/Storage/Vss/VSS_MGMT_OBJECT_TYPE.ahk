#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Discriminant for the VSS_MGMT_OBJECT_UNION union within the VSS_MGMT_OBJECT_PROP structure.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/ne-vsmgmt-vss_mgmt_object_type
 * @namespace Windows.Win32.Storage.Vss
 */
class VSS_MGMT_OBJECT_TYPE extends Win32Enum {

    /**
     * The object type is unknown.
     * Native name: VSS_MGMT_OBJECT_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The object is a volume to be shadow copied.
     * Native name: VSS_MGMT_OBJECT_VOLUME
     * @type {Integer (Int32)}
     */
    static VOLUME => 1

    /**
     * The object is a volume to hold a shadow copy storage area.
     * Native name: VSS_MGMT_OBJECT_DIFF_VOLUME
     * @type {Integer (Int32)}
     */
    static DIFF_VOLUME => 2

    /**
     * The object is an association between a volume to be shadow copied and a volume to hold the shadow copy storage area.
     * Native name: VSS_MGMT_OBJECT_DIFF_AREA
     * @type {Integer (Int32)}
     */
    static DIFF_AREA => 3
}
