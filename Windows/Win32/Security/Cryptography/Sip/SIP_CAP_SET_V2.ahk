#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SIP_CAP_SET_V2 structure defines the capabilities of a subject interface package (SIP). (SIP_CAP_SET_V2 structure)
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-sip_cap_set_v2
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct SIP_CAP_SET_V2 {
    #StructPack 4

    /**
     * Size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The SIP version. By default, this value is two (2).
     */
    dwVersion : UInt32

    /**
     * A value of one (1) indicates that the SIP supports multiple embedded signatures. Otherwise, set this value to zero (0).
     */
    isMultiSign : BOOL

    /**
     * Reserved for future use. Set this value to zero (0).
     */
    dwReserved : UInt32

}
