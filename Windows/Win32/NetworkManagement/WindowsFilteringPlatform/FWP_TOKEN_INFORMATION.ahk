#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FWP_TOKEN_INFORMATION structure defines a set of security identifiers that are used for user-mode classification.
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ns-fwptypes-fwp_token_information
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_TOKEN_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures stored in the <b>sids</b> array.
     * @type {Integer}
     */
    sidCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures containing user and group security information.
     * @type {Pointer<SID_AND_ATTRIBUTES>}
     */
    sids {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures stored in the <b>restrictedSids</b> array.
     * @type {Integer}
     */
    restrictedSidCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures containing restricted SIDs security information.
     * @type {Pointer<SID_AND_ATTRIBUTES>}
     */
    restrictedSids {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
