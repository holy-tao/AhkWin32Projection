#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FAX_ROUTING_RULE_CODE_ENUM enumeration defines the rules for outbound routing.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_routing_rule_code_enum
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_ROUTING_RULE_CODE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Any area or country/region code. Used as a default value in functions that require an area or country/region code.
     * @type {Integer (Int32)}
     */
    static frrcANY_CODE => 0
}
