#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Segmented scan context.
 * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nn-d3dcsx-id3dx11segmentedscan
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
     * 
     * @param {Integer} Direction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11segmentedscan-setscandirection
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
     * @param {ID3D11UnorderedAccessView} pSrcElementFlags 
     * @param {ID3D11UnorderedAccessView} pDst 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11segmentedscan-segscan
     */
    SegScan(ElementType, OpCode, ElementScanSize, pSrc, pSrcElementFlags, pDst) {
        result := ComCall(4, this, "int", ElementType, "int", OpCode, "uint", ElementScanSize, "ptr", pSrc, "ptr", pSrcElementFlags, "ptr", pDst, "HRESULT")
        return result
    }
}
