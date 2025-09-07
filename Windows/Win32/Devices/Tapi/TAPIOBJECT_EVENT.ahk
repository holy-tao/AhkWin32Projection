#Requires AutoHotkey v2.0.0 64-bit

/**
 * The TAPIOBJECT_EVENT enum describes TAPI object events. The ITTAPIObjectEvent::get_Event method returns a member of this enum to indicate the type of TAPI object event that occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-tapiobject_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TAPIOBJECT_EVENT{

    /**
     * A new address has been created.
     * @type {Integer (Int32)}
     */
    static TE_ADDRESSCREATE => 0

    /**
     * An address has been moved.
     * @type {Integer (Int32)}
     */
    static TE_ADDRESSREMOVE => 1

    /**
     * The TAPI object has been reinitialized
     * @type {Integer (Int32)}
     */
    static TE_REINIT => 2

    /**
     * A translation change has occurred.
     * @type {Integer (Int32)}
     */
    static TE_TRANSLATECHANGE => 3

    /**
     * Address has been closed.
     * @type {Integer (Int32)}
     */
    static TE_ADDRESSCLOSE => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TE_PHONECREATE => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TE_PHONEREMOVE => 6
}
