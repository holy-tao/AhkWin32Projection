#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Defines a name/value pair.To get this interface, call the IValueMap::Item property. To create this interface, call the IValueMap::CreateValueMapItem method.
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-ivaluemapitem
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IValueMapItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IValueMapItem
     * @type {Guid}
     */
    static IID => Guid("{03837533-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description", "put_Description", "get_Enabled", "put_Enabled", "get_Key", "put_Key", "get_Value", "put_Value", "get_ValueMapType", "put_ValueMapType"]

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_description
     */
    get_Description(description) {
        result := ComCall(7, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(8, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_enabled
     */
    get_Enabled(enabled) {
        result := ComCall(9, this, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(10, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_key
     */
    get_Key(key) {
        result := ComCall(11, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_key
     */
    put_Key(key) {
        key := key is String ? BSTR.Alloc(key).Value : key

        result := ComCall(12, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_value
     */
    get_Value(Value) {
        result := ComCall(13, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_value
     */
    put_Value(Value) {
        result := ComCall(14, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-get_valuemaptype
     */
    get_ValueMapType(type) {
        result := ComCall(15, this, "int*", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ivaluemapitem-put_valuemaptype
     */
    put_ValueMapType(type) {
        result := ComCall(16, this, "int", type, "HRESULT")
        return result
    }
}
