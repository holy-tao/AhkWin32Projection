#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDvbLogicalChannelDescriptor2.ahk

/**
 * Implements methods that get data from a logical channel descriptor (LCD) in a Digital Video Broadcast (DVB) MPEG-2 stream that uses the format defined in the Nordig specification used in Scandinavian countries.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvblogicalchannel2descriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbLogicalChannel2Descriptor extends IDvbLogicalChannelDescriptor2{
    /**
     * The interface identifier for IDvbLogicalChannel2Descriptor
     * @type {Guid}
     */
    static IID => Guid("{f69c3747-8a30-4980-998c-01fe7f0ba35a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetCountOfLists(pbVal) {
        result := ComCall(9, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetListId(bListIndex, pbVal) {
        result := ComCall(10, this, "char", bListIndex, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetListNameW(bListIndex, convMode, pbstrName) {
        result := ComCall(11, this, "char", bListIndex, "int", convMode, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Pointer<Byte>} pszCode 
     * @returns {HRESULT} 
     */
    GetListCountryCode(bListIndex, pszCode) {
        result := ComCall(12, this, "char", bListIndex, "char*", pszCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bChannelListIndex 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetListCountOfRecords(bChannelListIndex, pbVal) {
        result := ComCall(13, this, "char", bChannelListIndex, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetListRecordServiceId(bListIndex, bRecordIndex, pwVal) {
        result := ComCall(14, this, "char", bListIndex, "char", bRecordIndex, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetListRecordLogicalChannelNumber(bListIndex, bRecordIndex, pwVal) {
        result := ComCall(15, this, "char", bListIndex, "char", bRecordIndex, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bListIndex 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetListRecordLogicalChannelAndVisibility(bListIndex, bRecordIndex, pwVal) {
        result := ComCall(16, this, "char", bListIndex, "char", bRecordIndex, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
