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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsInTrustedVideoMode", "CanConstrict", "SetConstriction", "DisableImageExport"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrtrustedvideoplugin-isintrustedvideomode
     */
    IsInTrustedVideoMode() {
        result := ComCall(3, this, "int*", &pYes := 0, "HRESULT")
        return pYes
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrtrustedvideoplugin-canconstrict
     */
    CanConstrict() {
        result := ComCall(4, this, "int*", &pYes := 0, "HRESULT")
        return pYes
    }

    /**
     * 
     * @param {Integer} dwKPix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrtrustedvideoplugin-setconstriction
     */
    SetConstriction(dwKPix) {
        result := ComCall(5, this, "uint", dwKPix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bDisable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrtrustedvideoplugin-disableimageexport
     */
    DisableImageExport(bDisable) {
        result := ComCall(6, this, "int", bDisable, "HRESULT")
        return result
    }
}
