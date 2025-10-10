#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents the data directory.
 * @remarks
 * 
  * The following is a list of the data directories. Offsets are relative to the beginning of the optional header.
  * 
  * <table>
  * <tr>
  * <th>Offset (PE/PE32+)</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td>96/112</td>
  * <td>Export table address and size</td>
  * </tr>
  * <tr>
  * <td>104/120</td>
  * <td>Import table address and size</td>
  * </tr>
  * <tr>
  * <td>112/128</td>
  * <td>Resource table address and size</td>
  * </tr>
  * <tr>
  * <td>120/136</td>
  * <td>Exception table address and size</td>
  * </tr>
  * <tr>
  * <td>128/144</td>
  * <td>Certificate table address and size</td>
  * </tr>
  * <tr>
  * <td>136/152</td>
  * <td>Base relocation table address and size</td>
  * </tr>
  * <tr>
  * <td>144/160</td>
  * <td>Debugging information starting address and size</td>
  * </tr>
  * <tr>
  * <td>152/168</td>
  * <td>Architecture-specific data address and size</td>
  * </tr>
  * <tr>
  * <td>160/176</td>
  * <td>Global pointer register relative virtual address</td>
  * </tr>
  * <tr>
  * <td>168/184</td>
  * <td>Thread local storage (TLS) table address and size</td>
  * </tr>
  * <tr>
  * <td>176/192</td>
  * <td>Load configuration table address and size</td>
  * </tr>
  * <tr>
  * <td>184/200</td>
  * <td>Bound import table address and size</td>
  * </tr>
  * <tr>
  * <td>192/208</td>
  * <td>Import address table address and size</td>
  * </tr>
  * <tr>
  * <td>200/216</td>
  * <td>Delay import descriptor address and size</td>
  * </tr>
  * <tr>
  * <td>208/224</td>
  * <td>The CLR header address and size</td>
  * </tr>
  * <tr>
  * <td>216/232</td>
  * <td>Reserved</td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-image_data_directory
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_DATA_DIRECTORY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The relative virtual address of the table.
     * @type {Integer}
     */
    VirtualAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the table, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
