#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FUNCKIND.ahk" { FUNCKIND }
#Import "..\Ole\ARRAYDESC.ahk" { ARRAYDESC }
#Import ".\ELEMDESC.ahk" { ELEMDESC }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import ".\IDLFLAGS.ahk" { IDLFLAGS }
#Import ".\FUNCFLAGS.ahk" { FUNCFLAGS }
#Import ".\TYPEDESC.ahk" { TYPEDESC }
#Import "..\Ole\PARAMFLAGS.ahk" { PARAMFLAGS }
#Import "..\Ole\PARAMDESC.ahk" { PARAMDESC }
#Import "..\Ole\PARAMDESCEX.ahk" { PARAMDESCEX }
#Import ".\INVOKEKIND.ahk" { INVOKEKIND }
#Import ".\CALLCONV.ahk" { CALLCONV }
#Import ".\IDLDESC.ahk" { IDLDESC }

/**
 * Describes a function. (FUNCDESC)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-funcdesc
 * @namespace Windows.Win32.System.Com
 */
export default struct FUNCDESC {
    #StructPack 8

    /**
     * The function member ID.
     */
    memid : Int32

    /**
     * The status code.
     */
    lprgscode : IntPtr

    /**
     * Description of the element.
     */
    lprgelemdescParam : ELEMDESC.Ptr

    /**
     * Indicates the type of function (virtual, static, or dispatch-only).
     */
    funckind : FUNCKIND

    /**
     * The invocation type. Indicates whether this is a property function, and if so, which type.
     */
    invkind : INVOKEKIND

    /**
     * The calling convention.
     */
    callconv : CALLCONV

    /**
     * The total number of parameters.
     */
    cParams : Int16

    /**
     * The number of optional parameters.
     */
    cParamsOpt : Int16

    /**
     * For FUNC_VIRTUAL, specifies the offset in the VTBL.
     */
    oVft : Int16

    /**
     * The number of possible return values.
     */
    cScodes : Int16

    /**
     * The function return type.
     */
    elemdescFunc : ELEMDESC

    /**
     * The function flags. See <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ne-oaidl-funcflags">FUNCFLAGS</a>.
     */
    wFuncFlags : FUNCFLAGS

}
