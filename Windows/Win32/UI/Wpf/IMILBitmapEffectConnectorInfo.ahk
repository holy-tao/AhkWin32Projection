#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve information about a specific input or output connector pin.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectconnectorinfo
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectConnectorInfo extends IUnknown{
    /**
     * The interface identifier for IMILBitmapEffectConnectorInfo
     * @type {Guid}
     */
    static IID => Guid("{f66d2e4b-b46b-42fc-859e-3da0ecdb3c43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} puiIndex 
     * @returns {HRESULT} 
     */
    GetIndex(puiIndex) {
        result := ComCall(3, this, "uint*", puiIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     */
    GetOptimalFormat(pFormat) {
        result := ComCall(4, this, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulNumberFormats 
     * @returns {HRESULT} 
     */
    GetNumberFormats(pulNumberFormats) {
        result := ComCall(5, this, "uint*", pulNumberFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     */
    GetFormat(ulIndex, pFormat) {
        result := ComCall(6, this, "uint", ulIndex, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
