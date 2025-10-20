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
     * 
     * @param {Pointer<Void>} pvNew 
     * @returns {HRESULT} 
     */
    RecordInit(pvNew) {
        result := ComCall(3, this, "ptr", pvNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvExisting 
     * @returns {HRESULT} 
     */
    RecordClear(pvExisting) {
        result := ComCall(4, this, "ptr", pvExisting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvExisting 
     * @param {Pointer<Void>} pvNew 
     * @returns {HRESULT} 
     */
    RecordCopy(pvExisting, pvNew) {
        result := ComCall(5, this, "ptr", pvExisting, "ptr", pvNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    GetGuid(pguid) {
        result := ComCall(6, this, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetName(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    GetSize(pcbSize) {
        result := ComCall(8, this, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITypeInfo>} ppTypeInfo 
     * @returns {HRESULT} 
     */
    GetTypeInfo(ppTypeInfo) {
        result := ComCall(9, this, "ptr", ppTypeInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvData 
     * @param {PWSTR} szFieldName 
     * @param {Pointer<VARIANT>} pvarField 
     * @returns {HRESULT} 
     */
    GetField(pvData, szFieldName, pvarField) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        result := ComCall(10, this, "ptr", pvData, "ptr", szFieldName, "ptr", pvarField, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvData 
     * @param {PWSTR} szFieldName 
     * @param {Pointer<VARIANT>} pvarField 
     * @param {Pointer<Void>} ppvDataCArray 
     * @returns {HRESULT} 
     */
    GetFieldNoCopy(pvData, szFieldName, pvarField, ppvDataCArray) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        result := ComCall(11, this, "ptr", pvData, "ptr", szFieldName, "ptr", pvarField, "ptr", ppvDataCArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wFlags 
     * @param {Pointer<Void>} pvData 
     * @param {PWSTR} szFieldName 
     * @param {Pointer<VARIANT>} pvarField 
     * @returns {HRESULT} 
     */
    PutField(wFlags, pvData, szFieldName, pvarField) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        result := ComCall(12, this, "uint", wFlags, "ptr", pvData, "ptr", szFieldName, "ptr", pvarField, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wFlags 
     * @param {Pointer<Void>} pvData 
     * @param {PWSTR} szFieldName 
     * @param {Pointer<VARIANT>} pvarField 
     * @returns {HRESULT} 
     */
    PutFieldNoCopy(wFlags, pvData, szFieldName, pvarField) {
        szFieldName := szFieldName is String ? StrPtr(szFieldName) : szFieldName

        result := ComCall(13, this, "uint", wFlags, "ptr", pvData, "ptr", szFieldName, "ptr", pvarField, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcNames 
     * @param {Pointer<BSTR>} rgBstrNames 
     * @returns {HRESULT} 
     */
    GetFieldNames(pcNames, rgBstrNames) {
        result := ComCall(14, this, "uint*", pcNames, "ptr", rgBstrNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRecordInfo>} pRecordInfo 
     * @returns {BOOL} 
     */
    IsMatchingType(pRecordInfo) {
        result := ComCall(15, this, "ptr", pRecordInfo, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    RecordCreate() {
        result := ComCall(16, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvSource 
     * @param {Pointer<Void>} ppvDest 
     * @returns {HRESULT} 
     */
    RecordCreateCopy(pvSource, ppvDest) {
        result := ComCall(17, this, "ptr", pvSource, "ptr", ppvDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvRecord 
     * @returns {HRESULT} 
     */
    RecordDestroy(pvRecord) {
        result := ComCall(18, this, "ptr", pvRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
