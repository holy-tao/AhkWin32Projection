#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Describes the structure of a particular UDT.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-irecordinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IRecordInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRecordInfo
     * @type {Guid}
     */
    static IID => Guid("{0000002f-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RecordInit", "RecordClear", "RecordCopy", "GetGuid", "GetName", "GetSize", "GetTypeInfo", "GetField", "GetFieldNoCopy", "PutField", "PutFieldNoCopy", "GetFieldNames", "IsMatchingType", "RecordCreate", "RecordCreateCopy", "RecordDestroy"]

    /**
     * 
     * @param {Pointer<Void>} pvNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-recordinit
     */
    RecordInit(pvNew) {
        pvNewMarshal := pvNew is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvNewMarshal, pvNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvExisting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-recordclear
     */
    RecordClear(pvExisting) {
        pvExistingMarshal := pvExisting is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pvExistingMarshal, pvExisting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvExisting 
     * @param {Pointer<Void>} pvNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-recordcopy
     */
    RecordCopy(pvExisting, pvNew) {
        pvExistingMarshal := pvExisting is VarRef ? "ptr" : "ptr"
        pvNewMarshal := pvNew is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvExistingMarshal, pvExisting, pvNewMarshal, pvNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getguid
     */
    GetGuid(pguid) {
        result := ComCall(6, this, "ptr", pguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getname
     */
    GetName(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getsize
     */
    GetSize(pcbSize) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITypeInfo>} ppTypeInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-gettypeinfo
     */
    GetTypeInfo(ppTypeInfo) {
        result := ComCall(9, this, "ptr*", ppTypeInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvData 
     * @param {PWSTR} szFieldName 
     * @param {Pointer<VARIANT>} pvarField 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getfield
     */
    GetField(pvData, szFieldName, pvarField) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, pvDataMarshal, pvData, "ptr", szFieldName, "ptr", pvarField, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvData 
     * @param {PWSTR} szFieldName 
     * @param {Pointer<VARIANT>} pvarField 
     * @param {Pointer<Pointer<Void>>} ppvDataCArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getfieldnocopy
     */
    GetFieldNoCopy(pvData, szFieldName, pvarField, ppvDataCArray) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"
        ppvDataCArrayMarshal := ppvDataCArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, pvDataMarshal, pvData, "ptr", szFieldName, "ptr", pvarField, ppvDataCArrayMarshal, ppvDataCArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wFlags 
     * @param {Pointer<Void>} pvData 
     * @param {PWSTR} szFieldName 
     * @param {Pointer<VARIANT>} pvarField 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-putfield
     */
    PutField(wFlags, pvData, szFieldName, pvarField) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, "uint", wFlags, pvDataMarshal, pvData, "ptr", szFieldName, "ptr", pvarField, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wFlags 
     * @param {Pointer<Void>} pvData 
     * @param {PWSTR} szFieldName 
     * @param {Pointer<VARIANT>} pvarField 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-putfieldnocopy
     */
    PutFieldNoCopy(wFlags, pvData, szFieldName, pvarField) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, "uint", wFlags, pvDataMarshal, pvData, "ptr", szFieldName, "ptr", pvarField, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcNames 
     * @param {Pointer<BSTR>} rgBstrNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getfieldnames
     */
    GetFieldNames(pcNames, rgBstrNames) {
        pcNamesMarshal := pcNames is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pcNamesMarshal, pcNames, "ptr", rgBstrNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRecordInfo} pRecordInfo 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-ismatchingtype
     */
    IsMatchingType(pRecordInfo) {
        result := ComCall(15, this, "ptr", pRecordInfo, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-recordcreate
     */
    RecordCreate() {
        result := ComCall(16, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvSource 
     * @param {Pointer<Pointer<Void>>} ppvDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-recordcreatecopy
     */
    RecordCreateCopy(pvSource, ppvDest) {
        pvSourceMarshal := pvSource is VarRef ? "ptr" : "ptr"
        ppvDestMarshal := ppvDest is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, pvSourceMarshal, pvSource, ppvDestMarshal, ppvDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvRecord 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-recorddestroy
     */
    RecordDestroy(pvRecord) {
        pvRecordMarshal := pvRecord is VarRef ? "ptr" : "ptr"

        result := ComCall(18, this, pvRecordMarshal, pvRecord, "HRESULT")
        return result
    }
}
