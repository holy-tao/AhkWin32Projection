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
        pSubstreamMaskMarshal := pSubstreamMask is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pSubstreamMaskMarshal, pSubstreamMask, "HRESULT")
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
        pRatMarshal := pRat is VarRef ? "int*" : "ptr"
        pPktSeqIDMarshal := pPktSeqID is VarRef ? "int*" : "ptr"
        pCallSeqIDMarshal := pCallSeqID is VarRef ? "int*" : "ptr"
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(6, this, pRatMarshal, pRat, pPktSeqIDMarshal, pPktSeqID, pCallSeqIDMarshal, pCallSeqID, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
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
        pXDSClassPktMarshal := pXDSClassPkt is VarRef ? "int*" : "ptr"
        pXDSTypePktMarshal := pXDSTypePkt is VarRef ? "int*" : "ptr"
        pPktSeqIDMarshal := pPktSeqID is VarRef ? "int*" : "ptr"
        pCallSeqIDMarshal := pCallSeqID is VarRef ? "int*" : "ptr"
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, pXDSClassPktMarshal, pXDSClassPkt, pXDSTypePktMarshal, pXDSTypePkt, "ptr", pBstrXDSPkt, pPktSeqIDMarshal, pPktSeqID, pCallSeqIDMarshal, pCallSeqID, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
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
        protTypeMarshal := protType is VarRef ? "int*" : "ptr"
        lpDateTimeMarshal := lpDateTime is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, protTypeMarshal, protType, lpDateTimeMarshal, lpDateTime, "HRESULT")
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
