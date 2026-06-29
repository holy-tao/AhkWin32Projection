#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Sent with a power setting event and contains data about the specific change.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-powerbroadcast_setting
 * @namespace Windows.Win32.System.Power
 */
export default struct POWERBROADCAST_SETTING {
    #StructPack 4

    /**
     * Indicates the power setting for which this notification is being delivered. For more 
     *     info, see <a href="https://docs.microsoft.com/windows/desktop/Power/power-setting-guids">Power Setting GUIDs</a>.
     */
    PowerSetting : Guid

    /**
     * The size in bytes of the data in the  <i>Data</i> member.
     */
    DataLength : UInt32

    /**
     * The new value of the power setting. The type and possible values for this member depend on <i>PowerSettng.</i>
     */
    Data : Int8[1]

}
