#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTSINFOEX_LEVEL1_A.ahk

/**
 * Contains a WTSINFOEX_LEVEL1 structure that contains extended information about a Remote Desktop Services session. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsinfoex_level_a
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class WTSINFOEX_LEVEL_A extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsinfoex_level1_a">WTSINFOEX_LEVEL1</a> structure that contains extended session information.
     * @type {WTSINFOEX_LEVEL1_A}
     */
    WTSInfoExLevel1{
        get {
            if(!this.HasProp("__WTSInfoExLevel1"))
                this.__WTSInfoExLevel1 := WTSINFOEX_LEVEL1_A(0, this)
            return this.__WTSInfoExLevel1
        }
    }
}
