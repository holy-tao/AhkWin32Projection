#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSourceTransform.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapSourceTransform2 extends IWICBitmapSourceTransform{
    /**
     * The interface identifier for IWICBitmapSourceTransform2
     * @type {Guid}
     */
    static IID => Guid("{c3373fdf-6d39-4e5f-8e79-bf40c0b7ed77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Guid>} pPixelFormat 
     * @param {Integer} cCount 
     * @param {Pointer<IWICColorContext>} ppIColorContexts 
     * @param {Pointer<UInt32>} pcActualCount 
     * @returns {HRESULT} 
     */
    GetColorContextsForPixelFormat(pPixelFormat, cCount, ppIColorContexts, pcActualCount) {
        result := ComCall(7, this, "ptr", pPixelFormat, "uint", cCount, "ptr", ppIColorContexts, "uint*", pcActualCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
