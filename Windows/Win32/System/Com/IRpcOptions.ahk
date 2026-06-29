#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RPCOPT_PROPERTIES.ahk" { RPCOPT_PROPERTIES }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IRpcOptions (objidlbase.h) interface enables callers to set or query the values of various properties that control how COM handles remote procedure calls (RPC).
 * @remarks
 * Using this interface, callers can set or query the COMBND_RPCTIMEOUT property, which controls how long your machine will attempt to establish RPC communications with another before failing. The property can have any one of the values enumerated in the following table.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>RPC_C_BINDING_INFINITE_TIMEOUT
 * </td>
 * <td>Keep trying to establish communications with no timeout.
 * </td>
 * </tr>
 * <tr>
 * <td>RPC_C_BINDING_MIN_TIMEOUT
 * </td>
 * <td>Try to establish communications for the minimum time required by the protocol. This value favors performance over reliability.</td>
 * </tr>
 * <tr>
 * <td>RPC_C_BINDING_DEFAULT_TIMEOUT
 * </td>
 * <td>Try to establish communications for the default time. The value strikes a balance between performance and reliability.</td>
 * </tr>
 * <tr>
 * <td>RPC_C_BINDING_MAX_TIMEOUT
 * </td>
 * <td>Try to establish communications for the maximum time allowed by the protocol. This value favors reliability over performance.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-irpcoptions
 * @namespace Windows.Win32.System.Com
 */
export default struct IRpcOptions extends IUnknown {
    /**
     * The interface identifier for IRpcOptions
     * @type {Guid}
     */
    static IID := Guid("{00000144-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRpcOptions interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Set   : IntPtr
        Query : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRpcOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IRpcOptions::Set (objidlbase.h) method sets the value of an RPC binding option property.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcoptions">IRpcOptions</a> for a table of the possible values of the COMBND_RPCTIMEOUT property.
     * @param {IUnknown} pPrx A pointer to the proxy whose property is being set.
     * @param {RPCOPT_PROPERTIES} dwProperty An identifier of the property to be set, which must be COMBND_RPCTIMEOUT.
     * @param {Pointer} dwValue The new value of the property.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcoptions-set
     */
    Set(pPrx, dwProperty, dwValue) {
        result := ComCall(3, this, "ptr", pPrx, RPCOPT_PROPERTIES, dwProperty, "ptr", dwValue, "HRESULT")
        return result
    }

    /**
     * The IRpcOptions::Query (objidlbase.h) method retrieves the value of an RPC binding option property.
     * @remarks
     * While the COMBND_RPCTIMEOUT property can also be set using the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irpcoptions-set">Set</a> method, the COMBND_SERVER_LOCALITY property can only be queried.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcoptions">IRpcOptions</a> for a table of the possible values of the COMBND_RPCTIMEOUT property.
     * 
     * The possible values of the COMBND_SERVER_LOCALITY property, which describes the degree of remoteness of the RPC connection, are enumerated in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>SERVER_LOCALITY_PROCESS_LOCAL
     * </td>
     * <td>The counterpart is in the same process as the client.
     * </td>
     * </tr>
     * <tr>
     * <td>SERVER_LOCALITY_MACHINE_LOCAL
     * </td>
     * <td>The counterpart is on the same computer as the client but in a different process.
     * </td>
     * </tr>
     * <tr>
     * <td>SERVER_LOCALITY_REMOTE
     * </td>
     * <td>The counterpart is on a remote computer.
     * </td>
     * </tr>
     * </table>
     * @param {IUnknown} pPrx A pointer to the proxy whose property is being queried.
     * @param {RPCOPT_PROPERTIES} dwProperty An identifier of the property to be queried, which must be COMBND_RPCTIMEOUT or COMBND_SERVER_LOCALITY (this flag is available starting with Windows Server 2003.)
     * @returns {Pointer} A pointer to the property value.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcoptions-query
     */
    Query(pPrx, dwProperty) {
        result := ComCall(4, this, "ptr", pPrx, RPCOPT_PROPERTIES, dwProperty, "ptr*", &pdwValue := 0, "HRESULT")
        return pdwValue
    }

    Query(iid) {
        if (IRpcOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Set := CallbackCreate(GetMethod(implObj, "Set"), flags, 4)
        this.vtbl.Query := CallbackCreate(GetMethod(implObj, "Query"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Set)
        CallbackFree(this.vtbl.Query)
    }
}
