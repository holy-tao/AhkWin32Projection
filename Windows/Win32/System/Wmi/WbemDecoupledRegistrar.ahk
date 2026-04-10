#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IWbemDecoupledRegistrar::Register method registers an object interface with WMI.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledregistrar-register
 * @namespace Windows.Win32.System.Wmi
 */
class WbemDecoupledRegistrar extends Win32Struct {
    static sizeof => 0

    static packingSize => 1
}
