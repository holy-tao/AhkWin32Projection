#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get information from a Digital Video Broadcast (DVB) content identifier descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbcontentidentifierdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbContentIdentifierDescriptor extends IUnknown{
    /**
     * The interface identifier for IDvbContentIdentifierDescriptor
     * @type {Guid}
     */
    static IID => Guid("{05e0c1ea-f661-4053-9fbf-d93b28359838}")

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
     * @param {Pointer<Byte>} pbType 
     * @param {Pointer<Byte>} pbLocation 
     * @param {Pointer<Byte>} pbLength 
     * @param {Pointer<Byte>} ppbBytes 
     * @returns {HRESULT} 
     */
    GetRecordCrid(bRecordIndex, pbType, pbLocation, pbLength, ppbBytes) {
        result := ComCall(6, this, "char", bRecordIndex, "char*", pbType, "char*", pbLocation, "char*", pbLength, "char*", ppbBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
