#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\CPU_INFORMATION.ahk

/**
 * Contains processor and operating system information.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_SYSTEM_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    ProcessorArchitecture {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The system's architecture-dependent processor level.
     * 
     * If <b>ProcessorArchitecture</b> is 
     *        <b>PROCESSOR_ARCHITECTURE_INTEL</b>,
     * @type {Integer}
     */
    ProcessorLevel {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The architecture-dependent processor revision.
     * 
     * <table>
     * <tr>
     * <th>Processor</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>Intel 80386 or 80486</td>
     * <td>
     * A value of the form <i>xxyz</i>.
     * 
     * If <i>xx</i> is equal to 0xFF, <i>y</i> - 0xA is the model number, 
     *           and <i>z</i> is the stepping identifier. For example, an Intel 80486-D0 system returns 
     *           0xFFD0.
     * 
     * If <i>xx</i> is not equal to 0xFF, <i>xx</i> + 'A' is the stepping 
     *           letter and <i>yz</i> is the minor stepping.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Intel Pentium, Cyrix, or NextGen 586</td>
     * <td>
     * A value of the form <i>xxyy</i>, where <i>xx</i> is the model 
     *           number and <i>yy</i> is the stepping. Display this value of 0x0201 as follows:
     * 
     * Model <i>xx</i>, Stepping <i>yy</i>
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ProcessorRevision {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    NumberOfProcessors {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    ProductType {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * The major version number of the operating system. This member can be 4, 5, or 6.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The minor version number of the operating system.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The build number of the operating system.
     * @type {Integer}
     */
    BuildNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    PlatformId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * An RVA (from the beginning of the dump) to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_string">MINIDUMP_STRING</a> that describes the latest Service 
     *        Pack installed on the system. If no Service Pack has been installed, the string is empty.
     * @type {Integer}
     */
    CSDVersionRva {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    SuiteMask {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * 
     * @type {CPU_INFORMATION}
     */
    Cpu{
        get {
            if(!this.HasProp("__Cpu"))
                this.__Cpu := CPU_INFORMATION(this.ptr + 32)
            return this.__Cpu
        }
    }
}
