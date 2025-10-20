#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Asynchronous.ahk

/**
 * A query interface queries information from the GPU.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11query
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Query extends ID3D11Asynchronous{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Query
     * @type {Guid}
     */
    static IID => Guid("{d6c00747-87b7-425e-b84d-44d108560afd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @param {Pointer<D3D11_QUERY_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11query-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, "ptr", pDesc)
    }
}
