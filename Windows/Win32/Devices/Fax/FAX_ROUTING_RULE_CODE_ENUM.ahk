#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FAX_ROUTING_RULE_CODE_ENUM enumeration defines the rules for outbound routing.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/ne-faxcomex-fax_routing_rule_code_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ROUTING_RULE_CODE_ENUM extends Win32Enum{

    /**
     * Any area or country/region code. Used as a default value in functions that require an area or country/region code.
     * @type {Integer (Int32)}
     */
    static frrcANY_CODE => 0
}
