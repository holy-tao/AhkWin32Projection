#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CALPOLESTR.ahk" { CALPOLESTR }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CADWORD.ahk" { CADWORD }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Retrieves the information in the property pages offered by an object.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iperpropertybrowsing
 * @namespace Windows.Win32.System.Ole
 */
export default struct IPerPropertyBrowsing extends IUnknown {
    /**
     * The interface identifier for IPerPropertyBrowsing
     * @type {Guid}
     */
    static IID := Guid("{376bd3aa-3845-101b-84ed-08002b2ec713}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPerPropertyBrowsing interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDisplayString     : IntPtr
        MapPropertyToPage    : IntPtr
        GetPredefinedStrings : IntPtr
        GetPredefinedValue   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPerPropertyBrowsing.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a text string describing the specified property.
     * @param {Integer} dispID The dispatch identifier of the property whose display name is requested.
     * @returns {BSTR} A pointer to a variable that receives the display name for the property identified in <i>dispID</i>. The string is allocated by this method using <b>SysAllocString</b>. Upon return, the string is the responsibility of the caller, which must free it with <b>SysFreeString</b> when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iperpropertybrowsing-getdisplaystring
     */
    GetDisplayString(dispID) {
        pBstr := BSTR.Owned()
        result := ComCall(3, this, "int", dispID, BSTR.Ptr, pBstr, "HRESULT")
        return pBstr
    }

    /**
     * Retrieves the CLSID of the property page associated with the specified property.
     * @remarks
     * The CLSID returned from this method can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepropertyframeindirect">OleCreatePropertyFrameIndirect</a> to specify the initial page to display in the property sheet.
     * @param {Integer} dispID The dispatch identifier of the property.
     * @returns {Guid} A pointer to the CLSID identifying the property page associated with the property specified by <i>dispID</i>. If this method fails, *<i>pClsid</i> is set to CLSID_NULL.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iperpropertybrowsing-mappropertytopage
     */
    MapPropertyToPage(dispID) {
        pClsid := Guid()
        result := ComCall(4, this, "int", dispID, Guid.Ptr, pClsid, "HRESULT")
        return pClsid
    }

    /**
     * Retrieves an array description strings for the allowable values that the specified property can accept.
     * @remarks
     * Each string returned in the array pointed to by <i>pCaStringsOut</i> has a matching token in the counted array pointed to by <i>pCaCookiesOut</i>, where the token can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue">IPerPropertyBrowsing::GetPredefinedValue</a> to get the actual value (a <b>VARIANT</b>) corresponding to the string.
     * 
     * Using the predefined strings, a caller can obtain a list of strings for populating user interface elements, such as a drop-down listbox. When the end user selects one of these strings as a value to assign to a property, the caller can then obtain the corresponding value through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue">IPerPropertyBrowsing::GetPredefinedValue</a>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Both the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-calpolestr">CALPOLESTR</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-cadword">CADWORD</a> structures passed to this method are caller-allocated. The caller is responsible for freeing each string pointed to from the <b>CALPOLESTR</b> array as well as the <b>CALPOLESTR</b> structure.
     * 
     * All memory is allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. The caller is responsible for freeing the strings and the array with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * 
     * Upon return from this method, the caller is responsible for all this memory and must free it when it is no longer needed. Code to achieve this appears as follows.
     * 
     * 
     * ``` syntax
     * CALPOLESTR     castr; 
     * CWDWORD        cadw; 
     * ULONG          i; 
     *  
     * pIPerPropertyBrowsing-&gt;GetPredefinedStrings(dispID, &amp;castr, &amp;cadw); 
     *  
     * //...Use the strings and the cookies 
     *  
     * CoTaskMemFree((void *)cadw.pElems); 
     *  
     * for (i=0; i &lt; castr.cElems; i++) 
     *     CoTaskMemFree((void *)castr.pElems[i]); 
     *  
     * CoTaskMemFree((void *)castr.pElems); 
     * 
     * ```
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Support for predefined names and values is not required. If your object does not support these names, return E_NOTIMPL from this method. If this method is not implemented, <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue">IPerPropertyBrowsing::GetPredefinedValue</a> must not be implemented either.
     * 
     * This method fills the <b>cElems</b> and <b>pElems</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-cadword">CADWORD</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-calpolestr">CALPOLESTR</a> structures. It allocates the arrays pointed to by these structures with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and fills those arrays. In the <b>CALPOLESTR</b> case, this method also allocates each string with <b>CoTaskMemAlloc</b>, storing each string pointer in the array.
     * @param {Integer} dispID The dispatch identifier of the property.
     * @param {Pointer<CALPOLESTR>} pCaStringsOut A pointer to a caller-allocated, counted array structure that contains the element count and address of a method-allocated array of string pointers. This method also allocates memory for the string values containing the predefined names, and it stores the string pointers in the array. If the method fails, no memory is allocated, and the contents of the structure are undefined.
     * @param {Pointer<CADWORD>} pCaCookiesOut A pointer to the caller-allocated, counted array structure that contains the element count and address of a method-allocated array of <b>DWORD</b> values. The values in the array can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue">IPerPropertyBrowsing::GetPredefinedValue</a> to retrieve the value associated with the name in the same array position inside <i>pCaStringsOut</i>. If the method fails, no memory is allocated, and the contents of the structure are undefined.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not implemented and predefined names are not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>pCaStringsOut</i> or <i>pCaCookiesOut</i> is not valid. For example, either parameter may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedstrings
     */
    GetPredefinedStrings(dispID, pCaStringsOut, pCaCookiesOut) {
        result := ComCall(5, this, "int", dispID, CALPOLESTR.Ptr, pCaStringsOut, CADWORD.Ptr, pCaCookiesOut, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of the specified property that is associated with a predefined string name.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The caller is responsible for freeing any allocations contained in the <b>VARIANT</b>. Unless the <b>vt</b> member of <b>VARIANT</b> is VT_VARIANT, the caller can free memory using a single call to <b>VariantClear</b>. Otherwise, the caller must recursively free the contained <b>VARIANT</b> values before freeing the outer <b>VARIANT</b>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Support for predefined names and values is not required. If your object does not support these names, return E_NOTIMPL from this method. If this method is not implemented, <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedstrings">IPerPropertyBrowsing::GetPredefinedStrings</a> must not be implemented either.
     * 
     * This method allocates any memory needed inside the <b>VARIANT</b>.
     * @param {Integer} dispID The dispatch identifier of the property for which a predefined value is requested.
     * @param {Integer} dwCookie A token identifying which value to return. The token was previously returned in the <i>pCaCookiesOut</i> array filled by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedstrings">GetPredefinedStrings</a>.
     * @returns {VARIANT} A pointer to the <b>VARIANT</b> value for the property.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue
     */
    GetPredefinedValue(dispID, dwCookie) {
        pVarOut := VARIANT()
        result := ComCall(6, this, "int", dispID, "uint", dwCookie, VARIANT.Ptr, pVarOut, "HRESULT")
        return pVarOut
    }

    Query(iid) {
        if (IPerPropertyBrowsing.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDisplayString := CallbackCreate(GetMethod(implObj, "GetDisplayString"), flags, 3)
        this.vtbl.MapPropertyToPage := CallbackCreate(GetMethod(implObj, "MapPropertyToPage"), flags, 3)
        this.vtbl.GetPredefinedStrings := CallbackCreate(GetMethod(implObj, "GetPredefinedStrings"), flags, 4)
        this.vtbl.GetPredefinedValue := CallbackCreate(GetMethod(implObj, "GetPredefinedValue"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDisplayString)
        CallbackFree(this.vtbl.MapPropertyToPage)
        CallbackFree(this.vtbl.GetPredefinedStrings)
        CallbackFree(this.vtbl.GetPredefinedValue)
    }
}
