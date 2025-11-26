#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
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
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {BSTR} 
     */
    Key {
        get => this.get_Key()
        set => this.put_Key(value)
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {Integer} 
     */
    ValueMapType {
        get => this.get_ValueMapType()
        set => this.put_ValueMapType(value)
    }

    /**
     * Retrieves or sets a description of the item.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-get_description
     */
    get_Description() {
        description := BSTR()
        result := ComCall(7, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * Retrieves or sets a description of the item.
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(8, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates whether the item is enabled.
     * @remarks
     * 
     * The type of the item determines whether more than one item in the value map collection can be enabled. For example, one of the possible settings is to enable one or more keywords while enabling only one level.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-get_enabled
     */
    get_Enabled() {
        result := ComCall(9, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Retrieves or sets a value that indicates whether the item is enabled.
     * @remarks
     * 
     * The type of the item determines whether more than one item in the value map collection can be enabled. For example, one of the possible settings is to enable one or more keywords while enabling only one level.
     * 
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(10, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of the item.
     * @remarks
     * 
     * Note that if you set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property and PLA generates the items, the items are not named.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-get_key
     */
    get_Key() {
        key := BSTR()
        result := ComCall(11, this, "ptr", key, "HRESULT")
        return key
    }

    /**
     * Retrieves or sets the name of the item.
     * @remarks
     * 
     * Note that if you set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property and PLA generates the items, the items are not named.
     * 
     * 
     * @param {BSTR} key 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-put_key
     */
    put_Key(key) {
        key := key is String ? BSTR.Alloc(key).Value : key

        result := ComCall(12, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the value of the item.
     * @remarks
     * 
     * The variant type is VT_UI8 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is plaIndex, plaFlag or plaFlagArray.
     * 
     * The variant type is VT_UI4 if <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> is plaValidation.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-get_value
     */
    get_Value() {
        Value := VARIANT()
        result := ComCall(13, this, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * Retrieves or sets the value of the item.
     * @remarks
     * 
     * The variant type is VT_UI8 if the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> enumeration is plaIndex, plaFlag or plaFlagArray.
     * 
     * The variant type is VT_UI4 if <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype">ValueMapType</a> is plaValidation.
     * 
     * 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-put_value
     */
    put_Value(Value) {
        result := ComCall(14, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the type of the item.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-get_valuemaptype
     */
    get_ValueMapType() {
        result := ComCall(15, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Retrieves or sets the type of the item.
     * @param {Integer} type 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ivaluemapitem-put_valuemaptype
     */
    put_ValueMapType(type) {
        result := ComCall(16, this, "int", type, "HRESULT")
        return result
    }
}
