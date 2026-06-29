#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MACHINE_ATTRIBUTES.ahk" { MACHINE_ATTRIBUTES }
#Import "..\SystemInformation\IMAGE_FILE_MACHINE.ahk" { IMAGE_FILE_MACHINE }

/**
 * Specifies the architecture of a process and if that architecture of code can run in user mode, kernel mode, and/or under WoW64 on the host operating system.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_machine_information
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_MACHINE_INFORMATION {
    #StructPack 4

    /**
     * An IMAGE_FILE_MACHINE_* value indicating the architecture of the associated process. See the list of architecture values in [Image File Machine Constants](/windows/win32/sysinfo/image-file-machine-constants).
     */
    ProcessMachine : IMAGE_FILE_MACHINE

    /**
     * Reserved.
     */
    Res0 : UInt16

    /**
     * A value from the [MACHINE_ATTRIBUTES](ne-processthreadsapi-machine_attributes.md) enumeration indicating if the process’s architecture can run in user mode, kernel mode, and/or under WOW64 on the host operating system.
     */
    MachineAttributes : MACHINE_ATTRIBUTES

}
