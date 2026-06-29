#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IStream.ahk" { IStream }
#Import "..\CO_MARSHALING_CONTEXT_ATTRIBUTES.ahk" { CO_MARSHALING_CONTEXT_ATTRIBUTES }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IMarshalingStream (objidlbase.h) interface provides additional information about the marshaling context to custom-marshaled objects and unmarshalers.
 * @remarks
 * Implement <b>IMarshalingStream</b> interface if you have <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> implementations that call the marshaling APIs and provide the correct value of any of the attributes. This is essential only for <b>IStream</b> implementations that are used in hybrid policy processes.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-imarshalingstream
 * @namespace Windows.Win32.System.Com.Marshal
 */
export default struct IMarshalingStream extends IStream {
    /**
     * The interface identifier for IMarshalingStream
     * @type {Guid}
     */
    static IID := Guid("{d8f2f5e6-6102-4863-9f26-389a4676efde}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMarshalingStream interfaces
    */
    struct Vtbl extends IStream.Vtbl {
        GetMarshalingContextAttribute : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMarshalingStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IMarshalingStream::GetMarshalingContextAttribute (objidlbase.h) method gets information about the marshaling context.
     * @remarks
     * Each possible value of the attribute parameter is paired with the data type of the attribute this identifies.
     * 
     * You can query the following attributes with this method.
     * 
     * <table>
     * <tr>
     * <th>Attribute</th>
     * <th>Values</th>
     * </tr>
     * <tr>
     * <td>
     * CO_MARSHALING_SOURCE_IS_APP_CONTAINER
     * 
     * </td>
     * <td>
     * This attribute is a boolean value, with 0 representing <b>TRUE</b> and nonzero representing <b>FALSE</b>. You can safely cast the value of the result to <b>BOOL</b>, but it isn't safe for the caller to cast a <b>BOOL*</b> to <b>ULONG_PTR*</b> for the <i>pAttributeValue</i> parameter, or for the implementation to cast <i>pAttributeValue</i> to <b>BOOL*</b> when setting it.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @param {CO_MARSHALING_CONTEXT_ATTRIBUTES} attribute The attribute to query.
     * @returns {Pointer} The value of <i>attribute</i>.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-imarshalingstream-getmarshalingcontextattribute
     */
    GetMarshalingContextAttribute(attribute) {
        result := ComCall(14, this, CO_MARSHALING_CONTEXT_ATTRIBUTES, attribute, "ptr*", &pAttributeValue := 0, "HRESULT")
        return pAttributeValue
    }

    Query(iid) {
        if (IMarshalingStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMarshalingContextAttribute := CallbackCreate(GetMethod(implObj, "GetMarshalingContextAttribute"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMarshalingContextAttribute)
    }
}
