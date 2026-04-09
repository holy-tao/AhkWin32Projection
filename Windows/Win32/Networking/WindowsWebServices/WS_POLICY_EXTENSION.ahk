#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_POLICY_EXTENSION_TYPE.ahk

/**
 * The base class for all policy extension structures. Policy extensions are assertions that are directly handled by applications such as custom assertions.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_policy_extension
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_POLICY_EXTENSION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * This value depends on which type of policy extension that is used.
     * @type {WS_POLICY_EXTENSION_TYPE}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
