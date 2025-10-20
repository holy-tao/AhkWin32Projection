#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIDL_STUB_DESC structure is a MIDL-generated structure that contains information about the interface stub regarding RPC calls between the client and server.
 * @see https://docs.microsoft.com/windows/win32/api//rpcndr/ns-rpcndr-midl_stub_desc
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class MIDL_STUB_DESC extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * For a nonobject RPC interface on the server-side, it points to an RPC server interface structure. On the client-side, it points to an RPC client interface structure. It is null for an object interface.
     * @type {Pointer<Void>}
     */
    RpcInterfaceInformation {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Memory allocation function to be used by the stub. Set to <a href="https://msdn.microsoft.com/">midl_user_allocate</a> for nonobject interface and <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-ndroleallocate"> NdrOleAllocate</a> for object interface.
     * @type {Pointer<PFN_RPC_ALLOCATE>}
     */
    pfnAllocate {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Memory-free function to be used by the stub. Set to <a href="https://docs.microsoft.com/windows/desktop/Midl/midl-user-free-1">midl_user_free</a> for nonobject interface and <a href="https://docs.microsoft.com/windows/desktop/api/rpcndr/nf-rpcndr-ndrolefree"> NdrOleFree</a> for object interface.
     * @type {Pointer<PFN_RPC_FREE>}
     */
    pfnFree {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Pointer<Void>>}
     */
    pAutoHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Pointer<Void>>}
     */
    pPrimitiveHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<GENERIC_BINDING_INFO>}
     */
    pGenericBindingInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Array of context handle rundown functions.
     * @type {Pointer<Pointer<NDR_RUNDOWN>>}
     */
    apfnNdrRundownRoutines {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Array of function pointers to bind and unbind function pairs for the implicit generic handle.
     * @type {Pointer<GENERIC_BINDING_ROUTINE_PAIR>}
     */
    aGenericBindingRoutinePairs {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Array of function pointers to expression evaluator functions used to evaluate MIDL complex conformance and varying descriptions. For example, <a href="https://docs.microsoft.com/windows/desktop/Midl/size-is">size_is</a>(param1 + param2).
     * @type {Pointer<Pointer<EXPR_EVAL>>}
     */
    apfnExprEval {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Array of an array of function pointers for user-defined <a href="https://docs.microsoft.com/windows/desktop/Midl/transmit-as">transmit_as</a> and <a href="https://msdn.microsoft.com/">represent_as</a>  types.
     * @type {Pointer<XMIT_ROUTINE_QUINTUPLE>}
     */
    aXmitQuintuple {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the type format description.
     * @type {Pointer<Integer>}
     */
    pFormatTypes {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Flag describing the user-specified <a href="https://docs.microsoft.com/windows/desktop/Midl/-error">/error</a> MIDL compiler option.
     * @type {Integer}
     */
    fCheckBounds {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * NDR version required for the stub.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Pointer to the MALLOC_FREE_STRUCT structure which contains the allocate and free function pointers. Use if the <a href="https://docs.microsoft.com/windows/desktop/Midl/enable-allocate">enable_allocate</a> MIDL attribute is specified.
     * @type {Pointer<MALLOC_FREE_STRUCT>}
     */
    pMallocFreeStruct {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Version of the MIDL compiler used to compile the .idl file.
     * @type {Integer}
     */
    MIDLVersion {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Array of stack offsets for parameters with <a href="https://docs.microsoft.com/windows/desktop/Midl/comm-status">comm_status</a> or <a href="https://msdn.microsoft.com/">fault_status</a> attributes.
     * @type {Pointer<COMM_FAULT_OFFSETS>}
     */
    CommFaultOffsets {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Array of an array of function pointers for user-defined <a href="https://docs.microsoft.com/windows/desktop/Midl/user-marshal">user_marshal</a> and <a href="https://docs.microsoft.com/windows/desktop/Midl/wire-marshal">wire_marshal</a>  types.
     * @type {Pointer<USER_MARSHAL_ROUTINE_QUADRUPLE>}
     */
    aUserMarshalQuadruple {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Array of notification function pointers for methods with the <a href="https://docs.microsoft.com/windows/desktop/Midl/notify">notify</a> or <a href="https://docs.microsoft.com/windows/desktop/Midl/notify-flag">notify_flag</a> attribute specified.
     * @type {Pointer<Pointer<NDR_NOTIFY_ROUTINE>>}
     */
    NotifyRoutineTable {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

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
     * @type {Pointer}
     */
    mFlags {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Unused.
     * @type {Pointer<NDR_CS_ROUTINES>}
     */
    CsRoutineTables {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * 
     * @type {Pointer<Void>}
     */
    ProxyServerInfo {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * 
     * @type {Pointer<NDR_EXPR_DESC>}
     */
    pExprInfo {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
