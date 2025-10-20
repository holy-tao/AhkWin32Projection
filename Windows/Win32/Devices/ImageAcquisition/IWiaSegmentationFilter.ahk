#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaSegmentationFilter extends IUnknown{
    /**
     * The interface identifier for IWiaSegmentationFilter
     * @type {Guid}
     */
    static IID => Guid("{ec46a697-ac04-4447-8f65-ff63d5154b21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IStream>} pInputStream 
     * @param {Pointer<IWiaItem2>} pWiaItem2 
     * @returns {HRESULT} 
     */
    DetectRegions(lFlags, pInputStream, pWiaItem2) {
        result := ComCall(3, this, "int", lFlags, "ptr", pInputStream, "ptr", pWiaItem2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
