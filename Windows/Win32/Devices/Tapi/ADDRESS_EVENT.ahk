#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADDRESS_EVENT enum describes address events. The ITAddressEvent::get_Event method returns a member of this enum to indicate the type of address event that occurred.
 * @remarks
 * 
 * Certain events on PnP devices will not be received until after the first time static terminals are enumerated using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-enumeratestaticterminals">ITTerminalSupport::EnumerateStaticTerminals</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-get_staticterminals">ITTerminalSupport::get_StaticTerminals</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-address_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ADDRESS_EVENT{

    /**
     * The address state has changed. See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itaddress-get_state">ITAddress::get_State</a>.
     * @type {Integer (Int32)}
     */
    static AE_STATE => 0

    /**
     * Address capabilities have changed. See 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddrcapflags--constants">capability flags</a>.
     * @type {Integer (Int32)}
     */
    static AE_CAPSCHANGE => 1

    /**
     * There is ringing on the address.
     * @type {Integer (Int32)}
     */
    static AE_RINGING => 2

    /**
     * The address configuration has changed.
     * @type {Integer (Int32)}
     */
    static AE_CONFIGCHANGE => 3

    /**
     * Forwarding has changed. See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itaddress-get_currentforwardinfo">ITAddress::get_CurrentForwardInfo</a>.
     * @type {Integer (Int32)}
     */
    static AE_FORWARD => 4

    /**
     * A new terminal has been added. The application should respond by selecting the terminal if it is going to be used on an active call.
     * @type {Integer (Int32)}
     */
    static AE_NEWTERMINAL => 5

    /**
     * A terminal has been removed. The application should respond by unselecting the terminal if it is currently selected to an active call.
     * @type {Integer (Int32)}
     */
    static AE_REMOVETERMINAL => 6

    /**
     * The message waiting indicator has been turned on. This applies only to phone addresses.
     * @type {Integer (Int32)}
     */
    static AE_MSGWAITON => 7

    /**
     * The message waiting indicator has been turned off. This applies only to phone addresses.
     * @type {Integer (Int32)}
     */
    static AE_MSGWAITOFF => 8

    /**
     * Last item in this enum.
     * @type {Integer (Int32)}
     */
    static AE_LASTITEM => 8
}
