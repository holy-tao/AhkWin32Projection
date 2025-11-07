#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\ITypeInfo.ahk
#Include ..\Variant\VARIANT.ahk
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
     * @returns {Void} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-recordinit
     */
    RecordInit() {
        result := ComCall(3, this, "ptr", &pvNew := 0, "HRESULT")
        return pvNew
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
     * @returns {Void} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-recordcopy
     */
    RecordCopy(pvExisting) {
        pvExistingMarshal := pvExisting is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvExistingMarshal, pvExisting, "ptr", &pvNew := 0, "HRESULT")
        return pvNew
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getguid
     */
    GetGuid() {
        pguid := Guid()
        result := ComCall(6, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getname
     */
    GetName() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getsize
     */
    GetSize() {
        result := ComCall(8, this, "uint*", &pcbSize := 0, "HRESULT")
        return pcbSize
    }

    /**
     * 
     * @returns {ITypeInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-gettypeinfo
     */
    GetTypeInfo() {
        result := ComCall(9, this, "ptr*", &ppTypeInfo := 0, "HRESULT")
        return ITypeInfo(ppTypeInfo)
    }

    /**
     * 
     * @param {Pointer<Void>} pvData 
     * @param {PWSTR} szFieldName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getfield
     */
    GetField(pvData, szFieldName) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        pvarField := VARIANT()
        result := ComCall(10, this, pvDataMarshal, pvData, "ptr", szFieldName, "ptr", pvarField, "HRESULT")
        return pvarField
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-getfieldnames
     */
    GetFieldNames(pcNames) {
        pcNamesMarshal := pcNames is VarRef ? "uint*" : "ptr"

        rgBstrNames := BSTR()
        result := ComCall(14, this, pcNamesMarshal, pcNames, "ptr", rgBstrNames, "HRESULT")
        return rgBstrNames
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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-irecordinfo-recordcreatecopy
     */
    RecordCreateCopy(pvSource) {
        pvSourceMarshal := pvSource is VarRef ? "ptr" : "ptr"

        result := ComCall(17, this, pvSourceMarshal, pvSource, "ptr*", &ppvDest := 0, "HRESULT")
        return ppvDest
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
