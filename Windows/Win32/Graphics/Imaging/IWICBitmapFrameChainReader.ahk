#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapFrameDecode.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapFrameChainReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapFrameChainReader
     * @type {Guid}
     */
    static IID => Guid("{0c599495-a120-4222-9130-a8c29410bd0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChainedFrameCount", "GetChainedFrame"]

    /**
     * 
     * @param {Integer} chainType 
     * @returns {Integer} 
     */
    GetChainedFrameCount(chainType) {
        result := ComCall(3, this, "int", chainType, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} chainType 
     * @param {Integer} index 
     * @returns {IWICBitmapFrameDecode} 
     */
    GetChainedFrame(chainType, index) {
        result := ComCall(4, this, "int", chainType, "uint", index, "ptr*", &ppIBitmapFrame := 0, "HRESULT")
        return IWICBitmapFrameDecode(ppIBitmapFrame)
    }
}
