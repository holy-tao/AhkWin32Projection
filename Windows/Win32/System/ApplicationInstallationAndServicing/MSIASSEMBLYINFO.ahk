#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * .NET Assembly
 * @see https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovideassemblya
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSIASSEMBLYINFO extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static MSIASSEMBLYINFO_NETASSEMBLY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MSIASSEMBLYINFO_WIN32ASSEMBLY => 1
}
