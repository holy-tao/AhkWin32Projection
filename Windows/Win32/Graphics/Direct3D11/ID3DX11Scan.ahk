#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3DX11_SCAN_DIRECTION.ahk" { D3DX11_SCAN_DIRECTION }
#Import ".\D3DX11_SCAN_DATA_TYPE.ahk" { D3DX11_SCAN_DATA_TYPE }
#Import ".\D3DX11_SCAN_OPCODE.ahk" { D3DX11_SCAN_OPCODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D11UnorderedAccessView.ahk" { ID3D11UnorderedAccessView }

/**
 * Scan context.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nn-d3dcsx-id3dx11scan
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3DX11Scan extends IUnknown {
    /**
     * The interface identifier for ID3DX11Scan
     * @type {Guid}
     */
    static IID := Guid("{5089b68f-e71d-4d38-be8e-f363b95a9405}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DX11Scan interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetScanDirection : IntPtr
        Scan             : IntPtr
        Multiscan        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DX11Scan.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets which direction to perform scans in. (ID3DX11Scan.SetScanDirection)
     * @remarks
     * <b>SetScanDirection</b> sets the direction <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11scan-scan">ID3DX11Scan::Scan</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11scan-multiscan">ID3DX11Scan::Multiscan</a> will performed scans in.
     * @param {D3DX11_SCAN_DIRECTION} _Direction Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_direction">D3DX11_SCAN_DIRECTION</a></b>
     * 
     * Direction to perform scans in.  See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_direction">D3DX11_SCAN_DIRECTION</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11scan-setscandirection
     */
    SetScanDirection(_Direction) {
        result := ComCall(3, this, D3DX11_SCAN_DIRECTION, _Direction, "HRESULT")
        return result
    }

    /**
     * Performs an unsegmented scan of a sequence.
     * @remarks
     * You must point the parameters <i>pSrc</i> and <i>pDst</i> to typed buffers (and not to raw or structured buffers). For information about buffer types, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-types">Types of Resources</a>. The format of these typed buffers must be <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R32_FLOAT</a>, <b>DXGI_FORMAT_R32_UINT</b>, or <b>DXGI_FORMAT_R32_INT</b>. In addition, the format of these typed buffers must match the scan data type that you specify in the <i>ElementType</i> parameter. For example, if the scan data type is <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE_UINT</a>, the buffer formats must be <b>DXGI_FORMAT_R32_UINT</b>.
     * @param {D3DX11_SCAN_DATA_TYPE} ElementType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE</a></b>
     * 
     * The type of element in the sequence.  See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE</a> for more information.
     * @param {D3DX11_SCAN_OPCODE} OpCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode">D3DX11_SCAN_OPCODE</a></b>
     * 
     * The binary operation to perform.  See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode">D3DX11_SCAN_OPCODE</a> for more information.
     * @param {Integer} ElementScanSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of scan in elements.
     * @param {ID3D11UnorderedAccessView} pSrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Input sequence on the device.  Set <i>pSrc</i> and <i>pDst</i> to the same value for in-place scans.
     * @param {ID3D11UnorderedAccessView} pDst Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Output sequence on the device.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11scan-scan
     */
    Scan(ElementType, OpCode, ElementScanSize, pSrc, pDst) {
        result := ComCall(4, this, D3DX11_SCAN_DATA_TYPE, ElementType, D3DX11_SCAN_OPCODE, OpCode, "uint", ElementScanSize, "ptr", pSrc, "ptr", pDst, "HRESULT")
        return result
    }

    /**
     * Performs a multiscan of a sequence.
     * @remarks
     * You must point the parameters <i>pSrc</i> and <i>pDst</i> to typed buffers (and not to raw or structured buffers). For information about buffer types, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-types">Types of Resources</a>. The format of these typed buffers must be <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R32_FLOAT</a>, <b>DXGI_FORMAT_R32_UINT</b>, or <b>DXGI_FORMAT_R32_INT</b>. In addition, the format of these typed buffers must match the scan data type that you specify in the <i>ElementType</i> parameter. For example, if the scan data type is <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE_UINT</a>, the buffer formats must be <b>DXGI_FORMAT_R32_UINT</b>.
     * @param {D3DX11_SCAN_DATA_TYPE} ElementType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE</a></b>
     * 
     * The type of element in the sequence.  See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE</a> for more information.
     * @param {D3DX11_SCAN_OPCODE} OpCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode">D3DX11_SCAN_OPCODE</a></b>
     * 
     * The binary operation to perform.  See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode">D3DX11_SCAN_OPCODE</a> for more information.
     * @param {Integer} ElementScanSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of scan in elements.
     * @param {Integer} ElementScanPitch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Pitch of the next scan in elements.
     * @param {Integer} ScanCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of scans in the multiscan.
     * @param {ID3D11UnorderedAccessView} pSrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Input sequence on the device.  Set <i>pSrc</i> and <i>pDst</i> to the same value for in-place scans.
     * @param {ID3D11UnorderedAccessView} pDst Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Output sequence on the device.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11scan-multiscan
     */
    Multiscan(ElementType, OpCode, ElementScanSize, ElementScanPitch, ScanCount, pSrc, pDst) {
        result := ComCall(5, this, D3DX11_SCAN_DATA_TYPE, ElementType, D3DX11_SCAN_OPCODE, OpCode, "uint", ElementScanSize, "uint", ElementScanPitch, "uint", ScanCount, "ptr", pSrc, "ptr", pDst, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3DX11Scan.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetScanDirection := CallbackCreate(GetMethod(implObj, "SetScanDirection"), flags, 2)
        this.vtbl.Scan := CallbackCreate(GetMethod(implObj, "Scan"), flags, 6)
        this.vtbl.Multiscan := CallbackCreate(GetMethod(implObj, "Multiscan"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetScanDirection)
        CallbackFree(this.vtbl.Scan)
        CallbackFree(this.vtbl.Multiscan)
    }
}
