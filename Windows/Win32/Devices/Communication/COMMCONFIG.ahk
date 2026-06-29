#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DCB_PARITY.ahk" { DCB_PARITY }
#Import ".\DCB_STOP_BITS.ahk" { DCB_STOP_BITS }
#Import ".\DCB.ahk" { DCB }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about the configuration state of a communications device.
 * @remarks
 * If the provider subtype is PST_RS232 or PST_PARALLELPORT, the <b>wcProviderData</b> member is omitted. If the provider subtype is PST_MODEM, the <b>wcProviderData</b> member contains a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemsettings">MODEMSETTINGS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-commconfig
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct COMMCONFIG {
    #StructPack 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(COMMCONFIG)</c>.
     */
    dwSize : UInt32

    /**
     * The version number of the structure. This parameter can be 1. The version of the provider-specific structure should be included in the <b>wcProviderData</b> member.
     */
    wVersion : UInt16

    /**
     * Reserved; do not use.
     */
    wReserved : UInt16

    /**
     * The device-control block (<a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a>) structure for RS-232 serial devices. A 
     * <b>DCB</b> structure is always present regardless of the port driver subtype specified in the device's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commprop">COMMPROP</a> structure.
     */
    dcb : DCB

    /**
     * The type of communications provider, and thus the format of the provider-specific data. For a list of communications provider types, see the description of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commprop">COMMPROP</a> structure.
     */
    dwProviderSubType : UInt32

    /**
     * The offset of the provider-specific data relative to the beginning of the structure, in bytes. This member is zero if there is no provider-specific data.
     */
    dwProviderOffset : UInt32

    /**
     * The size of the provider-specific data, in bytes.
     */
    dwProviderSize : UInt32

    /**
     * Optional provider-specific data. This member can be of any size or can be omitted. Because the 
     * <b>COMMCONFIG</b> structure may be expanded in the future, applications should use the <b>dwProviderOffset</b> member to determine the location of this member.
     */
    wcProviderData : WCHAR[1]

}
