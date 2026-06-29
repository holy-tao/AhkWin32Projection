#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\VDS_PACK_STATUS.ahk" { VDS_PACK_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the properties of a pack object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-getproperties">IVdsPack::GetProperties</a> method returns this structure to report the property details of a pack object.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_pack_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PACK_PROP {
    #StructPack 8

    /**
     * The GUID of the pack object.
     */
    id : Guid

    /**
     * A string representing the pack name. Packs managed by the basic provider have no name.
     */
    pwszName : PWSTR

    /**
     * The pack status enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_pack_status">VDS_PACK_STATUS</a>.
     */
    status : VDS_PACK_STATUS

    /**
     * The pack flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_pack_flag">VDS_PACK_FLAG</a>.
     */
    ulFlags : UInt32

}
