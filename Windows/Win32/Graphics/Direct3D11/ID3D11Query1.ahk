#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11Query.ahk" { ID3D11Query }
#Import ".\D3D11_QUERY_DESC1.ahk" { D3D11_QUERY_DESC1 }

/**
 * Represents a query object for querying information from the graphics processing unit (GPU).
 * @remarks
 * A query can be created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createquery1">ID3D11Device3::CreateQuery1</a>.
 * 
 * Query data is typically gathered by issuing an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> command, issuing some graphics commands, issuing an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a> command, and then calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> to get data about what happened in between the Begin and End calls. The data returned by <b>GetData</b> will be different depending on the type of query.
 * 
 * There are, however, some queries that do not require calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">Begin</a>. For a list of possible queries see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query">D3D11_QUERY</a>.
 * 
 * When using a query that does not require a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">Begin</a>, it still requires a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">End</a>. The call to <b>End</b> causes the data returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">GetData</a> to be accurate up until the last call to <b>End</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11query1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Query1 extends ID3D11Query {
    /**
     * The interface identifier for ID3D11Query1
     * @type {Guid}
     */
    static IID := Guid("{631b4766-36dc-461d-8db6-c47e13e60916}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Query1 interfaces
    */
    struct Vtbl extends ID3D11Query.Vtbl {
        GetDesc1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Query1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a query description.
     * @param {Pointer<D3D11_QUERY_DESC1>} pDesc1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-d3d11_query_desc1">D3D11_QUERY_DESC1</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-d3d11_query_desc1">D3D11_QUERY_DESC1</a> structure that receives a description of the query.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11query1-getdesc1
     */
    GetDesc1(pDesc1) {
        ComCall(9, this, D3D11_QUERY_DESC1.Ptr, pDesc1)
    }

    Query(iid) {
        if (ID3D11Query1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc1 := CallbackCreate(GetMethod(implObj, "GetDesc1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc1)
    }
}
