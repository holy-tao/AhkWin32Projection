#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IWbemDecoupledBasicEventProvider::GetService method retrieves an IWbemService object to be used to call back into WMI. This method provides for fully concurrent access.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledbasiceventprovider-getservice
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemDecoupledBasicEventProvider extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
