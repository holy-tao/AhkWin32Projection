#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASPPPLCPA extends Win32Struct
{
    static sizeof => 1080

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    fBundled {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwAuthenticationProtocol {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwAuthenticationData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwEapTypeId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwServerAuthenticationProtocol {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwServerAuthenticationData {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwServerEapTypeId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {BOOL}
     */
    fMultilink {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwTerminateReason {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwServerTerminateReason {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {String}
     */
    szReplyMessage {
        get => StrGet(this.ptr + 48, 1023, "UTF-8")
        set => StrPut(value, this.ptr + 48, 1023, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 1072, "uint")
        set => NumPut("uint", value, this, 1072)
    }

    /**
     * @type {Integer}
     */
    dwServerOptions {
        get => NumGet(this, 1076, "uint")
        set => NumPut("uint", value, this, 1076)
    }
}
