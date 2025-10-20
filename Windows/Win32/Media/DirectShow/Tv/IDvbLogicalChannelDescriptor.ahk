#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDvbLogicalChannelDescriptor interface enables the client to get a logical channel descriptor from a DVB stream.
 * @remarks
 * 
  * To obtain a pointer to this interface, do the following:
  * 
  * <ol>
  * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbsiparser-getnit">IDvbSiParser::GetNIT</a> to get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_nit">IDVB_NIT</a> interface.</li>
  * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_nit-getrecorddescriptorbytag">IDVB_NIT::GetRecordDescriptorByTag</a> and pass in the logical channel descriptor tag (0x83). If the descriptor is present, the method returns an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> pointer.</li>
  * <li>Query the returned <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> pointer for the <b>IDvbLogicalChannelDescriptor</b> interface.</li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvblogicalchanneldescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbLogicalChannelDescriptor extends IUnknown{
    /**
     * The interface identifier for IDvbLogicalChannelDescriptor
     * @type {Guid}
     */
    static IID => Guid("{cf1edaff-3ffd-4cf7-8201-35756acbf85f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetCountOfRecords(pbVal) {
        result := ComCall(5, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetRecordServiceId(bRecordIndex, pwVal) {
        result := ComCall(6, this, "char", bRecordIndex, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetRecordLogicalChannelNumber(bRecordIndex, pwVal) {
        result := ComCall(7, this, "char", bRecordIndex, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
