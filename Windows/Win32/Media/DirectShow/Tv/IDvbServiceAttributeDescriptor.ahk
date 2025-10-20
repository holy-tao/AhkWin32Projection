#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbServiceAttributeDescriptor extends IUnknown{
    /**
     * The interface identifier for IDvbServiceAttributeDescriptor
     * @type {Guid}
     */
    static IID => Guid("{0f37bd92-d6a1-4854-b950-3a969d27f30e}")

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
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     */
    GetRecordNumericSelectionFlag(bRecordIndex, pfVal) {
        result := ComCall(7, this, "char", bRecordIndex, "ptr", pfVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     */
    GetRecordVisibleServiceFlag(bRecordIndex, pfVal) {
        result := ComCall(8, this, "char", bRecordIndex, "ptr", pfVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
