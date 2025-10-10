#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TYPEDESC.ahk
#Include .\IDLDESC.ahk
#Include ..\Ole\PARAMDESC.ahk
#Include .\ELEMDESC.ahk

/**
 * Describes a function.
 * @remarks
 * 
  * The <b>cParams</b> field specifies the total number of required and optional parameters.
  * 
  * 
  * 
  * The <b>cParamsOpt</b> field specifies the form of optional parameters accepted by the function, as follows:
  * 
  * <ul>
  * <li>
  * A value of 0 specifies that no optional arguments are supported.
  * 
  * 
  * 
  * </li>
  * <li>
  * A value of –1 specifies that the method's last parameter is a pointer to a safe array of variants. Any number of variant arguments greater than <b>cParams</b> –1 must be packaged by the caller into a safe array and passed as the final parameter. This array of optional parameters must be freed by the caller after control is returned from the call.
  * 
  * 
  * 
  * </li>
  * <li>
  * Any other number indicates that the last n parameters of the function are variants and do not need to be specified by the caller explicitly. The parameters left unspecified should be filled in by the compiler or interpreter as variants of type VT_ERROR with the value DISP_E_PARAMNOTFOUND.
  * 
  * 
  * 
  * </li>
  * </ul>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ns-oaidl-funcdesc
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class FUNCDESC extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The function member ID.
     * @type {Integer}
     */
    memid {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The status code.
     * @type {Pointer<Int32>}
     */
    lprgscode {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Description of the element.
     * @type {Pointer<ELEMDESC>}
     */
    lprgelemdescParam {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Indicates the type of function (virtual, static, or dispatch-only).
     * @type {Integer}
     */
    funckind {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The invocation type. Indicates whether this is a property function, and if so, which type.
     * @type {Integer}
     */
    invkind {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The calling convention.
     * @type {Integer}
     */
    callconv {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The total number of parameters.
     * @type {Integer}
     */
    cParams {
        get => NumGet(this, 36, "short")
        set => NumPut("short", value, this, 36)
    }

    /**
     * The number of optional parameters.
     * @type {Integer}
     */
    cParamsOpt {
        get => NumGet(this, 38, "short")
        set => NumPut("short", value, this, 38)
    }

    /**
     * For FUNC_VIRTUAL, specifies the offset in the VTBL.
     * @type {Integer}
     */
    oVft {
        get => NumGet(this, 40, "short")
        set => NumPut("short", value, this, 40)
    }

    /**
     * The number of possible return values.
     * @type {Integer}
     */
    cScodes {
        get => NumGet(this, 42, "short")
        set => NumPut("short", value, this, 42)
    }

    /**
     * The function return type.
     * @type {ELEMDESC}
     */
    elemdescFunc{
        get {
            if(!this.HasProp("__elemdescFunc"))
                this.__elemdescFunc := ELEMDESC(this.ptr + 48)
            return this.__elemdescFunc
        }
    }

    /**
     * The function flags. See <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ne-oaidl-funcflags">FUNCFLAGS</a>.
     * @type {Integer}
     */
    wFuncFlags {
        get => NumGet(this, 80, "ushort")
        set => NumPut("ushort", value, this, 80)
    }
}
