#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WMDM_TAG_DATATYPE.ahk" { WMDM_TAG_DATATYPE }

/**
 * The IWMDMMetaData interface sets and retrieves metadata properties (such as artist, album, genre, and so on) of a storage.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmmetadata
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMMetaData extends IUnknown {
    /**
     * The interface identifier for IWMDMMetaData
     * @type {Guid}
     */
    static IID := Guid("{ec3b0663-0951-460a-9a80-0dceed3c043c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMMetaData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddItem      : IntPtr
        QueryByName  : IntPtr
        QueryByIndex : IntPtr
        GetItemCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMMetaData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AddItem method adds a metadata property to the interface.
     * @param {WMDM_TAG_DATATYPE} Type An <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-tag-datatype">WMDM_TAG_DATATYPE</a> enumerated value specifying the type of metadata being saved.
     * @param {PWSTR} pwszTagName Pointer to a wide-character, null-terminated string specifying the name of the property to set. A list of standard property name constants is given in <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * @param {Pointer<Integer>} pValue Pointer to a byte array specifying the value to assign to the property. The submitted value is copied, so the memory can be freed after calling <b>AddItem</b>.
     * @param {Integer} iLength Integer specifying the size of <i>pValue</i>, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmmetadata-additem
     */
    AddItem(Type, pwszTagName, pValue, iLength) {
        pwszTagName := pwszTagName is String ? StrPtr(pwszTagName) : pwszTagName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, WMDM_TAG_DATATYPE, Type, "ptr", pwszTagName, pValueMarshal, pValue, "uint", iLength, "HRESULT")
        return result
    }

    /**
     * The QueryByName method retrieves the value of a property specified by name.
     * @param {PWSTR} pwszTagName Pointer to a wide-character <b>null</b>-terminated string specifying the property name. A list of standard property name constants is given in <a href="https://docs.microsoft.com/windows/desktop/WMDM/metadata-constants">Metadata Constants</a>.
     * @param {Pointer<WMDM_TAG_DATATYPE>} pType An <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-tag-datatype">WMDM_TAG_DATATYPE</a> enumerated value describing the type of data retrieved by <i>pValue</i>.
     * @param {Pointer<Pointer<Integer>>} pValue Pointer to a pointer to a byte array that receives the content of the value if the method succeeds. Windows Media Device Manager allocates this memory and the caller must free it using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pcbLength Pointer to the size, in bytes, of the byte array <i>ppValue</i>. If the value is a string, this includes the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmmetadata-querybyname
     */
    QueryByName(pwszTagName, pType, pValue, pcbLength) {
        pwszTagName := pwszTagName is String ? StrPtr(pwszTagName) : pwszTagName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "ptr*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwszTagName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The QueryByIndex method retrieves the value of a property specified by index.
     * @param {Integer} iIndex Integer specifying the zero-based index of the property. The number of items is obtained through the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmmetadata-getitemcount">GetItemCount</a> call.
     * @param {Pointer<Pointer<Integer>>} ppwszName Name of the property. Windows Media Device Manager allocates this memory, and the caller must free it using <b>CoTaskMemFree</b>.
     * @param {Pointer<WMDM_TAG_DATATYPE>} pType An <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-tag-datatype">WMDM_TAG_DATATYPE</a> enumerated value describing the type of data returned in <i>ppValue</i>.
     * @param {Pointer<Pointer<Integer>>} ppValue Pointer to a pointer to a byte array that receives the content of the value if the method succeeds. This memory is allocated by Windows Media Device Manager, and the caller must free it using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pcbLength Pointer to the size, in bytes, of the byte array <i>ppValue</i>. If the value is a string, this includes the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmmetadata-querybyindex
     */
    QueryByIndex(iIndex, ppwszName, pType, ppValue, pcbLength) {
        ppwszNameMarshal := ppwszName is VarRef ? "ptr*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", iIndex, ppwszNameMarshal, ppwszName, pTypeMarshal, pType, ppValueMarshal, ppValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The GetItemCount method retrieves the total number of properties held by the interface.
     * @remarks
     * This method could be used along with <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmmetadata-querybyindex">QueryByIndex</a> to enumerate all properties on a storage or device.
     * @returns {Integer} Pointer to an integer that receives the total number of metadata properties stored by the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmmetadata-getitemcount
     */
    GetItemCount() {
        result := ComCall(6, this, "uint*", &iCount := 0, "HRESULT")
        return iCount
    }

    Query(iid) {
        if (IWMDMMetaData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddItem := CallbackCreate(GetMethod(implObj, "AddItem"), flags, 5)
        this.vtbl.QueryByName := CallbackCreate(GetMethod(implObj, "QueryByName"), flags, 5)
        this.vtbl.QueryByIndex := CallbackCreate(GetMethod(implObj, "QueryByIndex"), flags, 6)
        this.vtbl.GetItemCount := CallbackCreate(GetMethod(implObj, "GetItemCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddItem)
        CallbackFree(this.vtbl.QueryByName)
        CallbackFree(this.vtbl.QueryByIndex)
        CallbackFree(this.vtbl.GetItemCount)
    }
}
