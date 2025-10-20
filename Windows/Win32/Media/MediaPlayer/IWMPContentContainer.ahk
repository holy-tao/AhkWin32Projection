#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://docs.microsoft.com/windows/win32/api//contentpartner/nn-contentpartner-iwmpcontentcontainer
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPContentContainer extends IUnknown{
    /**
     * The interface identifier for IWMPContentContainer
     * @type {Guid}
     */
    static IID => Guid("{ad7f4d9c-1a9f-4ed2-9815-ecc0b58cb616}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pContentID 
     * @returns {HRESULT} 
     */
    GetID(pContentID) {
        result := ComCall(3, this, "uint*", pContentID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPrice 
     * @returns {HRESULT} 
     */
    GetPrice(pbstrPrice) {
        result := ComCall(4, this, "ptr", pbstrPrice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     */
    GetType(pbstrType) {
        result := ComCall(5, this, "ptr", pbstrType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcContent 
     * @returns {HRESULT} 
     */
    GetContentCount(pcContent) {
        result := ComCall(6, this, "uint*", pcContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idxContent 
     * @param {Pointer<BSTR>} pbstrPrice 
     * @returns {HRESULT} 
     */
    GetContentPrice(idxContent, pbstrPrice) {
        result := ComCall(7, this, "uint", idxContent, "ptr", pbstrPrice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idxContent 
     * @param {Pointer<UInt32>} pContentID 
     * @returns {HRESULT} 
     */
    GetContentID(idxContent, pContentID) {
        result := ComCall(8, this, "uint", idxContent, "uint*", pContentID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
