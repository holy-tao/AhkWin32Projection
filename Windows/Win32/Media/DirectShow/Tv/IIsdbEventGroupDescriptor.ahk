#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbeventgroupdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbEventGroupDescriptor extends IUnknown{
    /**
     * The interface identifier for IIsdbEventGroupDescriptor
     * @type {Guid}
     */
    static IID => Guid("{94b06780-2e2a-44dc-a966-cc56fdabc6c2}")

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
    GetGroupType(pbVal) {
        result := ComCall(5, this, "char*", pbVal, "int")
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
        result := ComCall(6, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<UInt16>} pwServiceId 
     * @param {Pointer<UInt16>} pwEventId 
     * @returns {HRESULT} 
     */
    GetRecordEvent(bRecordIndex, pwServiceId, pwEventId) {
        result := ComCall(7, this, "char", bRecordIndex, "ushort*", pwServiceId, "ushort*", pwEventId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetCountOfRefRecords(pbVal) {
        result := ComCall(8, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<UInt16>} pwOriginalNetworkId 
     * @param {Pointer<UInt16>} pwTransportStreamId 
     * @param {Pointer<UInt16>} pwServiceId 
     * @param {Pointer<UInt16>} pwEventId 
     * @returns {HRESULT} 
     */
    GetRefRecordEvent(bRecordIndex, pwOriginalNetworkId, pwTransportStreamId, pwServiceId, pwEventId) {
        result := ComCall(9, this, "char", bRecordIndex, "ushort*", pwOriginalNetworkId, "ushort*", pwTransportStreamId, "ushort*", pwServiceId, "ushort*", pwEventId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
