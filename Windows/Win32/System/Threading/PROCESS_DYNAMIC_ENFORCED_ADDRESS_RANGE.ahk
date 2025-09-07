#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains dynamic enforced address ranges used by various features related to user-mode Hardware-enforced Stack Protection (HSP).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_dynamic_enforced_address_range
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The base address of a dynamic enforced address range.
     * @type {Pointer}
     */
    BaseAddress {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size in bytes of a dynamic enforced address range.
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Flags that apply to the dynamic enforced address range described by <i>BaseAddress</i> and <i>Size</i>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DYNAMIC_ENFORCED_ADDRESS_RANGE_ADD"></a><a id="dynamic_enforced_address_range_add"></a><dl>
     * <dt><b>DYNAMIC_ENFORCED_ADDRESS_RANGE_ADD</b></dt>
     * <dt>0x00000001UL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dynamic enforced address range should be added. If this flag is not set, the range is removed. This is an input flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DYNAMIC_ENFORCED_ADDRESS_RANGE_PROCESSED"></a><a id="dynamic_enforced_address_range_processed"></a><dl>
     * <dt><b>DYNAMIC_ENFORCED_ADDRESS_RANGE_PROCESSED</b></dt>
     * <dt>0x00000002UL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dynamic enforced address range has been successfully processed (either added or removed).
     * This is an output flag used to report which ranges were successfully processed when processing an array of multiple ranges.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
