#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR_CS_ROUTINES.ahk" { NDR_CS_ROUTINES }
#Import ".\GENERIC_BINDING_INFO.ahk" { GENERIC_BINDING_INFO }
#Import ".\COMM_FAULT_OFFSETS.ahk" { COMM_FAULT_OFFSETS }
#Import ".\NDR_EXPR_DESC.ahk" { NDR_EXPR_DESC }
#Import ".\MALLOC_FREE_STRUCT.ahk" { MALLOC_FREE_STRUCT }
#Import ".\XMIT_ROUTINE_QUINTUPLE.ahk" { XMIT_ROUTINE_QUINTUPLE }
#Import ".\GENERIC_BINDING_ROUTINE_PAIR.ahk" { GENERIC_BINDING_ROUTINE_PAIR }
#Import ".\USER_MARSHAL_ROUTINE_QUADRUPLE.ahk" { USER_MARSHAL_ROUTINE_QUADRUPLE }

/**
 * The MIDL_STUB_DESC structure is a MIDL-generated structure that contains information about the interface stub regarding RPC calls between the client and server.
 * @see https://learn.microsoft.com/windows/win32/api/rpcndr/ns-rpcndr-midl_stub_desc
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_STUB_DESC {
    #StructPack 8


    struct _IMPLICIT_HANDLE_INFO {
        pAutoHandle : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'pPrimitiveHandle', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'pGenericBindingInfo', { type: GENERIC_BINDING_INFO.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * For a nonobject RPC interface on the server-side, it points to an RPC server interface structure. On the client-side, it points to an RPC client interface structure. It is null for an object interface.
     */
    RpcInterfaceInformation : IntPtr

    /**
     * Memory allocation function to be used by the stub. Set to <a href="https://msdn.microsoft.com/">midl_user_allocate</a> for nonobject interface and <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-ndroleallocate"> NdrOleAllocate</a> for object interface.
     */
    pfnAllocate : IntPtr

    /**
     * Memory-free function to be used by the stub. Set to <a href="https://docs.microsoft.com/windows/desktop/Midl/midl-user-free-1">midl_user_free</a> for nonobject interface and <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-ndrolefree"> NdrOleFree</a> for object interface.
     */
    pfnFree : IntPtr

    /**
     * The union contains one of the following handles.
     */
    IMPLICIT_HANDLE_INFO : MIDL_STUB_DESC._IMPLICIT_HANDLE_INFO

    /**
     * Array of context handle rundown functions.
     */
    apfnNdrRundownRoutines : IntPtr

    /**
     * Array of function pointers to bind and unbind function pairs for the implicit generic handle.
     */
    aGenericBindingRoutinePairs : GENERIC_BINDING_ROUTINE_PAIR.Ptr

    /**
     * Array of function pointers to expression evaluator functions used to evaluate MIDL complex conformance and varying descriptions. For example, <a href="https://docs.microsoft.com/windows/desktop/Midl/size-is">size_is</a>(param1 + param2).
     */
    apfnExprEval : IntPtr

    /**
     * Array of an array of function pointers for user-defined <a href="https://docs.microsoft.com/windows/desktop/Midl/transmit-as">transmit_as</a> and <a href="https://msdn.microsoft.com/">represent_as</a>  types.
     */
    aXmitQuintuple : XMIT_ROUTINE_QUINTUPLE.Ptr

    /**
     * Pointer to the type format description.
     */
    pFormatTypes : IntPtr

    /**
     * Flag describing the user-specified <a href="https://docs.microsoft.com/windows/desktop/Midl/-error">/error</a> MIDL compiler option.
     */
    fCheckBounds : Int32

    /**
     * NDR version required for the stub.
     */
    Version : UInt32

    /**
     * Pointer to the MALLOC_FREE_STRUCT structure which contains the allocate and free function pointers. Use if the <a href="https://docs.microsoft.com/windows/desktop/Midl/enable-allocate">enable_allocate</a> MIDL attribute is specified.
     */
    pMallocFreeStruct : MALLOC_FREE_STRUCT.Ptr

    /**
     * Version of the MIDL compiler used to compile the .idl file.
     */
    MIDLVersion : Int32

    /**
     * Array of stack offsets for parameters with <a href="https://docs.microsoft.com/windows/desktop/Midl/comm-status">comm_status</a> or <a href="https://msdn.microsoft.com/">fault_status</a> attributes.
     */
    CommFaultOffsets : COMM_FAULT_OFFSETS.Ptr

    /**
     * Array of an array of function pointers for user-defined <a href="https://docs.microsoft.com/windows/desktop/Midl/user-marshal">user_marshal</a> and <a href="https://docs.microsoft.com/windows/desktop/Midl/wire-marshal">wire_marshal</a>  types.
     */
    aUserMarshalQuadruple : USER_MARSHAL_ROUTINE_QUADRUPLE.Ptr

    /**
     * Array of notification function pointers for methods with the <a href="https://docs.microsoft.com/windows/desktop/Midl/notify">notify</a> or <a href="https://docs.microsoft.com/windows/desktop/Midl/notify-flag">notify_flag</a> attribute specified.
     */
    NotifyRoutineTable : IntPtr

    /**
     * Flag describing the attributes of the stub
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPCFLG_HAS_MULTI_SYNTAXES"></a><a id="rpcflg_has_multi_syntaxes"></a><dl>
     * <dt><b>RPCFLG_HAS_MULTI_SYNTAXES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if the stub supports multiple transfer syntaxes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPCFLG_HAS_CALLBACK"></a><a id="rpcflg_has_callback"></a><dl>
     * <dt><b>RPCFLG_HAS_CALLBACK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if the interface contains callback  functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_INTERFACE_HAS_PIPES"></a><a id="rpc_interface_has_pipes"></a><dl>
     * <dt><b>RPC_INTERFACE_HAS_PIPES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if the interface contains a method that uses pipes.
     * 
     * </td>
     * </tr>
     * </table>
     */
    mFlags : IntPtr

    /**
     * Unused.
     */
    CsRoutineTables : NDR_CS_ROUTINES.Ptr

    ProxyServerInfo : IntPtr

    pExprInfo : NDR_EXPR_DESC.Ptr

}
