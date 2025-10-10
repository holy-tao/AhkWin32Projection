#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to store a pair of IKE/Authip cookies.
 * @remarks
 * 
  * <b>IKEEXT_COOKIE_PAIR0</b> is a specific implementation of IKEEXT_COOKIE_PAIR. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_cookie_pair0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_COOKIE_PAIR0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Initiator cookie. An IKEEXT_COOKIE is a UINT64.
     * @type {Integer}
     */
    initiator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Responder cookie. An IKEEXT_COOKIE is a UINT64.
     * @type {Integer}
     */
    responder {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
