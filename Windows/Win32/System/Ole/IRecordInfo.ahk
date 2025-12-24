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
     * Initializes a new instance of a record.
     * @returns {Void} An instance of a record.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-recordinit
     */
    RecordInit() {
        result := ComCall(3, this, "ptr", &pvNew := 0, "HRESULT")
        return pvNew
    }

    /**
     * Releases object references and other values of a record without deallocating the record.
     * @param {Pointer<Void>} pvExisting The record to be cleared.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-recordclear
     */
    RecordClear(pvExisting) {
        pvExistingMarshal := pvExisting is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pvExistingMarshal, pvExisting, "HRESULT")
        return result
    }

    /**
     * Copies an existing record into the passed in buffer.
     * @param {Pointer<Void>} pvExisting The current record instance.
     * @returns {Void} The destination where the record will be copied.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-recordcopy
     */
    RecordCopy(pvExisting) {
        pvExistingMarshal := pvExisting is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvExistingMarshal, pvExisting, "ptr", &pvNew := 0, "HRESULT")
        return pvNew
    }

    /**
     * Gets the GUID of the record type.
     * @returns {Guid} The class GUID of the TypeInfo that describes the UDT.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-getguid
     */
    GetGuid() {
        pguid := Guid()
        result := ComCall(6, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * Gets the name of the record type.
     * @returns {BSTR} The name.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-getname
     */
    GetName() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the number of bytes of memory necessary to hold the record instance.
     * @returns {Integer} The size of a record instance, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-getsize
     */
    GetSize() {
        result := ComCall(8, this, "uint*", &pcbSize := 0, "HRESULT")
        return pcbSize
    }

    /**
     * Retrieves the type information that describes a UDT or safearray of UDTs.
     * @returns {ITypeInfo} The information type of the record.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-gettypeinfo
     */
    GetTypeInfo() {
        result := ComCall(9, this, "ptr*", &ppTypeInfo := 0, "HRESULT")
        return ITypeInfo(ppTypeInfo)
    }

    /**
     * Returns a pointer to the VARIANT containing the value of a given field name.
     * @param {Pointer<Void>} pvData The instance of a record.
     * @param {PWSTR} szFieldName The field name.
     * @returns {VARIANT} The VARIANT that you want to hold the value of the field name, <i>szFieldName</i>. On return, places a copy of the field's value in the variant.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-getfield
     */
    GetField(pvData, szFieldName) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        pvarField := VARIANT()
        result := ComCall(10, this, pvDataMarshal, pvData, "ptr", szFieldName, "ptr", pvarField, "HRESULT")
        return pvarField
    }

    /**
     * Returns a pointer to the value of a given field name without copying the value and allocating resources.
     * @param {Pointer<Void>} pvData The instance of a record.
     * @param {PWSTR} szFieldName The name of the field.
     * @param {Pointer<VARIANT>} pvarField The VARIANT that will contain the UDT upon return.
     * @param {Pointer<Pointer<Void>>} ppvDataCArray Receives the value of the field upon return.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-getfieldnocopy
     */
    GetFieldNoCopy(pvData, szFieldName, pvarField, ppvDataCArray) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"
        ppvDataCArrayMarshal := ppvDataCArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, pvDataMarshal, pvData, "ptr", szFieldName, "ptr", pvarField, ppvDataCArrayMarshal, ppvDataCArray, "HRESULT")
        return result
    }

    /**
     * Puts a variant into a field.
     * @param {Integer} wFlags The only legal values for the wFlags parameter is INVOKE_PROPERTYPUT or INVOKE_PROPERTYPUTREF.
     * 
     * If INVOKE_PROPERTYPUTREF is passed in then <b>PutField</b> just assigns the value of the variant that is passed in to the field using normal coercion rules.
     * 
     * If INVOKE_PROPERTYPUT is passed in then specific rules apply. If the field is declared as a class that derives from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> and the field's value is NULL then an error will be returned. If the field's value is not NULL then the variant will be passed to the default property supported by the object referenced by the field. If the field is not declared as a class derived from <b>IDispatch</b> then an error will be returned. If the field is declared as a variant of type VT_Dispatch then the default value of the object is assigned to the field. Otherwise, the variant's value is assigned to the field.
     * @param {Pointer<Void>} pvData The pointer to an instance of the record.
     * @param {PWSTR} szFieldName The name of the field of the record.
     * @param {Pointer<VARIANT>} pvarField The pointer to the variant.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-putfield
     */
    PutField(wFlags, pvData, szFieldName, pvarField) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, "uint", wFlags, pvDataMarshal, pvData, "ptr", szFieldName, "ptr", pvarField, "HRESULT")
        return result
    }

    /**
     * Passes ownership of the data to the assigned field by placing the actual data into the field.
     * @param {Integer} wFlags The only legal values for the wFlags parameter is INVOKE_PROPERTYPUT or INVOKE_PROPERTYPUTREF.
     * @param {Pointer<Void>} pvData An instance of the record described by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-irecordinfo">IRecordInfo</a>.
     * @param {PWSTR} szFieldName The name of the field of the record.
     * @param {Pointer<VARIANT>} pvarField The variant to be put into the field.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-putfieldnocopy
     */
    PutFieldNoCopy(wFlags, pvData, szFieldName, pvarField) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, "uint", wFlags, pvDataMarshal, pvData, "ptr", szFieldName, "ptr", pvarField, "HRESULT")
        return result
    }

    /**
     * Gets the names of the fields of the record.
     * @param {Pointer<Integer>} pcNames The number of names to return.
     * @returns {BSTR} The name of the array of type BSTR.
     * 
     * If the <i>rgBstrNames</i> parameter is NULL, then <i>pcNames</i> is returned with the number of field names. 
     * 
     * It the <i>rgBstrNames</i> parameter is not NULL, then the string names contained in <i>rgBstrNames</i> are returned. If the number of names in <i>pcNames</i> and <i>rgBstrNames</i> are not equal then the lesser number of the two is the number of returned field names. The caller needs to free the BSTRs inside the array returned in <i>rgBstrNames</i>.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-getfieldnames
     */
    GetFieldNames(pcNames) {
        pcNamesMarshal := pcNames is VarRef ? "uint*" : "ptr"

        rgBstrNames := BSTR()
        result := ComCall(14, this, pcNamesMarshal, pcNames, "ptr", rgBstrNames, "HRESULT")
        return rgBstrNames
    }

    /**
     * Determines whether the record that is passed in matches that of the current record information.
     * @param {IRecordInfo} pRecordInfo The information of the record.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The record that is passed in matches the current record information.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The record that is passed in does not match the current record information.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-ismatchingtype
     */
    IsMatchingType(pRecordInfo) {
        result := ComCall(15, this, "ptr", pRecordInfo, "int")
        return result
    }

    /**
     * Allocates memory for a new record, initializes the instance and returns a pointer to the record.
     * @returns {Pointer<Void>} This method returns a pointer to the created record.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-recordcreate
     */
    RecordCreate() {
        result := ComCall(16, this, "ptr")
        return result
    }

    /**
     * Creates a copy of an instance of a record to the specified location.
     * @param {Pointer<Void>} pvSource An instance of the record to be copied.
     * @returns {Pointer<Void>} The new record with data copied from <i>pvSource</i>.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-recordcreatecopy
     */
    RecordCreateCopy(pvSource) {
        pvSourceMarshal := pvSource is VarRef ? "ptr" : "ptr"

        result := ComCall(17, this, pvSourceMarshal, pvSource, "ptr*", &ppvDest := 0, "HRESULT")
        return ppvDest
    }

    /**
     * Releases the resources and deallocates the memory of the record.
     * @param {Pointer<Void>} pvRecord An instance of the record to be destroyed.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-irecordinfo-recorddestroy
     */
    RecordDestroy(pvRecord) {
        pvRecordMarshal := pvRecord is VarRef ? "ptr" : "ptr"

        result := ComCall(18, this, pvRecordMarshal, pvRecord, "HRESULT")
        return result
    }
}
