#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a plug-in component for the enhanced video renderer (EVR) to work with protected media.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-ievrtrustedvideoplugin
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IEVRTrustedVideoPlugin extends IUnknown{
    /**
     * The interface identifier for IEVRTrustedVideoPlugin
     * @type {Guid}
     */
    static IID => Guid("{83a4ce40-7710-494b-a893-a472049af630}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pYes 
     * @returns {HRESULT} 
     */
    IsInTrustedVideoMode(pYes) {
        result := ComCall(3, this, "ptr", pYes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pYes 
     * @returns {HRESULT} 
     */
    CanConstrict(pYes) {
        result := ComCall(4, this, "ptr", pYes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwKPix 
     * @returns {HRESULT} 
     */
    SetConstriction(dwKPix) {
        result := ComCall(5, this, "uint", dwKPix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bDisable 
     * @returns {HRESULT} 
     */
    DisableImageExport(bDisable) {
        result := ComCall(6, this, "int", bDisable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
