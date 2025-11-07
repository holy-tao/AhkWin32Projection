#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Asynchronous.ahk

/**
 * A query interface queries information from the GPU.
 * @remarks
 * 
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
 * ... // Issue graphis commands, do whatever
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10query
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Query extends ID3D10Asynchronous{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Query
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c0e-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @param {Pointer<D3D10_QUERY_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10query-getdesc
     */
    GetDesc(pDesc) {
        ComCall(11, this, "ptr", pDesc)
    }
}
