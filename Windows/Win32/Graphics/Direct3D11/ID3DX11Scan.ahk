#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Scan context.
 * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nn-d3dcsx-id3dx11scan
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3DX11Scan extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DX11Scan
     * @type {Guid}
     */
    static IID => Guid("{5089b68f-e71d-4d38-be8e-f363b95a9405}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetScanDirection", "Scan", "Multiscan"]

    /**
     * Sets which direction to perform scans in.
     * @param {Integer} Direction Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_direction">D3DX11_SCAN_DIRECTION</a></b>
     * 
     * Direction to perform scans in.  See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_direction">D3DX11_SCAN_DIRECTION</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11scan-setscandirection
     */
    SetScanDirection(Direction) {
        result := ComCall(3, this, "int", Direction, "HRESULT")
        return result
    }

    /**
     * Performs an unsegmented scan of a sequence.
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
     * @param {ID3D11UnorderedAccessView} pDst Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Output sequence on the device.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11scan-scan
     */
    Scan(ElementType, OpCode, ElementScanSize, pSrc, pDst) {
        result := ComCall(4, this, "int", ElementType, "int", OpCode, "uint", ElementScanSize, "ptr", pSrc, "ptr", pDst, "HRESULT")
        return result
    }

    /**
     * Performs a multiscan of a sequence.
     * @param {Integer} ElementType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE</a></b>
     * 
     * The type of element in the sequence.  See <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type">D3DX11_SCAN_DATA_TYPE</a> for more information.
     * @param {Integer} OpCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode">D3DX11_SCAN_OPCODE</a></b>
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11scan-multiscan
     */
    Multiscan(ElementType, OpCode, ElementScanSize, ElementScanPitch, ScanCount, pSrc, pDst) {
        result := ComCall(5, this, "int", ElementType, "int", OpCode, "uint", ElementScanSize, "uint", ElementScanPitch, "uint", ScanCount, "ptr", pSrc, "ptr", pDst, "HRESULT")
        return result
    }
}
