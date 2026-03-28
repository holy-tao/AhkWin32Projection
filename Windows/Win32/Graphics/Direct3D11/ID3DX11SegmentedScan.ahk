#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Segmented scan context.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nn-d3dcsx-id3dx11segmentedscan
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3DX11SegmentedScan extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DX11SegmentedScan
     * @type {Guid}
     */
    static IID => Guid("{a915128c-d954-4c79-bfe1-64db923194d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetScanDirection", "SegScan"]

    /**
     * Sets which direction to perform scans in. (ID3DX11SegmentedScan.SetScanDirection)
     * @remarks
     * <b>SetScanDirection</b> sets the direction <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11segmentedscan-segscan">ID3DX11SegmentedScan::SegScan</a> will performed scans in.
     * @param {Integer} _Direction 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11segmentedscan-setscandirection
     */
    SetScanDirection(_Direction) {
        result := ComCall(3, this, "int", _Direction, "HRESULT")
        return result
    }

    /**
     * Performs a segmented scan of a sequence.
     * @remarks
     * You must point the parameters <i>pSrc</i> and <i>pDst</i> to typed buffers (and not to raw or structured buffers). For information about buffer types, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-types">Types of Resources</a>. The format of these typed buffers must be <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R32_FLOAT</a>, <b>DXGI_FORMAT_R32_UINT</b>, or <b>DXGI_FORMAT_R32_INT</b>. In addition, the format of these typed buffers must match the scan data type that you specify in the <i>ElementType</i> parameter. For example, if the scan data type is <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE_UINT</a>, the buffer formats must be <b>DXGI_FORMAT_R32_UINT</b>.
     * 
     * The format of the resource view to which the <i>pSrcElementFlags</i> parameter points must be <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R32_UINT</a>.
     * @param {Integer} ElementType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE</a></b>
     * 
     * The type of element in the sequence.  See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE</a> for more information.
     * @param {Integer} OpCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode">D3DX11_SCAN_OPCODE</a></b>
     * 
     * The binary operation to perform.  See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode">D3DX11_SCAN_OPCODE</a> for more information.
     * @param {Integer} ElementScanSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of scan in elements.
     * @param {ID3D11UnorderedAccessView} pSrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Input sequence on the device.  Set <i>pSrc</i> and <i>pDst</i> to the same value for in-place scans.
     * @param {ID3D11UnorderedAccessView} pSrcElementFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Compact array of bits with one bit per element of <i>pSrc</i>.  A set value indicates the start of a new segment.
     * @param {ID3D11UnorderedAccessView} pDst Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Output sequence on the device.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11segmentedscan-segscan
     */
    SegScan(ElementType, OpCode, ElementScanSize, pSrc, pSrcElementFlags, pDst) {
        result := ComCall(4, this, "int", ElementType, "int", OpCode, "uint", ElementScanSize, "ptr", pSrc, "ptr", pSrcElementFlags, "ptr", pDst, "HRESULT")
        return result
    }
}
