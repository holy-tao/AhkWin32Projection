#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a storage device using a particular code set and type.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_storage_device_id_descriptor">VDS_STORAGE_DEVICE_ID_DESCRIPTOR</a> 
 *     structure includes this structure as a member to specify a particular storage device identifier for a LUN.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vdslun/ns-vdslun-vds_storage_identifier
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_STORAGE_IDENTIFIER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The encoding type of <b>m_rgbIdentifier</b> enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_identifier_code_set">VDS_STORAGE_IDENTIFIER_CODE_SET</a>.
     * @type {Integer}
     */
    m_CodeSet {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The type of <b>m_rgbIdentifier</b> enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_identifier_type">VDS_STORAGE_IDENTIFIER_TYPE</a>.
     * @type {Integer}
     */
    m_Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The size of the <b>m_rgbIdentifier</b> array, in bytes.
     * @type {Integer}
     */
    m_cbIdentifier {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to the identifier data.
     * @type {Pointer<Integer>}
     */
    m_rgbIdentifier {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
