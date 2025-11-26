#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DDevice9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DQuery9 interface to perform asynchronous queries on a driver.
 * @remarks
 * 
 * The LPDIRECT3DQUERY9 and PDIRECT3DQUERY9 types are defined as pointers to the <b>IDirect3DQuery9</b> interface.
 *     
 *             
 * 
 * 
 * ```
 * typedef struct IDirect3DQuery9 *LPDIRECT3DQUERY9, *PDIRECT3DQUERY9;
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dquery9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DQuery9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DQuery9
     * @type {Guid}
     */
    static IID => Guid("{d9771460-a695-4f26-bbd3-27b840b541cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "GetType", "GetDataSize", "Issue", "GetData"]

    /**
     * Gets the device that is being queried.
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Pointer to the device being queried. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dquery9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * Gets the query type.
     * @returns {Integer} Type: <b><a href="/windows/desktop/direct3d9/d3dquerytype">D3DQUERYTYPE</a></b>
     * 
     * Returns the query type. See <a href="/windows/desktop/direct3d9/d3dquerytype">D3DQUERYTYPE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dquery9-gettype
     */
    GetType() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Gets the number of bytes in the query data.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Returns the number of bytes of query data.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dquery9-getdatasize
     */
    GetDataSize() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * Issue a query.
     * @param {Integer} dwIssueFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Query flags specify the type of state change for the query. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dissue-begin">D3DISSUE_BEGIN</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dissue-end">D3DISSUE_END</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dquery9-issue
     */
    Issue(dwIssueFlags) {
        result := ComCall(6, this, "uint", dwIssueFlags, "HRESULT")
        return result
    }

    /**
     * Polls a queried resource to get the query state or a query result. For more information about queries, see Queries (Direct3D 9).
     * @param {Pointer<Void>} pData Type: <b>void*</b>
     * 
     * Pointer to a buffer containing the query data. The user is responsible for allocating this. <i>pData</i> may be <b>NULL</b> only if dwSize is 0.
     * @param {Integer} dwSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Number of bytes of data in <i>pData</i>. If you set dwSize to zero, you can use this method to poll the resource for the query status. See remarks.
     * @param {Integer} dwGetDataFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Data flags specifying the query type. Valid values are either 0 or <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dgetdata-flush">D3DGETDATA_FLUSH</a>. Use 0 to avoid flushing batched queries to the driver and use D3DGETDATA_FLUSH to go ahead and flush them. For applications writing their own version of waiting, a query result is not realized until the driver receives a flush.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * The return type identifies the query state (see <a href="/windows/desktop/direct3d9/queries">Queries (Direct3D 9)</a>). The method returns S_OK if the query data is available and S_FALSE if it is not.  These are considered successful return values. If the method fails when <a href="/windows/desktop/direct3d9/d3dgetdata-flush">D3DGETDATA_FLUSH</a> is used, the return value can be D3DERR_DEVICELOST.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dquery9-getdata
     */
    GetData(pData, dwSize, dwGetDataFlags) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, pDataMarshal, pData, "uint", dwSize, "uint", dwGetDataFlags, "HRESULT")
        return result
    }
}
