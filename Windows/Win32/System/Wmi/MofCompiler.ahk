#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IMofCompiler interface, implemented by Mofd.dll, provides a COM interface that is used by the Managed Object Format (MOF) compiler and any other applications that compile MOF files.
 * @remarks
 * <b>Windows 8:  </b>When installing a provider the <b>IMofCompiler</b> interface treats the [Key] and [Static] qualifiers as true if they are present, regardless of their actual values. Other qualifiers are treated as false if they are present but not explicitly set to true.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-imofcompiler
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MofCompiler extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
