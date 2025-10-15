#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_DUMP_CUSTOM_OPTIONS_V2 extends Win32Struct
{
    static sizeof => 560

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwDumpFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    bOnlyThisThread{
        get {
            if(!this.HasProp("__bOnlyThisThread"))
                this.__bOnlyThisThread := BOOL(this.ptr + 12)
            return this.__bOnlyThisThread
        }
    }

    /**
     * @type {Integer}
     */
    dwExceptionThreadFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwOtherThreadFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwExceptionThreadExFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwOtherThreadExFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwPreferredModuleFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwOtherModuleFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {String}
     */
    wzPreferredModuleList {
        get => StrGet(this.ptr + 40, 255, "UTF-16")
        set => StrPut(value, this.ptr + 40, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwPreferredModuleResetFlags {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {Integer}
     */
    dwOtherModuleResetFlags {
        get => NumGet(this, 556, "uint")
        set => NumPut("uint", value, this, 556)
    }
}
