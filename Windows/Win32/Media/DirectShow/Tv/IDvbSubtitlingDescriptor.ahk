#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) subtitling descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbsubtitlingdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbSubtitlingDescriptor extends IUnknown{
    /**
     * The interface identifier for IDvbSubtitlingDescriptor
     * @type {Guid}
     */
    static IID => Guid("{9b25fe1d-fa23-4e50-9784-6df8b26f8a49}")

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
     * @param {Pointer<UInt32>} pulVal 
     * @returns {HRESULT} 
     */
    GetRecordLangId(bRecordIndex, pulVal) {
        result := ComCall(6, this, "char", bRecordIndex, "uint*", pulVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetRecordSubtitlingType(bRecordIndex, pbVal) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", pbVal, "int")
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
    GetRecordCompositionPageID(bRecordIndex, pwVal) {
        result := ComCall(8, this, "char", bRecordIndex, "ushort*", pwVal, "int")
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
    GetRecordAncillaryPageID(bRecordIndex, pwVal) {
        result := ComCall(9, this, "char", bRecordIndex, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
