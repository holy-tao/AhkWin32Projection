#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10Asynchronous.ahk" { ID3D10Asynchronous }
#Import ".\D3D10_QUERY_DESC.ahk" { D3D10_QUERY_DESC }

/**
 * A query interface queries information from the GPU. (ID3D10Query)
 * @remarks
 * A query can be created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createquery">ID3D10Device::CreateQuery</a>.
 * 
 * This interface inherits the functionality of an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10asynchronous">ID3D10Asynchronous Interface</a>.
 * 
 * Query data is typically gathered by issuing an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">ID3D10Asynchronous::Begin</a> command, issuing some graphics commands, issuing an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-end">ID3D10Asynchronous::End</a> command, and then calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> to get data about what happened in between the Begin and End calls. The data returned by GetData will be different depending on the type of query.
 * 
 * There are, however, some queries that do not require calls to Begin. For a list of possible queries see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_query">D3D10_QUERY</a>.
 * 
 * A query is typically executed as shown in the following code:
 * 
 * 
 * ```
 * D3D10_QUERY_DESC queryDesc;
 * 
 * ... // Fill out queryDesc structure
 * 
 * ID3D10Query * pQuery;
 * pDevice->CreateQuery(&queryDesc, &pQuery);
 * 
 * pQuery->Begin();
 * 
 * ... // Issue graphics commands, do whatever
 * 
 * pQuery->End();
 * 
 * UINT64 queryData; // This data type is different depending on the query type
 * 
 * while( S_OK != pQuery->GetData(&queryData, sizeof(UINT64), 0) )
 * {
 * }
 * 
 * ```
 * 
 * 
 * When using a query that does not require a call to Begin, it still requires a call to End. The call to End causes the data returned by GetData to be accurate up until the last call to End.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10query
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10Query extends ID3D10Asynchronous {
    /**
     * The interface identifier for ID3D10Query
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c0e-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10Query interfaces
    */
    struct Vtbl extends ID3D10Asynchronous.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10Query.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a query description. (ID3D10Query.GetDesc)
     * @param {Pointer<D3D10_QUERY_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_desc">D3D10_QUERY_DESC</a>*</b>
     * 
     * Pointer to a query description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_desc">D3D10_QUERY_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10query-getdesc
     */
    GetDesc(pDesc) {
        ComCall(11, this, D3D10_QUERY_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10Query.IID.Equals(iid)) {
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
