#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get information from a Digital Video Broadcast (DVB) content descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbcontentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbContentDescriptor extends IUnknown{
    /**
     * The interface identifier for IDvbContentDescriptor
     * @type {Guid}
     */
    static IID => Guid("{2e883881-a467-412a-9d63-6f2b6da05bf0}")

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
     * @param {Pointer<Byte>} pbValLevel1 
     * @param {Pointer<Byte>} pbValLevel2 
     * @returns {HRESULT} 
     */
    GetRecordContentNibbles(bRecordIndex, pbValLevel1, pbValLevel2) {
        result := ComCall(6, this, "char", bRecordIndex, "char*", pbValLevel1, "char*", pbValLevel2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Byte>} pbVal1 
     * @param {Pointer<Byte>} pbVal2 
     * @returns {HRESULT} 
     */
    GetRecordUserNibbles(bRecordIndex, pbVal1, pbVal2) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", pbVal1, "char*", pbVal2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
