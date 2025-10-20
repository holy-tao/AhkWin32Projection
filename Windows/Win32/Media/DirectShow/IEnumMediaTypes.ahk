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
     * 
     * @param {Integer} cMediaTypes 
     * @param {Pointer<AM_MEDIA_TYPE>} ppMediaTypes 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cMediaTypes, ppMediaTypes, pcFetched) {
        result := ComCall(3, this, "uint", cMediaTypes, "ptr", ppMediaTypes, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cMediaTypes 
     * @returns {HRESULT} 
     */
    Skip(cMediaTypes) {
        result := ComCall(4, this, "uint", cMediaTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMediaTypes>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
