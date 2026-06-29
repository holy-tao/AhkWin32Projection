#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the ways in which an architecture of code can run on a host operating system.  More than one bit may be set.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-machine_attributes
 * @namespace Windows.Win32.System.Threading
 */
export default struct MACHINE_ATTRIBUTES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The specified architecture of code can run in user mode.
     * @type {Integer (Int32)}
     */
    static UserEnabled => 1

    /**
     * The specified architecture of code can run in kernel mode.
     * @type {Integer (Int32)}
     */
    static KernelEnabled => 2

    /**
     * The specified architecture of code runs by relying on WOW64's namespace [File System Redirector](/windows/win32/winprog64/file-system-redirector) and  [Registry Redirector](/windows/win32/winprog64/registry-redirector). This bit will be set, for example, on x86 code running on a host operating system that is x64 or ARM64. When the compatibility layer does not use WOW64 style filesystem and registry namespaces, like x64 on ARM64 which runs on the root namespace of the OS, this bit will be reset.
     * @type {Integer (Int32)}
     */
    static Wow64Container => 4
}
