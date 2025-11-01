#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaImageFilter extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFilter", "SetNewCallback", "FilterPreviewImage", "ApplyProperties"]

    /**
     * 
     * @param {IWiaItem2} pWiaItem2 
     * @param {IWiaTransferCallback} pWiaTransferCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter-initializefilter
     */
    InitializeFilter(pWiaItem2, pWiaTransferCallback) {
        result := ComCall(3, this, "ptr", pWiaItem2, "ptr", pWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWiaTransferCallback} pWiaTransferCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter-setnewcallback
     */
    SetNewCallback(pWiaTransferCallback) {
        result := ComCall(4, this, "ptr", pWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IWiaItem2} pWiaChildItem2 
     * @param {RECT} InputImageExtents 
     * @param {IStream} pInputStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter-filterpreviewimage
     */
    FilterPreviewImage(lFlags, pWiaChildItem2, InputImageExtents, pInputStream) {
        result := ComCall(5, this, "int", lFlags, "ptr", pWiaChildItem2, "ptr", InputImageExtents, "ptr", pInputStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWiaPropertyStorage} pWiaPropertyStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter-applyproperties
     */
    ApplyProperties(pWiaPropertyStorage) {
        result := ComCall(6, this, "ptr", pWiaPropertyStorage, "HRESULT")
        return result
    }
}
