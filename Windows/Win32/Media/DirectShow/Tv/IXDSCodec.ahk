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
     * 
     * @param {Pointer<HRESULT>} pHrCoCreateRetVal 
     * @returns {HRESULT} 
     */
    get_XDSToRatObjOK(pHrCoCreateRetVal) {
        result := ComCall(3, this, "ptr", pHrCoCreateRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SubstreamMask 
     * @returns {HRESULT} 
     */
    put_CCSubstreamService(SubstreamMask) {
        result := ComCall(4, this, "int", SubstreamMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSubstreamMask 
     * @returns {HRESULT} 
     */
    get_CCSubstreamService(pSubstreamMask) {
        result := ComCall(5, this, "int*", pSubstreamMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRat 
     * @param {Pointer<Int32>} pPktSeqID 
     * @param {Pointer<Int32>} pCallSeqID 
     * @param {Pointer<Int64>} pTimeStart 
     * @param {Pointer<Int64>} pTimeEnd 
     * @returns {HRESULT} 
     */
    GetContentAdvisoryRating(pRat, pPktSeqID, pCallSeqID, pTimeStart, pTimeEnd) {
        result := ComCall(6, this, "int*", pRat, "int*", pPktSeqID, "int*", pCallSeqID, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pXDSClassPkt 
     * @param {Pointer<Int32>} pXDSTypePkt 
     * @param {Pointer<BSTR>} pBstrXDSPkt 
     * @param {Pointer<Int32>} pPktSeqID 
     * @param {Pointer<Int32>} pCallSeqID 
     * @param {Pointer<Int64>} pTimeStart 
     * @param {Pointer<Int64>} pTimeEnd 
     * @returns {HRESULT} 
     */
    GetXDSPacket(pXDSClassPkt, pXDSTypePkt, pBstrXDSPkt, pPktSeqID, pCallSeqID, pTimeStart, pTimeEnd) {
        result := ComCall(7, this, "int*", pXDSClassPkt, "int*", pXDSTypePkt, "ptr", pBstrXDSPkt, "int*", pPktSeqID, "int*", pCallSeqID, "int64*", pTimeStart, "int64*", pTimeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} protType 
     * @param {Pointer<Int32>} lpDateTime 
     * @returns {HRESULT} 
     */
    GetCurrLicenseExpDate(protType, lpDateTime) {
        result := ComCall(8, this, "int*", protType, "int*", lpDateTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetLastErrorCode() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
