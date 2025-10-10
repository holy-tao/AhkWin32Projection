#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an unordered set of keying modules that will be tried for IPsec.
 * @remarks
 * 
  * <b>IPSEC_KEYING_POLICY0</b> is a specific implementation of IPSEC_KEYING_POLICY. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_keying_policy0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_KEYING_POLICY0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of keying modules in the array.
     * @type {Integer}
     */
    numKeyMods {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of distinct keying modules.
     * @type {Pointer<Guid>}
     */
    keyModKeys {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
