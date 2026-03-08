#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovideassemblya">MsiProvideAssembly</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovideassemblyw">MsiProvideAssembly</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovideassemblya">MsiProvideAssemblyA</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovideassemblyw">MsiProvideAssemblyA</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovideassemblya">MsiProvideAssemblyW</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovideassemblyw">MsiProvideAssemblyW</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidecomponenta">MsiProvideComponent</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidecomponentw">MsiProvideComponent</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidecomponenta">MsiProvideComponentA</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidecomponentw">MsiProvideComponentA</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidecomponenta">MsiProvideComponentW</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidecomponentw">MsiProvideComponentW</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponenta">MsiProvideQualifiedComponent</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponentw">MsiProvideQualifiedComponent</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponenta">MsiProvideQualifiedComponentA</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponentw">MsiProvideQualifiedComponentA</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponentexa">MsiProvideQualifiedComponentEx</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponentexw">MsiProvideQualifiedComponentEx</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponentexa">MsiProvideQualifiedComponentExA</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponentexw">MsiProvideQualifiedComponentExA</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponentexa">MsiProvideQualifiedComponentExW</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponentexw">MsiProvideQualifiedComponentExW</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponenta">MsiProvideQualifiedComponentW</see>, <see href="https://learn.microsoft.com/windows/win32/api/msi/nf-msi-msiprovidequalifiedcomponentw">MsiProvideQualifiedComponentW</see>.
 * @see 
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class INSTALLMODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_NODETECTION_ANY => -4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_NOSOURCERESOLUTION => -3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_NODETECTION => -2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_EXISTING => -1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_DEFAULT => 0
}
