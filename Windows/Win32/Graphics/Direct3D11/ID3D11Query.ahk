#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_QUERY_DESC.ahk" { D3D11_QUERY_DESC }
#Import ".\ID3D11Asynchronous.ahk" { ID3D11Asynchronous }

/**
 * A query interface queries information from the GPU. (ID3D11Query)
 * @remarks
 * A query can be created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createquery">ID3D11Device::CreateQuery</a>.
 * 
 * Query data is typically gathered by issuing an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> command, issuing some graphics commands, issuing an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a> command, and then calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> to get data about what happened in between the Begin and End calls. The data returned by <b>GetData</b> will be different depending on the type of query.
 * 
 * There are, however, some queries that do not require calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">Begin</a>. For a list of possible queries see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query">D3D11_QUERY</a>.
 * 
 * A query is typically executed as shown in the following code:
 * 
 * 
 * ```
 * 
 * 
 * D3D11_QUERY_DESC queryDesc;
 * ... // Fill out queryDesc structure
 * ID3D11Query * pQuery;
 * pDevice->CreateQuery(&queryDesc, &pQuery);
 * pDeviceContext->Begin(pQuery);
 * 
 * ... // Issue graphics commands
 * 
 * pDeviceContext->End(pQuery);
 * UINT64 queryData; // This data type is different depending on the query type
 * 
 * while( S_OK != pDeviceContext->GetData(pQuery, &queryData, sizeof(UINT64), 0) )
 * {
 * }
 * 
 * ```
 * 
 * 
 * When using a query that does not require a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">Begin</a>, it still requires a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">End</a>. The call to <b>End</b> causes the data returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">GetData</a> to be accurate up until the last call to <b>End</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11query
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Query extends ID3D11Asynchronous {
    /**
     * The interface identifier for ID3D11Query
     * @type {Guid}
     */
    static IID := Guid("{d6c00747-87b7-425e-b84d-44d108560afd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Query interfaces
    */
    struct Vtbl extends ID3D11Asynchronous.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Query.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a query description. (ID3D11Query.GetDesc)
     * @param {Pointer<D3D11_QUERY_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>*</b>
     * 
     * Pointer to a query description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11query-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, D3D11_QUERY_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D11Query.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
    }
}
