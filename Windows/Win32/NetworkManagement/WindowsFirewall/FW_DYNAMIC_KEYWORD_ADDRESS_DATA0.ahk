#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FW_DYNAMIC_KEYWORD_ADDRESS0.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address_data0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class FW_DYNAMIC_KEYWORD_ADDRESS_DATA0 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {FW_DYNAMIC_KEYWORD_ADDRESS0}
     */
    dynamicKeywordAddress{
        get {
            if(!this.HasProp("__dynamicKeywordAddress"))
                this.__dynamicKeywordAddress := FW_DYNAMIC_KEYWORD_ADDRESS0(0, this)
            return this.__dynamicKeywordAddress
        }
    }

    /**
     * @type {Pointer<FW_DYNAMIC_KEYWORD_ADDRESS_DATA0>}
     */
    next {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    schemaVersion {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    originType {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
