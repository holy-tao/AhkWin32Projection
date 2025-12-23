#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides information about a call frame such as the method in the call frame, if it has in, out, or in/out parameters, the number of [in], [out], or [in, out] interfaces, the interface ID, the number of methods in the interface and the number of parameters in this method.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ns-callobj-callframeinfo
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class CALLFRAMEINFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The method number within the interface in question.
     * @type {Integer}
     */
    iMethod {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>TRUE</b> if there are any [in] parameters in the method; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    fHasInValues {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * <b>TRUE</b> if there are any [in, out] parameters in the method; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    fHasInOutValues {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * <b>TRUE</b> if there are any out parameters other than <b>HRESULT</b> or <b>void</b> return values in the method; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    fHasOutValues {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * <b>TRUE</b> if the interface is derived from <b>IDispatch</b>; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    fDerivesFromIDispatch {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * If this parameter has a value greater or equal to 0, then the value is an absolute upper bound on the number [in] interfaces. If this parameter is less than 0, then the method may have an unbounded number of [in] interfaces. If this parameter is equal to 0, then there are no [in] interfaces.
     * @type {Integer}
     */
    cInInterfacesMax {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * If this parameter has a value greater or equal to 0, then the value is an absolute upper bound on the number [in, out] interfaces. If this parameter is less than 0, then the method may have an unbounded number of [in, out] interfaces. If this parameter is equal to 0, then there are no [in, out] interfaces.
     * @type {Integer}
     */
    cInOutInterfacesMax {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * If this parameter has a value greater or equal to 0, then the value is an absolute upper bound on the number [out] interfaces. If this parameter is less than 0, then the method may have an unbounded number of [out] interfaces. If this parameter is equal to 0, then there are no [out] interfaces.
     * @type {Integer}
     */
    cOutInterfacesMax {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The number of parameters that are in interface pointers.
     * @type {Integer}
     */
    cTopLevelInInterfaces {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The interface ID.
     * @type {Pointer<Guid>}
     */
    iid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The number of methods in <b>iid</b>.
     * @type {Integer}
     */
    cMethod {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of parameters in <b>imethod</b>. The receiver is excluded.
     * @type {Integer}
     */
    cParams {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
