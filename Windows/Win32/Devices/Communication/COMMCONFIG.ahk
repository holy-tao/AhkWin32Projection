#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DCB.ahk

/**
 * Contains information about the configuration state of a communications device.
 * @remarks
 * If the provider subtype is PST_RS232 or PST_PARALLELPORT, the <b>wcProviderData</b> member is omitted. If the provider subtype is PST_MODEM, the <b>wcProviderData</b> member contains a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemsettings">MODEMSETTINGS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-commconfig
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class COMMCONFIG extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(COMMCONFIG)</c>.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The version number of the structure. This parameter can be 1. The version of the provider-specific structure should be included in the <b>wcProviderData</b> member.
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The device-control block (<a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a>) structure for RS-232 serial devices. A 
     * <b>DCB</b> structure is always present regardless of the port driver subtype specified in the device's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commprop">COMMPROP</a> structure.
     * @type {DCB}
     */
    dcb{
        get {
            if(!this.HasProp("__dcb"))
                this.__dcb := DCB(8, this)
            return this.__dcb
        }
    }

    /**
     * The type of communications provider, and thus the format of the provider-specific data. For a list of communications provider types, see the description of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commprop">COMMPROP</a> structure.
     * @type {Integer}
     */
    dwProviderSubType {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The offset of the provider-specific data relative to the beginning of the structure, in bytes. This member is zero if there is no provider-specific data.
     * @type {Integer}
     */
    dwProviderOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The size of the provider-specific data, in bytes.
     * @type {Integer}
     */
    dwProviderSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Optional provider-specific data. This member can be of any size or can be omitted. Because the 
     * <b>COMMCONFIG</b> structure may be expanded in the future, applications should use the <b>dwProviderOffset</b> member to determine the location of this member.
     * @type {String}
     */
    wcProviderData {
        get => StrGet(this.ptr + 48, 0, "UTF-16")
        set => StrPut(value, this.ptr + 48, 0, "UTF-16")
    }
}
