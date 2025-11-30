#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CALLHUB_STATE enum is a state indicator returned by the ITCallHub::get_State method.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-callhub_state
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALLHUB_STATE extends Win32Enum{

    /**
     * The CallHub is active. There is at least one call that is not in the CS_DISCONNECTED state.
     * @type {Integer (Int32)}
     */
    static CHS_ACTIVE => 0

    /**
     * All calls associated with this CallHub are in the CS_DISCONNECTED state.
     * @type {Integer (Int32)}
     */
    static CHS_IDLE => 1
}
