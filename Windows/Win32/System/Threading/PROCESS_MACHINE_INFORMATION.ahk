#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the architecture of a process and if that architecture of code can run in user mode, kernel mode, and/or under WoW64 on the host operating system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_machine_information
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_MACHINE_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An IMAGE_FILE_MACHINE_* value indicating the architecture of the associated process. See the list of architecture values in [Image File Machine Constants](/windows/win32/sysinfo/image-file-machine-constants).
     * @type {Integer}
     */
    ProcessMachine {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Res0 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * A value from the [MACHINE_ATTRIBUTES](ne-processthreadsapi-machine_attributes.md) enumeration indicating if the process’s architecture can run in user mode, kernel mode, and/or under WOW64 on the host operating system.
     * @type {Integer}
     */
    MachineAttributes {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
