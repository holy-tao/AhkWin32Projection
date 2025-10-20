#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMColorLegalizerProps extends IUnknown{
    /**
     * The interface identifier for IWMColorLegalizerProps
     * @type {Guid}
     */
    static IID => Guid("{776c93b3-b72d-4508-b6d0-208785f553e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lquality 
     * @returns {HRESULT} 
     */
    SetColorLegalizerQuality(lquality) {
        result := ComCall(3, this, "int", lquality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
