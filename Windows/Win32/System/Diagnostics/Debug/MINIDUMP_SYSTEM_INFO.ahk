#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CPU_INFORMATION.ahk" { CPU_INFORMATION }
#Import ".\VER_PLATFORM.ahk" { VER_PLATFORM }
#Import "..\..\SystemInformation\PROCESSOR_ARCHITECTURE.ahk" { PROCESSOR_ARCHITECTURE }

/**
 * Contains processor and operating system information.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_SYSTEM_INFO {
    #StructPack 8

    ProcessorArchitecture : PROCESSOR_ARCHITECTURE

    /**
     * The system's architecture-dependent processor level.
     * 
     * If <b>ProcessorArchitecture</b> is 
     *        <b>PROCESSOR_ARCHITECTURE_INTEL</b>,
     */
    ProcessorLevel : UInt16

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
     */
    ProcessorRevision : UInt16

    Reserved0 : UInt16

    /**
     * The major version number of the operating system. This member can be 4, 5, or 6.
     */
    MajorVersion : UInt32

    /**
     * The minor version number of the operating system.
     */
    MinorVersion : UInt32

    /**
     * The build number of the operating system.
     */
    BuildNumber : UInt32

    PlatformId : VER_PLATFORM

    /**
     * An RVA (from the beginning of the dump) to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_string">MINIDUMP_STRING</a> that describes the latest Service 
     *        Pack installed on the system. If no Service Pack has been installed, the string is empty.
     */
    CSDVersionRva : UInt32

    Reserved1 : UInt32

    Cpu : CPU_INFORMATION

    static __New() {
        DefineProp(this.Prototype, 'NumberOfProcessors', { type: Int8, offset: 6 })
        DefineProp(this.Prototype, 'ProductType', { type: Int8, offset: 7 })
        DefineProp(this.Prototype, 'SuiteMask', { type: UInt16, offset: 28 })
        DefineProp(this.Prototype, 'Reserved2', { type: UInt16, offset: 30 })
        this.DeleteProp("__New")
    }
}
