#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VSS_VOLUME_PROP.ahk
#Include .\VSS_DIFF_VOLUME_PROP.ahk
#Include .\VSS_DIFF_AREA_PROP.ahk
#Include .\VSS_MGMT_OBJECT_UNION.ahk

/**
 * Defines the properties of a volume, shadow copy storage volume, or a shadow copy storage area.
 * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/ns-vsmgmt-vss_mgmt_object_prop
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_MGMT_OBJECT_PROP extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Object type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ne-vsmgmt-vss_mgmt_object_type">VSS_MGMT_OBJECT_TYPE</a>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Management object properties: a union of <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_volume_prop">VSS_VOLUME_PROP</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_diff_volume_prop">VSS_DIFF_VOLUME_PROP</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_diff_area_prop">VSS_DIFF_AREA_PROP</a> structures. (For more information, see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-scmp/63b53947-2649-4eac-a883-498f77361396">VSS_MGMT_OBJECT_UNION</a>.)
     * 
     * It contains information for an object of the type specified by the <b>Type</b> member. Management objects can be volumes, shadow copy storage volumes, or shadow copy storage areas.
     * @type {VSS_MGMT_OBJECT_UNION}
     */
    Obj{
        get {
            if(!this.HasProp("__Obj"))
                this.__Obj := VSS_MGMT_OBJECT_UNION(this.ptr + 8)
            return this.__Obj
        }
    }
}
