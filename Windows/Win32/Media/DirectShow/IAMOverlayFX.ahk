#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMOverlayFX interface controls how the video overlay appears on the user's screen. The Overlay Mixer filter implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamoverlayfx
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMOverlayFX extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMOverlayFX
     * @type {Guid}
     */
    static IID => Guid("{62fae250-7e65-4460-bfc9-6398b322073c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryOverlayFXCaps", "SetOverlayFX", "GetOverlayFX"]

    /**
     * 
     * @param {Pointer<Integer>} lpdwOverlayFXCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamoverlayfx-queryoverlayfxcaps
     */
    QueryOverlayFXCaps(lpdwOverlayFXCaps) {
        lpdwOverlayFXCapsMarshal := lpdwOverlayFXCaps is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, lpdwOverlayFXCapsMarshal, lpdwOverlayFXCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOverlayFX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamoverlayfx-setoverlayfx
     */
    SetOverlayFX(dwOverlayFX) {
        result := ComCall(4, this, "uint", dwOverlayFX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpdwOverlayFX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamoverlayfx-getoverlayfx
     */
    GetOverlayFX(lpdwOverlayFX) {
        lpdwOverlayFXMarshal := lpdwOverlayFX is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, lpdwOverlayFXMarshal, lpdwOverlayFX, "HRESULT")
        return result
    }
}
