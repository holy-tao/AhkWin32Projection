#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbServiceAttributeDescriptor extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCountOfRecords", "GetRecordServiceId", "GetRecordNumericSelectionFlag", "GetRecordVisibleServiceFlag"]

    /**
     * 
     * @returns {Integer} 
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     */
    GetRecordServiceId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {BOOL} 
     */
    GetRecordNumericSelectionFlag(bRecordIndex) {
        result := ComCall(7, this, "char", bRecordIndex, "int*", &pfVal := 0, "HRESULT")
        return pfVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {BOOL} 
     */
    GetRecordVisibleServiceFlag(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "int*", &pfVal := 0, "HRESULT")
        return pfVal
    }
}
