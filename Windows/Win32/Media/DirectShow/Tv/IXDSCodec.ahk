#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IXDSCodec interface is exposed by the XDS Codec filter. Most applications will not have to use this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IXDSCodec)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-ixdscodec
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IXDSCodec extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXDSCodec
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4b3-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The class identifier for XDSCodec
     * @type {Guid}
     */
    static CLSID => Guid("{c4c4c4f3-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XDSToRatObjOK", "put_CCSubstreamService", "get_CCSubstreamService", "GetContentAdvisoryRating", "GetXDSPacket", "GetCurrLicenseExpDate", "GetLastErrorCode"]

    /**
     * 
     * @param {Pointer<HRESULT>} pHrCoCreateRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ixdscodec-get_xdstoratobjok
     */
    get_XDSToRatObjOK(pHrCoCreateRetVal) {
        result := ComCall(3, this, "ptr", pHrCoCreateRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SubstreamMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ixdscodec-put_ccsubstreamservice
     */
    put_CCSubstreamService(SubstreamMask) {
        result := ComCall(4, this, "int", SubstreamMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSubstreamMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ixdscodec-get_ccsubstreamservice
     */
    get_CCSubstreamService(pSubstreamMask) {
        result := ComCall(5, this, "int*", pSubstreamMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRat 
     * @param {Pointer<Integer>} pPktSeqID 
     * @param {Pointer<Integer>} pCallSeqID 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ixdscodec-getcontentadvisoryrating
     */
    GetContentAdvisoryRating(pRat, pPktSeqID, pCallSeqID, pTimeStart, pTimeEnd) {
        result := ComCall(6, this, "int*", pRat, "int*", pPktSeqID, "int*", pCallSeqID, "int64*", pTimeStart, "int64*", pTimeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pXDSClassPkt 
     * @param {Pointer<Integer>} pXDSTypePkt 
     * @param {Pointer<BSTR>} pBstrXDSPkt 
     * @param {Pointer<Integer>} pPktSeqID 
     * @param {Pointer<Integer>} pCallSeqID 
     * @param {Pointer<Integer>} pTimeStart 
     * @param {Pointer<Integer>} pTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ixdscodec-getxdspacket
     */
    GetXDSPacket(pXDSClassPkt, pXDSTypePkt, pBstrXDSPkt, pPktSeqID, pCallSeqID, pTimeStart, pTimeEnd) {
        result := ComCall(7, this, "int*", pXDSClassPkt, "int*", pXDSTypePkt, "ptr", pBstrXDSPkt, "int*", pPktSeqID, "int*", pCallSeqID, "int64*", pTimeStart, "int64*", pTimeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} protType 
     * @param {Pointer<Integer>} lpDateTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ixdscodec-getcurrlicenseexpdate
     */
    GetCurrLicenseExpDate(protType, lpDateTime) {
        result := ComCall(8, this, "int*", protType, "int*", lpDateTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ixdscodec-getlasterrorcode
     */
    GetLastErrorCode() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
