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
     * 
     * @returns {IDirect3DDevice9} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dquery9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dquery9-gettype
     */
    GetType() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dquery9-getdatasize
     */
    GetDataSize() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwIssueFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dquery9-issue
     */
    Issue(dwIssueFlags) {
        result := ComCall(6, this, "uint", dwIssueFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pData 
     * @param {Integer} dwSize 
     * @param {Integer} dwGetDataFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dquery9-getdata
     */
    GetData(pData, dwSize, dwGetDataFlags) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, pDataMarshal, pData, "uint", dwSize, "uint", dwGetDataFlags, "HRESULT")
        return result
    }
}
