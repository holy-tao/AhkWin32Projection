#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Provides information about the context in which marshalling should be carried out.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ns-callobj-callframe_marshalcontext
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct CALLFRAME_MARSHALCONTEXT {
    #StructPack 8

    /**
     * <b>TRUE</b> if the in parameter values are to be marshaled and <b>FALSE</b> if the out parameter values are to be marshaled. The in parameter values are marshaled on the client side and the out parameter values are marshaled on the server side.
     */
    fIn : BOOLEAN

    /**
     * Context in which unmarshaling is to be carried out.
     */
    dwDestContext : UInt32

    /**
     * Context in which unmarshaling is to be carried out.
     */
    pvDestContext : IntPtr

    /**
     * This parameter should be <b>NULL</b>.
     */
    punkReserved : IUnknown

    /**
     * The transfer syntax for which the marshalling should occur.
     */
    guidTransferSyntax : Guid

}
