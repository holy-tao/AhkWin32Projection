#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VSS_DIFF_VOLUME_PROP.ahk" { VSS_DIFF_VOLUME_PROP }
#Import ".\VSS_MGMT_OBJECT_UNION.ahk" { VSS_MGMT_OBJECT_UNION }
#Import ".\VSS_DIFF_AREA_PROP.ahk" { VSS_DIFF_AREA_PROP }
#Import ".\VSS_MGMT_OBJECT_TYPE.ahk" { VSS_MGMT_OBJECT_TYPE }
#Import ".\VSS_VOLUME_PROP.ahk" { VSS_VOLUME_PROP }

/**
 * Defines the properties of a volume, shadow copy storage volume, or a shadow copy storage area.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/ns-vsmgmt-vss_mgmt_object_prop
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_MGMT_OBJECT_PROP {
    #StructPack 8

    /**
     * Object type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ne-vsmgmt-vss_mgmt_object_type">VSS_MGMT_OBJECT_TYPE</a>.
     */
    Type : VSS_MGMT_OBJECT_TYPE

    /**
     * Management object properties: a union of <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_volume_prop">VSS_VOLUME_PROP</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_diff_volume_prop">VSS_DIFF_VOLUME_PROP</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_diff_area_prop">VSS_DIFF_AREA_PROP</a> structures. (For more information, see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-scmp/63b53947-2649-4eac-a883-498f77361396">VSS_MGMT_OBJECT_UNION</a>.)
     * 
     * It contains information for an object of the type specified by the <b>Type</b> member. Management objects can be volumes, shadow copy storage volumes, or shadow copy storage areas.
     */
    Obj : VSS_MGMT_OBJECT_UNION

}
