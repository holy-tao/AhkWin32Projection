#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the partition parameters of a partition style. (CHANGE_ATTRIBUTES_PARAMETERS)
 * @remarks
 * The 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-changeattributes">IVdsAdvancedDisk::ChangeAttributes</a> 
  *     method takes this structure as a parameter.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-change_attributes_parameters
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class CHANGE_ATTRIBUTES_PARAMETERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Determines the partition parameters. Supported values are <b>VDS_PST_MBR</b> or 
     *       <b>VDS_PST_GPT</b>.
     * @type {Integer}
     */
    style {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MbrPartInfo {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    GptPartInfo {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
