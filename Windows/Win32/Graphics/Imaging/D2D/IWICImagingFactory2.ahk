#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IWICImagingFactory.ahk

/**
 * An extension of the WIC factory interface that includes the ability to create an IWICImageEncoder.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicimagingfactory2
 * @namespace Windows.Win32.Graphics.Imaging.D2D
 * @version v4.0.30319
 */
class IWICImagingFactory2 extends IWICImagingFactory{
    /**
     * The interface identifier for IWICImagingFactory2
     * @type {Guid}
     */
    static IID => Guid("{7b816b45-1996-4476-b132-de9e247c8af0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * 
     * @param {Pointer<ID2D1Device>} pD2DDevice 
     * @param {Pointer<IWICImageEncoder>} ppWICImageEncoder 
     * @returns {HRESULT} 
     */
    CreateImageEncoder(pD2DDevice, ppWICImageEncoder) {
        result := ComCall(28, this, "ptr", pD2DDevice, "ptr", ppWICImageEncoder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
