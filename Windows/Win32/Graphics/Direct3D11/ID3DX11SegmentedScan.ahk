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
     * 
     * @param {Integer} Direction 
     * @returns {HRESULT} 
     */
    SetScanDirection(Direction) {
        result := ComCall(3, this, "int", Direction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ElementType 
     * @param {Integer} OpCode 
     * @param {Integer} ElementScanSize 
     * @param {Pointer<ID3D11UnorderedAccessView>} pSrc 
     * @param {Pointer<ID3D11UnorderedAccessView>} pSrcElementFlags 
     * @param {Pointer<ID3D11UnorderedAccessView>} pDst 
     * @returns {HRESULT} 
     */
    SegScan(ElementType, OpCode, ElementScanSize, pSrc, pSrcElementFlags, pDst) {
        result := ComCall(4, this, "int", ElementType, "int", OpCode, "uint", ElementScanSize, "ptr", pSrc, "ptr", pSrcElementFlags, "ptr", pDst, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
