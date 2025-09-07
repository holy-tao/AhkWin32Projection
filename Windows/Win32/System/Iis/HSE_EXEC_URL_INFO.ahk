#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HSE_EXEC_URL_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszUrl{
        get {
            if(!this.HasProp("__pszUrl"))
                this.__pszUrl := PSTR(this.ptr + 0)
            return this.__pszUrl
        }
    }

    /**
     * @type {PSTR}
     */
    pszMethod{
        get {
            if(!this.HasProp("__pszMethod"))
                this.__pszMethod := PSTR(this.ptr + 8)
            return this.__pszMethod
        }
    }

    /**
     * @type {PSTR}
     */
    pszChildHeaders{
        get {
            if(!this.HasProp("__pszChildHeaders"))
                this.__pszChildHeaders := PSTR(this.ptr + 16)
            return this.__pszChildHeaders
        }
    }

    /**
     * @type {Pointer<HSE_EXEC_URL_USER_INFO>}
     */
    pUserInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<HSE_EXEC_URL_ENTITY_INFO>}
     */
    pEntity {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwExecUrlFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
