#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpcSignatureCustomObjectEnumerator.ahk" { IOpcSignatureCustomObjectEnumerator }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IOpcSignatureCustomObject.ahk" { IOpcSignatureCustomObject }

/**
 * An unordered set of IOpcSignatureCustomObject interface pointers that contain the XML markup of application-specific Object elements.
 * @remarks
 * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer provides access to the XML markup of the <b>Object</b> element it represents. To access the XML markup of the  <b>Object</b> element, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobject-getxml">IOpcSignatureCustomObject::GetXml</a> method.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer is created and added to the set, the <b>Object</b>  it represents is saved when the package is saved.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer is deleted from the set, the <b>Object</b> it represents is not saved when the package is saved.
 * 
 * To create an <b>IOpcSignatureCustomObjectSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getcustomobjectset">IOpcSigningOptions::GetCustomObjectSet</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcsignaturecustomobjectset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcSignatureCustomObjectSet extends IUnknown {
    /**
     * The interface identifier for IOpcSignatureCustomObjectSet
     * @type {Guid}
     */
    static IID := Guid("{8f792ac5-7947-4e11-bc3d-2659ff046ae1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcSignatureCustomObjectSet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create        : IntPtr
        Delete        : IntPtr
        GetEnumerator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcSignatureCustomObjectSet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IOpcSignatureCustomObject interface pointer to represent an application-specific Object element in the signature, and adds the new interface to the set.
     * @remarks
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer provides access to the XML markup of the <b>Object</b> element it represents. To access the XML markup of the  <b>Object</b> element, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturecustomobject-getxml">IOpcSignatureCustomObject::GetXml</a> method.
     * 
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer is created and added to the set, the <b>Object</b>  it represents is saved when the package is saved.
     * @param {Pointer<Integer>} xmlMarkup A buffer that contains the XML markup for the <b>Object</b> element to be represented.
     * 
     * This XML markup must include the opening <b>Object</b> and closing <b>/Object</b> tags.
     * 
     * The encoding of the markup contained in <i>xmlMarkup</i> will be inferred. Inclusion of a <a href="https://docs.microsoft.com/previous-versions/ms776429(v=vs.85)">byte order mark</a> at the beginning of the buffer passed in <i>xmlMarkup</i> is optional.
     * 
     * The following encodings and <a href="https://docs.microsoft.com/previous-versions/ms776429(v=vs.85)">byte order mark</a> values are supported:<table>
     * <tr>
     * <th>Encoding</th>
     * <th>Description</th>
     * <th>Byte order mark</th>
     * </tr>
     * <tr>
     * <td>UTF8</td>
     * <td>UTF-8</td>
     * <td>EF BB BF</td>
     * </tr>
     * <tr>
     * <td>UTF16LE</td>
     * <td>UTF-16, little endian</td>
     * <td>FF FE</td>
     * </tr>
     * <tr>
     * <td>UTF16BE</td>
     * <td>UTF-16, big endian</td>
     * <td>FE FF</td>
     * </tr>
     * </table>
     * @param {Integer} count The size of the <i>xmlMarkup</i> buffer.
     * @returns {IOpcSignatureCustomObject} A new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer that represents the application-specific <b>Object</b> element.
     * 
     * This parameter can be <b>NULL</b> if a pointer to the  new interface is not needed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectset-create
     */
    Create(xmlMarkup, count) {
        xmlMarkupMarshal := xmlMarkup is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, xmlMarkupMarshal, xmlMarkup, "uint", count, "ptr*", &customObject := 0, "HRESULT")
        return IOpcSignatureCustomObject(customObject)
    }

    /**
     * Deletes a specified IOpcSignatureCustomObject interface pointer from the set.
     * @remarks
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer is deleted from the set, the <b>Object</b> it represents is not saved when the package is saved.
     * @param {IOpcSignatureCustomObject} customObject An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointer to be deleted.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
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
     * The <i>customObject</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectset-delete
     */
    Delete(customObject) {
        result := ComCall(4, this, "ptr", customObject, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of IOpcSignatureCustomObject interface pointers in the set.
     * @returns {IOpcSignatureCustomObjectEnumerator} A pointer to an enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturecustomobject">IOpcSignatureCustomObject</a> interface pointers in the set.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturecustomobjectset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(5, this, "ptr*", &customObjectEnumerator := 0, "HRESULT")
        return IOpcSignatureCustomObjectEnumerator(customObjectEnumerator)
    }

    Query(iid) {
        if (IOpcSignatureCustomObjectSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 4)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 2)
        this.vtbl.GetEnumerator := CallbackCreate(GetMethod(implObj, "GetEnumerator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.GetEnumerator)
    }
}
