#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines the properties of the service object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getproperties">IVdsService::GetProperties</a> method returns this structure to report the properties of the <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">service object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_service_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_SERVICE_PROP {
    #StructPack 8

    /**
     * The version of VDS; a zero-terminated, human-readable string.
     */
    pwszVersion : PWSTR

    /**
     * A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_service_flag">VDS_SERVICE_FLAG</a> enumeration values that describe the service.
     */
    ulFlags : UInt32

}
