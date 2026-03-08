#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Properties.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a set of run-time bindable and discoverable properties that allow a data-driven application to modify the state of a Direct2D effect.
 * @remarks
 * This interface supports access through either indices or property names. In addition to top-level properties, each property in an <b>ID2D1Properties</b> object may contain an <b>ID2D1Properties</b> object, which stores metadata describing the parent property. 
 * 
 * <h3><a id="Overview"></a><a id="overview"></a><a id="OVERVIEW"></a>Overview</h3>
 * The <b>ID2D1Properties</b> interface exposes a set of run-time bindable and discoverable properties that allow a data-driven application such as an effect graph authoring tool or an animation system to modify the state of a Direct2D effect.
 * 
 * The interface supports access through either indices or property names. In addition to top-level properties, each property in an <b>ID2D1Properties</b> may contain a sub-<b>ID2D1Properties</b> interface, which stores metadata describing its parent property. Sub-properties are accessed by requesting this sub-interface by property index, or by using a property name string separated by a dot (.).
 * 
 * The interface is intentionally designed to avoid dependencies on a run-time basis. All allocation is done by the caller of the API and <b>VARIANT</b> types are not used. The property interface generally is designed not to return failures where the application could trivially change their calling sequence in order to avoid the condition. For example, since the number of properties supported by the instance is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1properties-getpropertycount">GetPropertyCount</a> method, other methods that take a property index do not return a failure, unless they also use the plug-in effect's property system.
 * 
 * The interface is primarily based upon an index-based access model, and it supports nested sub-properties within properties. Unlike a directory structure, the property itself has a value and a type and might optionally support sub-properties (directories are not files). These are normally metadata that describe the property, but, this is also used to specify arrays of objects. In order to simplify accessing sub-properties and to allow name-based access, two helper methods – [GetValueByName](./nf-d2d1_1-id2d1properties-getvaluebyname(pcwstr).md) – are defined. These use a "dotted" notation in order to allow sub-properties to be directly specified, for example:
 * 
 * 
 * ```cpp
 * alphaMode = pEffect->GetValueByName<UINT32>(L"Inputs.0.AlphaMode");
 * ```
 * 
 * 
 * 
 * 
 * Or:
 * 
 * 
 * ```cpp
 * pEffect->SetValueByName<UINT32>(
 * 		    L"Inputs.0.AlphaMode", 
 * 		    DXGI_ALPHA_MODE_PREMULTIPLIED);
 * 		
 * ```
 * 
 * 
 * 
 * 
 * <h3><a id="Standard_Effect_Properties"></a><a id="standard_effect_properties"></a><a id="STANDARD_EFFECT_PROPERTIES"></a>Standard Effect Properties</h3>
 * <table>
 * <tr>
 * <th>Property name/index</th>
 * <th>Property type</th>
 * <th>Property description</th>
 * </tr>
 * <tr>
 * <td>CLSID / D2D1_PROPERTY_CLSID</td>
 * <td>D2D1_PROPERTY_TYPE_CLSID</td>
 * <td>The CLSID of the effect.</td>
 * </tr>
 * <tr>
 * <td>DisplayName / D2D1_PROPERTY_DISPLAYNAME</td>
 * <td>D2D1_PROPERTY_TYPE_STRING</td>
 * <td>A displayable, localized name for the effect.</td>
 * </tr>
 * <tr>
 * <td>Author / D2D1_PROPERTY_AUTHOR</td>
 * <td>D2D1_PROPERTY_TYPE_STRING</td>
 * <td>The author of the effect.</td>
 * </tr>
 * <tr>
 * <td>Category / D2D1_PROPERTY_CATEGORY</td>
 * <td>D2D1_PROPERTY_TYPE_STRING</td>
 * <td>The category of the effect. </td>
 * </tr>
 * <tr>
 * <td>Description / D2D1_PROPERTY_DESCRIPTION</td>
 * <td>D2D1_PROPERTY_TYPE_STRING</td>
 * <td>A description of the effect. </td>
 * </tr>
 * <tr>
 * <td>Inputs / D2D1_PROPERTY_INPUTS</td>
 * <td>D2D1_PROPERTY_TYPE_ARRAY
 * 			<div class="alert"><b>Note</b>  Elements of this array are of type D2D1_PROPERTY_TYPE_STRING.</div>
 * <div> </div>
 * </td>
 * <td>An array of names for the effect’s inputs. Each element of the array is a localized string specifying the name of an input.</td>
 * </tr>
 * </table>
 *  
 * 
 * <h3><a id="Standard_Sub-Properties"></a><a id="standard_sub-properties"></a><a id="STANDARD_SUB-PROPERTIES"></a>Standard Sub-Properties</h3>
 * The following are standard sub-properties that can be used for meta-data access, and may be available on both system and custom properties. Please see the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_subproperty">D2D1_SUBPROPERTY</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_property_type">D2D1_PROPERTY_TYPE</a> enumerations for more information.
 * 
 * <table>
 * <tr>
 * <th>Property name/index</th>
 * <th>Property type</th>
 * <th>Property description</th>
 * </tr>
 * <tr>
 * <td>DisplayName / D2D1_SUBPROPERTY_DISPLAYNAME</td>
 * <td>D2D1_PROPERTY_TYPE_STRING</td>
 * <td>
 * A displayable, localized name for the parent property.
 * 
 * This sub-property is present on all  top-level properties.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>IsReadOnly / D2D1_SUBPROPERTY_ISREADONLY</td>
 * <td>D2D1_PROPERTY_TYPE_BOOL</td>
 * <td>
 * A value indicating whether the parent property can be written to.
 * 
 * This sub-property is present on all  top-level properties.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>Default / D2D1_SUBPROPERTY_DEFAULT</td>
 * <td>Same as parent property.</td>
 * <td>
 * The default value for the property.
 * 
 * This sub-property is optionally present on all properties.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>Min / D2D1_SUBPROPERTY_MIN</td>
 * <td>Same as parent property.
 * 		  	<div class="alert"><b>Note</b>  Applicable only to numeric-type properties.</div>
 * <div> </div>
 * </td>
 * <td>
 * The minimum value that the parent property supports being set to.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>Max / D2D1_SUBPROPERTY_MAX</td>
 * <td>Same as parent property.
 * 				<div class="alert"><b>Note</b>  Applicable only to numeric-type properties.</div>
 * <div> </div>
 * </td>
 * <td>
 * The maximum value that the parent property supports being set to.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>Fields / D2D1_SUBPROPERTY_FIELDS</td>
 * <td>Array / D2D1_PROPERTY_TYPE_ARRAY
 * 				<div class="alert"><b>Note</b>  Applicable only when the parent property is of type <b>Enum</b>.</div>
 * <div> </div>
 * </td>
 * <td>
 * The set of valid values that can be set to the parent property.
 * 
 * Each value in this array is a name/index pair. The indices can be set to the parent and the names are localized values designed for consumption by UI. See the following section for more details.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <h3><a id="Array-Type_Sub-Properties"></a><a id="array-type_sub-properties"></a><a id="ARRAY-TYPE_SUB-PROPERTIES"></a>Array-Type Sub-Properties</h3>
 * See <a href="https://docs.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-gettype(u)">ID2D1Properties::GetType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_property_type">D2D1_PROPERTY_TYPE</a> for more information. If the property type is <b>D2D1_PROPERTY_TYPE_ARRAY</b>, the value of the property will be considered to be a <b>UINT</b> that has the count of array elements. The next sub-property will directly map the index to the requested property value. For example:
 * 
 * 
 * ```cpp
 * Inputs: UINT32 – 2
 * 		Inputs.0 : <Type> – First input
 * 		Inputs.1 : <Type> – Second input
 * 		
 * ```
 * 
 * 
 * The above example makes use of the following sub-properties, which will appear on <b>ARRAY</b>-type properties. Note that the numbered properties are not system properties, and are in the normal (0x0 – 0x80000000) range.
 * 
 * <table>
 * <tr>
 * <th>Property name</th>
 * <th>Property index</th>
 * <th>Property description</th>
 * </tr>
 * <tr>
 * <td>Property.0</td>
 * <td>0</td>
 * <td>First element of the property array.</td>
 * </tr>
 * <tr>
 * <td>...</td>
 * <td>...</td>
 * <td>...</td>
 * </tr>
 * <tr>
 * <td>Property.N</td>
 * <td>N</td>
 * <td><i>N</i>th element of the property array.</td>
 * </tr>
 * </table>
 *  
 * 
 * The type of each sub-element will be whatever the type of the array is. In the example above, this was an array of strings.
 * 
 * <h3><a id="Enum-Type_Sub-Poperties"></a><a id="enum-type_sub-poperties"></a><a id="ENUM-TYPE_SUB-POPERTIES"></a>Enum-Type Sub-Properties</h3>
 * If the property has type <b>D2D1_PROPERTY_TYPE_ENUM</b> then the property will have the value of the corresponding enumeration. There will be a sub-array of fields that will conform to the general rules for array sub-properties and consist of the name/value pairs. For example:
 * 
 * 
 * ```cpp
 * PixelFormat: ENUM – The pixel format value
 * 		PixelFormat.Fields: UINT32 – The number of fields
 * 		PixelFormat.Fields.0:String – The name of the first enum
 * 		PixelFormat.Fields.0.Index: UINT32 – The value of the enumeration.
 * 		
 * ```
 * 
 * 
 * The above example makes use of the following sub-properties. Please see the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_subproperty">D2D1_SUBPROPERTY</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_property_type">D2D1_PROPERTY_TYPE</a> enumerations for more information.
 * 
 * <table>
 * <tr>
 * <th>Property name</th>
 * <th>Property index</th>
 * <th>Property description</th>
 * </tr>
 * <tr>
 * <td>Property.Fields</td>
 * <td>D2D1_SUBPROPERTY_FIELDS</td>
 * <td>An array type property that gives information about each field in the enumeration.</td>
 * </tr>
 * <tr>
 * <td>Property.Fields.N</td>
 * <td>N</td>
 * <td>An array element that gives the name of the <i>N</i>th enumeration value.</td>
 * </tr>
 * <tr>
 * <td>Property.Fields.N.Index</td>
 * <td>D2D1_SUBPROPERTY_INDEX</td>
 * <td>The index which corresponds to the <i>N</i>th enumeration value.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Properties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Properties
     * @type {Guid}
     */
    static IID => Guid("{483473d7-cd46-4f9d-9d3a-3112aa80159d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyCount", "GetPropertyName", "GetPropertyNameLength", "GetType", "GetPropertyIndex", "SetValueByName", "SetValue", "GetValueByName", "GetValue", "GetValueSize", "GetSubProperties"]

    /**
     * Gets the number of top-level properties.
     * @remarks
     * This method returns the number of custom properties on the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1properties">ID2D1Properties</a> interface. System properties and sub-properties are part of a closed set, and are enumerable by iterating over this closed set.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * This method returns the number of custom (non-system) properties that can be accessed by the object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-getpropertycount
     */
    GetPropertyCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Gets the property name that corresponds to the given index.
     * @remarks
     * This method returns an empty string if <i>index</i> is invalid. If the method returns <b>RESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b>, <i>name</i> will still be filled and truncated.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The index of the property for which the name is being returned.
     * @param {PWSTR} name Type: <b>PWSTR</b>
     * 
     * When this method returns, contains the name being retrieved.
     * @param {Integer} nameCount Type: <b>UINT32</b>
     * 
     * The number of characters in the <i>name</i> buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</td>
     * <td>The supplied buffer was too small to accommodate the data.</td>
     * </tr>
     * <tr>
     * <td>D2DERR_INVALID_PROPERTY</td>
     * <td>The specified property does not exist.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-getpropertyname(uint32_pwstr_uint32)
     */
    GetPropertyName(index, name, nameCount) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "uint", index, "ptr", name, "uint", nameCount, "HRESULT")
        return result
    }

    /**
     * Gets the number of characters for the given property name. This is a template overload. See Remarks.
     * @remarks
     * The value returned by this method can be used to ensure that the buffer size for <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1properties-getpropertyname(uint32_pwstr_uint32)">GetPropertyName</a> is appropriate. 
     * 
     * 
     * <pre class="syntax">template&lt;typename U&gt;
     *     UINT32 GetPropertyNameLength(
     *         U index
     *         ) CONST;
     * </pre>
     * @param {Integer} index Type: <b>U</b>
     * 
     * The index of the property name to retrieve.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * This method returns the size in characters of the name corresponding to the given property index, or zero if the property index does not exist.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-getpropertynamelength(u)
     */
    GetPropertyNameLength(index) {
        result := ComCall(5, this, "uint", index, "uint")
        return result
    }

    /**
     * Gets the D2D1_PROPERTY_TYPE of the selected property.
     * @remarks
     * If the property does not exist, the method returns <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_property_type">D2D1_PROPERTY_TYPE_UNKNOWN</a>.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The index of the property for which the type will be retrieved.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_property_type">D2D1_PROPERTY_TYPE</a></b>
     * 
     * This method returns a <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_property_type">D2D1_PROPERTY_TYPE</a>-typed value for the type of the selected property.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-gettype(uint32)
     */
    GetType(index) {
        result := ComCall(6, this, "uint", index, "int")
        return result
    }

    /**
     * Gets the index corresponding to the given property name.
     * @remarks
     * If the property doesn't exist, then this method returns [D2D1_INVALID_PROPERTY_INDEX](/windows/win32/direct2d/direct2d-constants#d2d1_invalid_property_index-uintmax). This reserved value will never map to a valid index, and will cause <b>NULL</b> or sentinel values to be returned from other parts of the property interface.
     * @param {PWSTR} name Type: <b>PCWSTR</b>
     * 
     * The name of the property to retrieve.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The index of the corresponding property name.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-getpropertyindex
     */
    GetPropertyIndex(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(7, this, "ptr", name, "uint")
        return result
    }

    /**
     * Sets the named property to the given value. (overload 1/2)
     * @remarks
     * If the property does not exist, the request is ignored and the method returns <b>D2DERR_INVALID_PROPERTY</b>.
     * 
     * Any error not in the standard set returned by a property implementation will be mapped into the standard error range.
     * @param {PWSTR} name Type: <b>PCWSTR</b>
     * 
     * The name of the property to set.
     * @param {Integer} type 
     * @param {Pointer<Integer>} data Type: <b>const BYTE*</b>
     * 
     * The data to set.
     * @param {Integer} dataSize Type: <b>UINT32</b>
     * 
     * The number of bytes in the data to set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>D2DERR_INVALID_PROPERTY</td>
     * <td>The specified property does not exist.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Failed to allocate necessary memory.</td>
     * </tr>
     * <tr>
     * <td>D3DERR_OUT_OF_VIDEO_MEMORY</td>
     * <td>Failed to allocate required video memory.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>One or more arguments are invalid.</td>
     * </tr>
     * <tr>
     * <td>E_FAIL</td>
     * <td>Unspecified failure.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-setvaluebyname(pcwstr_constbyte_uint32)
     */
    SetValueByName(name, type, data, dataSize) {
        name := name is String ? StrPtr(name) : name

        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "ptr", name, "int", type, dataMarshal, data, "uint", dataSize, "HRESULT")
        return result
    }

    /**
     * Sets the corresponding property by index. This is a template overload. (overload 2/2)
     * @remarks
     * <pre class="syntax">template&lt;typename U&gt;
     *     HRESULT SetValue(
     *         U index,
     *         _In_reads_(dataSize) CONST BYTE *data,
     *         UINT32 dataSize
     *         );
     * </pre>
     * @param {Integer} index The index of the property to set.
     * @param {Integer} type 
     * @param {Pointer<Integer>} data The data to set.
     * @param {Integer} dataSize The number of bytes in the data to set.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>D2DERR_INVALID_PROPERTY</td>
     * <td>The specified property does not exist.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Failed to allocate necessary memory.</td>
     * </tr>
     * <tr>
     * <td>D3DERR_OUT_OF_VIDEO_MEMORY</td>
     * <td>Failed to allocate required video memory.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>One or more arguments are invalid.</td>
     * </tr>
     * <tr>
     * <td>E_FAIL</td>
     * <td>Unspecified failure.</td>
     * </tr>
     * </table>
     * �
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-setvalue(u_constbyte_uint32)
     */
    SetValue(index, type, data, dataSize) {
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", index, "int", type, dataMarshal, data, "uint", dataSize, "HRESULT")
        return result
    }

    /**
     * Gets the property value by name. This is a template overload. See Remarks. (overload 2/2)
     * @param {PWSTR} name 
     * @param {Integer} type 
     * @param {Integer} dataSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-getvaluebyname(pcwstr)
     */
    GetValueByName(name, type, dataSize) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(10, this, "ptr", name, "int", type, "char*", &data := 0, "uint", dataSize, "HRESULT")
        return data
    }

    /**
     * Gets the value of the property by index. This is a template overload. See Remarks. (overload 2/2)
     * @remarks
     * <pre class="syntax">template&lt;typename T, typename U&gt;
     *     HRESULT GetValue(
     *         U index,
     *         _Out_ T *value
     *         ) const;
     * </pre>
     * @param {Integer} index Type: <b>U</b>
     * 
     * The index of the property from which the value is to be obtained.
     * @param {Integer} type 
     * @param {Integer} dataSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-getvalue(u_t)
     */
    GetValue(index, type, dataSize) {
        result := ComCall(11, this, "uint", index, "int", type, "char*", &data := 0, "uint", dataSize, "HRESULT")
        return data
    }

    /**
     * Gets the size of the property value in bytes, using the property index. This is a template overload. See Remarks.
     * @remarks
     * This method returns zero if <i>index</i> does not exist.
     * 
     * 
     * 
     * 
     * <pre class="syntax">template&lt;typename U&gt;
     *     UINT32 GetValueSize(
     *         U index
     *         ) CONST;
     * </pre>
     * @param {Integer} index Type: <b>U</b>
     * 
     * The index of the property.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * This method returns size of the value in bytes, using the property index
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-getvaluesize(u)
     */
    GetValueSize(index) {
        result := ComCall(12, this, "uint", index, "uint")
        return result
    }

    /**
     * Gets the sub-properties of the provided property by index.
     * @remarks
     * If there are no sub-properties, <i>subProperties</i> will be <b>NULL</b>, and <b>D2DERR_NO_SUBPROPERTIES</b> will be returned.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The index of the  sub-properties to be retrieved.
     * @returns {ID2D1Properties} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1properties">ID2D1Properties</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the sub-properties.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1properties-getsubproperties(uint32_id2d1properties)
     */
    GetSubProperties(index) {
        result := ComCall(13, this, "uint", index, "ptr*", &subProperties := 0, "HRESULT")
        return ID2D1Properties(subProperties)
    }
}
