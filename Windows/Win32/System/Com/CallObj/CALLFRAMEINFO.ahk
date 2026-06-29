#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Provides information about a call frame such as the method in the call frame, if it has in, out, or in/out parameters, the number of [in], [out], or [in, out] interfaces, the interface ID, the number of methods in the interface and the number of parameters in this method.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ns-callobj-callframeinfo
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct CALLFRAMEINFO {
    #StructPack 4

    /**
     * The method number within the interface in question.
     */
    iMethod : UInt32

    /**
     * <b>TRUE</b> if there are any [in] parameters in the method; otherwise, <b>FALSE</b>.
     */
    fHasInValues : BOOL

    /**
     * <b>TRUE</b> if there are any [in, out] parameters in the method; otherwise, <b>FALSE</b>.
     */
    fHasInOutValues : BOOL

    /**
     * <b>TRUE</b> if there are any out parameters other than <b>HRESULT</b> or <b>void</b> return values in the method; otherwise, <b>FALSE</b>.
     */
    fHasOutValues : BOOL

    /**
     * <b>TRUE</b> if the interface is derived from <b>IDispatch</b>; otherwise, <b>FALSE</b>.
     */
    fDerivesFromIDispatch : BOOL

    /**
     * If this parameter has a value greater or equal to 0, then the value is an absolute upper bound on the number [in] interfaces. If this parameter is less than 0, then the method may have an unbounded number of [in] interfaces. If this parameter is equal to 0, then there are no [in] interfaces.
     */
    cInInterfacesMax : Int32

    /**
     * If this parameter has a value greater or equal to 0, then the value is an absolute upper bound on the number [in, out] interfaces. If this parameter is less than 0, then the method may have an unbounded number of [in, out] interfaces. If this parameter is equal to 0, then there are no [in, out] interfaces.
     */
    cInOutInterfacesMax : Int32

    /**
     * If this parameter has a value greater or equal to 0, then the value is an absolute upper bound on the number [out] interfaces. If this parameter is less than 0, then the method may have an unbounded number of [out] interfaces. If this parameter is equal to 0, then there are no [out] interfaces.
     */
    cOutInterfacesMax : Int32

    /**
     * The number of parameters that are in interface pointers.
     */
    cTopLevelInInterfaces : Int32

    /**
     * The interface ID.
     */
    iid : Guid

    /**
     * The number of methods in <b>iid</b>.
     */
    cMethod : UInt32

    /**
     * The number of parameters in <b>imethod</b>. The receiver is excluded.
     */
    cParams : UInt32

}
