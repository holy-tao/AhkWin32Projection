#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaImageFilter extends IUnknown{
    /**
     * The interface identifier for IWiaImageFilter
     * @type {Guid}
     */
    static IID => Guid("{a8a79ffa-450b-41f1-8f87-849ccd94ebf6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWiaItem2>} pWiaItem2 
     * @param {Pointer<IWiaTransferCallback>} pWiaTransferCallback 
     * @returns {HRESULT} 
     */
    InitializeFilter(pWiaItem2, pWiaTransferCallback) {
        result := ComCall(3, this, "ptr", pWiaItem2, "ptr", pWiaTransferCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWiaTransferCallback>} pWiaTransferCallback 
     * @returns {HRESULT} 
     */
    SetNewCallback(pWiaTransferCallback) {
        result := ComCall(4, this, "ptr", pWiaTransferCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWiaItem2>} pWiaChildItem2 
     * @param {RECT} InputImageExtents 
     * @param {Pointer<IStream>} pInputStream 
     * @returns {HRESULT} 
     */
    FilterPreviewImage(lFlags, pWiaChildItem2, InputImageExtents, pInputStream) {
        result := ComCall(5, this, "int", lFlags, "ptr", pWiaChildItem2, "ptr", InputImageExtents, "ptr", pInputStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWiaPropertyStorage>} pWiaPropertyStorage 
     * @returns {HRESULT} 
     */
    ApplyProperties(pWiaPropertyStorage) {
        result := ComCall(6, this, "ptr", pWiaPropertyStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
