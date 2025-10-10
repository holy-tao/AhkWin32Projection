#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MSP_EVENT enumerator defines the type of event information contained in MSP_EVENT_INFO.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3/ne-tapi3-msp_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class MSP_EVENT{

    /**
     * The event buffer is an 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms733454(v=vs.85)">MSP_ADDRESS_EVENT_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static ME_ADDRESS_EVENT => 0

    /**
     * The event buffer is an 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms733464(v=vs.85)">MSP_CALL_EVENT_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static ME_CALL_EVENT => 1

    /**
     * The event buffer is an 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms733475(v=vs.85)">MSP_TSP_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static ME_TSP_DATA => 2

    /**
     * The event buffer is an 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms733472(v=vs.85)">MSP_PRIVATE_EVENT_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static ME_PRIVATE_EVENT => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ME_ASR_TERMINAL_EVENT => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ME_TTS_TERMINAL_EVENT => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ME_FILE_TERMINAL_EVENT => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ME_TONE_TERMINAL_EVENT => 7
}
