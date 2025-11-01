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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetID", "GetPrice", "GetType", "GetContentCount", "GetContentPrice", "GetContentID"]

    /**
     * 
     * @param {Pointer<Integer>} pContentID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getid
     */
    GetID(pContentID) {
        pContentIDMarshal := pContentID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pContentIDMarshal, pContentID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPrice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getprice
     */
    GetPrice(pbstrPrice) {
        result := ComCall(4, this, "ptr", pbstrPrice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-gettype
     */
    GetType(pbstrType) {
        result := ComCall(5, this, "ptr", pbstrType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcContent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getcontentcount
     */
    GetContentCount(pcContent) {
        pcContentMarshal := pcContent is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pcContentMarshal, pcContent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idxContent 
     * @param {Pointer<BSTR>} pbstrPrice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getcontentprice
     */
    GetContentPrice(idxContent, pbstrPrice) {
        result := ComCall(7, this, "uint", idxContent, "ptr", pbstrPrice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idxContent 
     * @param {Pointer<Integer>} pContentID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/contentpartner/nf-contentpartner-iwmpcontentcontainer-getcontentid
     */
    GetContentID(idxContent, pContentID) {
        pContentIDMarshal := pContentID is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", idxContent, pContentIDMarshal, pContentID, "HRESULT")
        return result
    }
}
