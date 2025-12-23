#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ADDRESS_STATE enum is used by the ITAddress::get_State method to check the address state.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-address_state
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ADDRESS_STATE extends Win32Enum{

    /**
     * Normal state; the address can be used.
     * @type {Integer (Int32)}
     */
    static AS_INSERVICE => 0

    /**
     * The address is temporarily out of service, but may go back into service at some time.
     * @type {Integer (Int32)}
     */
    static AS_OUTOFSERVICE => 1
}
