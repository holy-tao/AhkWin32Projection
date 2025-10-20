#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaPreview extends IUnknown{
    /**
     * The interface identifier for IWiaPreview
     * @type {Guid}
     */
    static IID => Guid("{95c2b4fd-33f2-4d86-ad40-9431f0df08f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWiaItem2>} pWiaItem2 
     * @param {Pointer<IWiaTransferCallback>} pWiaTransferCallback 
     * @returns {HRESULT} 
     */
    GetNewPreview(lFlags, pWiaItem2, pWiaTransferCallback) {
        result := ComCall(3, this, "int", lFlags, "ptr", pWiaItem2, "ptr", pWiaTransferCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWiaItem2>} pChildWiaItem2 
     * @param {Pointer<IWiaTransferCallback>} pWiaTransferCallback 
     * @returns {HRESULT} 
     */
    UpdatePreview(lFlags, pChildWiaItem2, pWiaTransferCallback) {
        result := ComCall(4, this, "int", lFlags, "ptr", pChildWiaItem2, "ptr", pWiaTransferCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    DetectRegions(lFlags) {
        result := ComCall(5, this, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
