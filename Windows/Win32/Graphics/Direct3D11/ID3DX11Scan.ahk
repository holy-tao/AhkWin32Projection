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
     * 
     * @param {Integer} Direction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11scan-setscandirection
     */
    SetScanDirection(Direction) {
        result := ComCall(3, this, "int", Direction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ElementType 
     * @param {Integer} OpCode 
     * @param {Integer} ElementScanSize 
     * @param {ID3D11UnorderedAccessView} pSrc 
     * @param {ID3D11UnorderedAccessView} pDst 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11scan-scan
     */
    Scan(ElementType, OpCode, ElementScanSize, pSrc, pDst) {
        result := ComCall(4, this, "int", ElementType, "int", OpCode, "uint", ElementScanSize, "ptr", pSrc, "ptr", pDst, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ElementType 
     * @param {Integer} OpCode 
     * @param {Integer} ElementScanSize 
     * @param {Integer} ElementScanPitch 
     * @param {Integer} ScanCount 
     * @param {ID3D11UnorderedAccessView} pSrc 
     * @param {ID3D11UnorderedAccessView} pDst 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11scan-multiscan
     */
    Multiscan(ElementType, OpCode, ElementScanSize, ElementScanPitch, ScanCount, pSrc, pDst) {
        result := ComCall(5, this, "int", ElementType, "int", OpCode, "uint", ElementScanSize, "uint", ElementScanPitch, "uint", ScanCount, "ptr", pSrc, "ptr", pDst, "HRESULT")
        return result
    }
}
