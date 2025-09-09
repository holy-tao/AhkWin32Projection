#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPC_BINDING_VECTOR structure contains a list of binding handles over which a server application can receive remote procedure calls.
 * @remarks
 * The binding vector contains a count member (<b>Count</b>), followed by an array of binding-handle (<b>BindingH</b>) elements.
  * 
  * The RPC run-time library creates binding handles when a server application registers protocol sequences. To obtain a binding vector, a server application calls 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcserverinqbindings">RpcServerInqBindings</a>.
  * 
  * A client application obtains a binding vector of compatible servers from the name-service database by calling 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcnsi/nf-rpcnsi-rpcnsbindinglookupnext">RpcNsBindingLookupNext</a>.
  * 
  * In both routines, the RPC run-time library allocates memory for the binding vector. An application calls 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingvectorfree">RpcBindingVectorFree</a> to free the binding vector.
  * 
  * To remove an individual binding handle from the vector, the application must set the value in the vector to <b>NULL</b>. When setting a vector element to <b>NULL</b>, the application must:
  * 
  * <ul>
  * <li>Free the individual binding.</li>
  * <li>Not change the value of <b>Count</b>.</li>
  * </ul>
  * Calling 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingfree">RpcBindingFree</a> allows an application to free all binding handles in the vector.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_binding_vector
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_BINDING_VECTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of binding handles present in the binding-handle array <b>BindingH</b>.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of binding handles that contains <b>Count</b> elements.
     * @type {Array<Void>}
     */
    BindingH{
        get {
            if(!this.HasProp("__BindingHProxyArray"))
                this.__BindingHProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__BindingHProxyArray
        }
    }
}
