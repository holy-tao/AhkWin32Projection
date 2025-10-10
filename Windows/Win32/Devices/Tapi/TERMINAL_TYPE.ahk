#Requires AutoHotkey v2.0.0 64-bit

/**
 * The TERMINAL_TYPE enum describes the type of the terminal. This enum is returned by the ITTerminal::get_TerminalType method.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-terminal_type
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TERMINAL_TYPE{

    /**
     * A static terminal is a terminal that cannot be created and usually refers to hardware device. TAPI enumerates these terminals.
     * @type {Integer (Int32)}
     */
    static TT_STATIC => 0

    /**
     * A terminal type that can be created. The application must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itterminalsupport-createterminal">ITTerminalSupport::CreateTerminal</a> to use this type of terminal.
     * @type {Integer (Int32)}
     */
    static TT_DYNAMIC => 1
}
