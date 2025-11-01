#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmFileCondition.ahk

/**
 * Defines a file condition property.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmreports/nn-fsrmreports-ifsrmfileconditionproperty
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileConditionProperty extends IFsrmFileCondition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileConditionProperty
     * @type {Guid}
     */
    static IID => Guid("{81926775-b981-4479-988f-da171d627360}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PropertyName", "put_PropertyName", "get_PropertyId", "put_PropertyId", "get_Operator", "put_Operator", "get_ValueType", "put_ValueType", "get_Value", "put_Value"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_propertyname
     */
    get_PropertyName(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_propertyname
     */
    put_PropertyName(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_propertyid
     */
    get_PropertyId(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_propertyid
     */
    put_PropertyId(newVal) {
        result := ComCall(12, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_operator
     */
    get_Operator(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_operator
     */
    put_Operator(newVal) {
        result := ComCall(14, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_valuetype
     */
    get_ValueType(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_valuetype
     */
    put_ValueType(newVal) {
        result := ComCall(16, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-get_value
     */
    get_Value(pVal) {
        result := ComCall(17, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmreports/nf-fsrmreports-ifsrmfileconditionproperty-put_value
     */
    put_Value(newVal) {
        result := ComCall(18, this, "ptr", newVal, "HRESULT")
        return result
    }
}
