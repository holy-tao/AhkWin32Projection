#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumMediaTypes interface enumerates a pin's preferred media types.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ienummediatypes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumMediaTypes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumMediaTypes
     * @type {Guid}
     */
    static IID => Guid("{89c31040-846b-11ce-97d3-00aa0055595a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cMediaTypes 
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppMediaTypes 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienummediatypes-next
     */
    Next(cMediaTypes, ppMediaTypes, pcFetched) {
        result := ComCall(3, this, "uint", cMediaTypes, "ptr*", ppMediaTypes, "uint*", pcFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cMediaTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienummediatypes-skip
     */
    Skip(cMediaTypes) {
        result := ComCall(4, this, "uint", cMediaTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienummediatypes-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMediaTypes>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienummediatypes-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
