#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the properties of the service object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getproperties">IVdsService::GetProperties</a> method returns this structure to report the properties of the <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">service object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_service_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_SERVICE_PROP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The version of VDS; a zero-terminated, human-readable string.
     * @type {Pointer<Ptr>}
     */
    pwszVersion {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_service_flag">VDS_SERVICE_FLAG</a> enumeration values that describe the service.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
