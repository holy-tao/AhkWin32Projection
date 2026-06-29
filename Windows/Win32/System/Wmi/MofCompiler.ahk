#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IMofCompiler interface, implemented by Mofd.dll, provides a COM interface that is used by the Managed Object Format (MOF) compiler and any other applications that compile MOF files.
 * @remarks
 * <b>Windows 8:  </b>When installing a provider the <b>IMofCompiler</b> interface treats the [Key] and [Static] qualifiers as true if they are present, regardless of their actual values. Other qualifiers are treated as false if they are present but not explicitly set to true.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-imofcompiler
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MofCompiler {
    #StructPack 1

}
