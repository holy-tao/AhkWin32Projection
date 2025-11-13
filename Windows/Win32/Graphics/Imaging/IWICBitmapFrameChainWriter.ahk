#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapFrameEncode.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapFrameChainWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapFrameChainWriter
     * @type {Guid}
     */
    static IID => Guid("{40d9ea28-4768-47b3-8c12-558a48e98e38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AppendFrameToChain", "DoesSupportChainType"]

    /**
     * 
     * @param {Integer} chainType 
     * @param {Pointer<IPropertyBag2>} ppIEncoderOptions 
     * @returns {IWICBitmapFrameEncode} 
     */
    AppendFrameToChain(chainType, ppIEncoderOptions) {
        result := ComCall(3, this, "int", chainType, "ptr*", &ppIFrameEncode := 0, "ptr*", ppIEncoderOptions, "HRESULT")
        return IWICBitmapFrameEncode(ppIFrameEncode)
    }

    /**
     * 
     * @param {Integer} chainType 
     * @returns {BOOL} 
     */
    DoesSupportChainType(chainType) {
        result := ComCall(4, this, "int", chainType, "int*", &pfIsSupported := 0, "HRESULT")
        return pfIsSupported
    }
}
