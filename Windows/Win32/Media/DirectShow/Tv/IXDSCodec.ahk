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
     * @type {HRESULT} 
     */
    XDSToRatObjOK {
        get => this.get_XDSToRatObjOK()
    }

    /**
     * @type {Integer} 
     */
    CCSubstreamService {
        get => this.get_CCSubstreamService()
        set => this.put_CCSubstreamService(value)
    }

    /**
     * The get_XDSToRatObjOK method queries whether the XDSToRat object was created successfully.
     * @returns {HRESULT} Receives an <b>HRESULT</b> value. The <b>HRESULT</b> is the value that was returned when the filter called <b>CoCreateInstance</b> to create the <b>XDSToRat</b> object. If it equals S_OK, the <b>EvalRat</b> object was created successfully.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ixdscodec-get_xdstoratobjok
     */
    get_XDSToRatObjOK() {
        result := ComCall(3, this, "int*", &pHrCoCreateRetVal := 0, "HRESULT")
        return pHrCoCreateRetVal
    }

    /**
     * The put_CCSubstreamService method specifies which line 21 data channels the XDS Codec filter sends to the XDSToRat object. By default, only the Extended Data Services (XDS) channel is supported.
     * @param {Integer} SubstreamMask Bitwise combination of zero or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/ks-cc-substream">KS_CC_SUBSTREAM</a> flags, specifying the line 21 services.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ixdscodec-put_ccsubstreamservice
     */
    put_CCSubstreamService(SubstreamMask) {
        result := ComCall(4, this, "int", SubstreamMask, "HRESULT")
        return result
    }

    /**
     * The get_CCSubstreamService method queries which line 21 data channels the XDS Codec filter sends to the XDSToRat object. By default, it sends just the Extended Data Services (XDS) channel.
     * @returns {Integer} Receives a bitwise combination of zero or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/ks-cc-substream">KS_CC_SUBSTREAM</a> flags.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ixdscodec-get_ccsubstreamservice
     */
    get_CCSubstreamService() {
        result := ComCall(5, this, "int*", &pSubstreamMask := 0, "HRESULT")
        return pSubstreamMask
    }

    /**
     * The GetContentAdvisoryRating method retrieves the most recent ratings information parsed by the XDSToRat object.
     * @param {Pointer<Integer>} pRat Receives the most recent rating. The rating is packed into a format that is used internally by the XDS Codec filter, Encrypter/Tagger filter, and Decrypter/Detagger filter. It is not intended for use by other objects.
     * @param {Pointer<Integer>} pPktSeqID Receives the number of ratings packets that have been decoded. This information can be used for diagnostic purposes.
     * @param {Pointer<Integer>} pCallSeqID Receives the number of times this method has been called for the current ratings packet. This information can be used for diagnostic purposes.
     * @param {Pointer<Integer>} pTimeStart Receives the start time of the sample that completed the ratings packet.
     * @param {Pointer<Integer>} pTimeEnd Receives the stop time of the sample that completed the ratings packet.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ixdscodec-getcontentadvisoryrating
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
     * The GetXDSPacket method retrieves the most recent XDS packet.
     * @param {Pointer<Integer>} pXDSClassPkt Receives the packet class.
     * @param {Pointer<Integer>} pXDSTypePkt Receives the class-specific packet type.
     * @param {Pointer<BSTR>} pBstrXDSPkt Receives the packet as a <b>BSTR</b> value.
     * @param {Pointer<Integer>} pPktSeqID Receives the number of ratings packets that have been decoded. This information can be used for diagnostic purposes.
     * @param {Pointer<Integer>} pCallSeqID Receives the number of times this method has been called for the current ratings packet. This information can be used for diagnostic purposes.
     * @param {Pointer<Integer>} pTimeStart Receives the start time of the sample containing the packet.
     * @param {Pointer<Integer>} pTimeEnd Receives the stop time of the sample containing the packet.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ixdscodec-getxdspacket
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
     * Not implemented in this release.
     * @param {Pointer<Integer>} protType Reserved.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ixdscodec-getcurrlicenseexpdate
     */
    GetCurrLicenseExpDate(protType) {
        protTypeMarshal := protType is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, protTypeMarshal, protType, "int*", &lpDateTime := 0, "HRESULT")
        return lpDateTime
    }

    /**
     * Not implemented in this release.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ixdscodec-getlasterrorcode
     */
    GetLastErrorCode() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
