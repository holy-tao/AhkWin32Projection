#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_STORAGE_IDENTIFIER_TYPE.ahk" { VDS_STORAGE_IDENTIFIER_TYPE }
#Import ".\VDS_STORAGE_IDENTIFIER_CODE_SET.ahk" { VDS_STORAGE_IDENTIFIER_CODE_SET }

/**
 * Defines a storage device using a particular code set and type.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_device_id_descriptor">VDS_STORAGE_DEVICE_ID_DESCRIPTOR</a> 
 *     structure includes this structure as a member to specify a particular storage device identifier for a LUN.
 * @see https://learn.microsoft.com/windows/win32/api/vdslun/ns-vdslun-vds_storage_identifier
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_STORAGE_IDENTIFIER {
    #StructPack 8

    /**
     * The encoding type of <b>m_rgbIdentifier</b> enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_identifier_code_set">VDS_STORAGE_IDENTIFIER_CODE_SET</a>.
     */
    m_CodeSet : VDS_STORAGE_IDENTIFIER_CODE_SET

    /**
     * The type of <b>m_rgbIdentifier</b> enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_identifier_type">VDS_STORAGE_IDENTIFIER_TYPE</a>.
     */
    m_Type : VDS_STORAGE_IDENTIFIER_TYPE

    /**
     * The size of the <b>m_rgbIdentifier</b> array, in bytes.
     */
    m_cbIdentifier : UInt32

    /**
     * Pointer to the identifier data.
     */
    m_rgbIdentifier : IntPtr

}
