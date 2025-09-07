#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the current computer system. This includes the architecture and type of the processor, the number of processors in the system, the page size, and other such information.
 * @see https://learn.microsoft.com/windows/win32/api/sysinfoapi/ns-sysinfoapi-system_info
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class SYSTEM_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwOemId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wProcessorArchitecture {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The page size and the granularity of page protection and commitment. This is the page size used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a> function.
     * @type {Integer}
     */
    dwPageSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the lowest memory address accessible to applications and dynamic-link libraries (DLLs).
     * @type {Pointer<Void>}
     */
    lpMinimumApplicationAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the highest memory address accessible to applications and DLLs.
     * @type {Pointer<Void>}
     */
    lpMaximumApplicationAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A mask representing the set of processors configured into the system. Bit 0 is processor 0; bit 31 is processor 31.
     * @type {Pointer}
     */
    dwActiveProcessorMask {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The number of logical processors in the current group. To retrieve the current processor group, use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getlogicalprocessorinformation">GetLogicalProcessorInformation</a> function.
     * 
     * <div class="alert"><b>Note</b>  For information about the  physical processors shared by logical processors, call <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getlogicalprocessorinformationex">GetLogicalProcessorInformationEx</a> with the <i>RelationshipType</i> parameter set to RelationProcessorPackage (3).</div>
     * <div> </div>
     * @type {Integer}
     */
    dwNumberOfProcessors {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An obsolete member that is retained for compatibility. Use the <b>wProcessorArchitecture</b>, <b>wProcessorLevel</b>, and <b>wProcessorRevision</b> members to determine the type of processor.
     * @type {Integer}
     */
    dwProcessorType {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The granularity for the starting address at which virtual memory can be allocated. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-virtualalloc">VirtualAlloc</a>.
     * @type {Integer}
     */
    dwAllocationGranularity {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The architecture-dependent processor level. It should be used only for display purposes. To determine the feature set of a processor, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-isprocessorfeaturepresent">IsProcessorFeaturePresent</a> function.
     * 
     * If <b>wProcessorArchitecture</b> is PROCESSOR_ARCHITECTURE_INTEL, <b>wProcessorLevel</b> is defined by the CPU vendor.
     * 
     * If <b>wProcessorArchitecture</b> is PROCESSOR_ARCHITECTURE_IA64, <b>wProcessorLevel</b> is set to 1.
     * @type {Integer}
     */
    wProcessorLevel {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * The architecture-dependent processor revision. The following table shows how the revision value is assembled for each type of processor architecture. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Processor</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>Intel Pentium, Cyrix, or NextGen 586</td>
     * <td>The high byte is the model and the low byte is the stepping. For example, if the value is <i>xxyy</i>, the model number and stepping can be displayed as follows: 
     * 
     * 
     * Model <i>xx</i>, Stepping <i>yy</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Intel 80386 or 80486</td>
     * <td>A value of the form <i>xxyz</i>. 
     * 
     * 
     * If <i>xx</i> is equal to 0xFF, <i>y</i> - 0xA is the model number, and <i>z</i> is the stepping identifier.
     * 
     * If <i>xx</i> is not equal to 0xFF, <i>xx</i> + 'A' is the stepping letter and <i>yz</i> is the minor stepping.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>ARM</td>
     * <td>Reserved.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wProcessorRevision {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }
}
