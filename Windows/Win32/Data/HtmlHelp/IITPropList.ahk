#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CProperty.ahk" { CProperty }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IPersistStreamInit.ahk" { IPersistStreamInit }

/**
 * Use this interface to set properties for build objects such as word wheels and indexes. Call these methods in the document build process to define properties for all build objects.
 * @see https://learn.microsoft.com/windows/win32/api/infotech/nn-infotech-iitproplist
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct IITPropList extends IPersistStreamInit {
    /**
     * The interface identifier for IITPropList
     * @type {Guid}
     */
    static IID := Guid("{1f403bb1-9997-11d0-a850-00aa006c7d01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IITPropList interfaces
    */
    struct Vtbl extends IPersistStreamInit.Vtbl {
        Set              : IntPtr
        Set1             : IntPtr
        Set2             : IntPtr
        Add              : IntPtr
        Get              : IntPtr
        Clear            : IntPtr
        SetPersist       : IntPtr
        SetPersist1      : IntPtr
        GetFirst         : IntPtr
        GetNext          : IntPtr
        GetPropCount     : IntPtr
        SaveHeader       : IntPtr
        SaveData         : IntPtr
        GetHeaderSize    : IntPtr
        GetDataSize      : IntPtr
        SaveDataToStream : IntPtr
        LoadFromMem      : IntPtr
        SaveToMem        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IITPropList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a property to a given value or deletes a property from the list. (overload 2/3)
     * @remarks
     * Use this method to set properties stored in a buffer.
     * @param {Integer} PropID ID of the property to set.
     * @param {PWSTR} lpszwString 
     * @param {Integer} dwOperation The operation you want to perform. Can be any of the following flags: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROP_ADD"></a><a id="prop_add"></a><dl>
     * <dt><b>PROP_ADD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Add property to list
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROP_DELETE"></a><a id="prop_delete"></a><dl>
     * <dt><b>PROP_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remove property from list
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROP_UPDATE"></a><a id="prop_update"></a><dl>
     * <dt><b>PROP_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Update property in list
     * 
     * </td>
     * </tr>
     * </table>
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
     * The property list was successfully set.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_DUPLICATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property already exists in the list (applies to adding).
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be allocated when adding a property.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property does not exist (applies to deleting and updating).
     * 
     * 
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
     * The specified operation is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-set(propid_lpvoid_dword_dword)
     */
    Set(PropID, lpszwString, dwOperation) {
        lpszwString := lpszwString is String ? StrPtr(lpszwString) : lpszwString

        result := ComCall(9, this, "uint", PropID, "ptr", lpszwString, "uint", dwOperation, "HRESULT")
        return result
    }

    /**
     * Sets a property to a given value or deletes a property from the list. (overload 2/3)
     * @remarks
     * Use this method to set properties stored in a buffer.
     * @param {Integer} PropID ID of the property to set.
     * @param {Pointer<Void>} lpvData Pointer to the buffer containing data.
     * @param {Integer} cbData Length of the buffer.
     * @param {Integer} dwOperation The operation you want to perform. Can be any of the following flags: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROP_ADD"></a><a id="prop_add"></a><dl>
     * <dt><b>PROP_ADD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Add property to list
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROP_DELETE"></a><a id="prop_delete"></a><dl>
     * <dt><b>PROP_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remove property from list
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROP_UPDATE"></a><a id="prop_update"></a><dl>
     * <dt><b>PROP_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Update property in list
     * 
     * </td>
     * </tr>
     * </table>
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
     * The property list was successfully set.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_DUPLICATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property already exists in the list (applies to adding).
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be allocated when adding a property.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property does not exist (applies to deleting and updating).
     * 
     * 
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
     * The specified operation is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-set(propid_lpvoid_dword_dword)
     */
    Set1(PropID, lpvData, cbData, dwOperation) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", PropID, lpvDataMarshal, lpvData, "uint", cbData, "uint", dwOperation, "HRESULT")
        return result
    }

    /**
     * Sets a property to a given value or deletes a property from the list. (overload 2/3)
     * @remarks
     * Use this method to set properties stored in a buffer.
     * @param {Integer} PropID ID of the property to set.
     * @param {Integer} dwData 
     * @param {Integer} dwOperation The operation you want to perform. Can be any of the following flags: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROP_ADD"></a><a id="prop_add"></a><dl>
     * <dt><b>PROP_ADD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Add property to list
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROP_DELETE"></a><a id="prop_delete"></a><dl>
     * <dt><b>PROP_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remove property from list
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROP_UPDATE"></a><a id="prop_update"></a><dl>
     * <dt><b>PROP_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Update property in list
     * 
     * </td>
     * </tr>
     * </table>
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
     * The property list was successfully set.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_DUPLICATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property already exists in the list (applies to adding).
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be allocated when adding a property.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property does not exist (applies to deleting and updating).
     * 
     * 
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
     * The specified operation is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-set(propid_lpvoid_dword_dword)
     */
    Set2(PropID, dwData, dwOperation) {
        result := ComCall(11, this, "uint", PropID, "uint", dwData, "uint", dwOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} Prop 
     * @returns {HRESULT} 
     */
    Add(Prop) {
        result := ComCall(12, this, CProperty.Ptr, Prop, "HRESULT")
        return result
    }

    /**
     * Returns the property object associated with the given property ID.
     * @param {Integer} PropID ID of the property object to get.
     * @param {Pointer<CProperty>} _Property The property object returned.
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
     * The property was successfully returned.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested property does not exist.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-get
     */
    Get(PropID, _Property) {
        result := ComCall(13, this, "uint", PropID, CProperty.Ptr, _Property, "HRESULT")
        return result
    }

    /**
     * Clears memory associated with a property list and reinitializes the list.
     * @remarks
     * Call this method to clear a property list without requiring the list to be destroyed before it is used again.
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
     * The property list was cleared.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-clear
     */
    Clear() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Sets the persistence state on or off for a given property.
     * @remarks
     * By default, properties are created with a persistence state of TRUE.
     * @param {BOOL} fPersist Persistence state. If TRUE, the persistence state is on; if FALSE, the state is off.
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
     * The state was successfully set.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested property does not exist.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-setpersist(propid_bool)
     */
    SetPersist(fPersist) {
        result := ComCall(15, this, BOOL, fPersist, "HRESULT")
        return result
    }

    /**
     * Sets the persistence state on or off for a given property.
     * @remarks
     * By default, properties are created with a persistence state of TRUE.
     * @param {Integer} PropID ID of the property to set.
     * @param {BOOL} fPersist Persistence state. If TRUE, the persistence state is on; if FALSE, the state is off.
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
     * The state was successfully set.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested property does not exist.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-setpersist(propid_bool)
     */
    SetPersist1(PropID, fPersist) {
        result := ComCall(16, this, "uint", PropID, BOOL, fPersist, "HRESULT")
        return result
    }

    /**
     * Returns the first property object in a property list.
     * @param {Pointer<CProperty>} _Property The property object returned.
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
     * The property was successfully returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested property does not exist.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-getfirst
     */
    GetFirst(_Property) {
        result := ComCall(17, this, CProperty.Ptr, _Property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CProperty>} _Property 
     * @returns {HRESULT} 
     */
    GetNext(_Property) {
        result := ComCall(18, this, CProperty.Ptr, _Property, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} cProp 
     * @returns {HRESULT} 
     */
    GetPropCount(cProp) {
        cPropMarshal := cProp is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, cPropMarshal, cProp, "HRESULT")
        return result
    }

    /**
     * Saves the property ID and data type from the property list to a buffer. Only saves properties marked with a persistence state of TRUE.
     * @remarks
     * Make sure to pass a buffer large enough to hold the property list. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/infotech/nf-infotech-iitproplist-getheadersize">IITPropList::GetHeaderSize</a> to determine the buffer size to pass.
     * @param {Pointer<Void>} lpvData Pointer to a buffer to fill.
     * @param {Integer} dwHdrSize Size of the buffer.
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
     * The property list was successfully saved.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-saveheader
     */
    SaveHeader(lpvData, dwHdrSize) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, lpvDataMarshal, lpvData, "uint", dwHdrSize, "HRESULT")
        return result
    }

    /**
     * Saves the data size and data from the property list to a buffer.
     * @remarks
     * Make sure to pass a buffer large enough to hold the property list. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/infotech/nf-infotech-iitproplist-getdatasize">IITPropList::GetDataSize</a> to determine the buffer size to pass.
     * @param {Pointer<Void>} lpvHeader Pointer to a buffer containing the header.
     * @param {Integer} dwHdrSize Size of the buffer containing the header.
     * @param {Pointer<Void>} lpvData Pointer to a buffer to fill.
     * @param {Integer} dwBufSize Size of the buffer to fill.
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
     * The property list was successfully saved.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-savedata
     */
    SaveData(lpvHeader, dwHdrSize, lpvData, dwBufSize) {
        lpvHeaderMarshal := lpvHeader is VarRef ? "ptr" : "ptr"
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(21, this, lpvHeaderMarshal, lpvHeader, "uint", dwHdrSize, lpvDataMarshal, lpvData, "uint", dwBufSize, "HRESULT")
        return result
    }

    /**
     * Returns the number of bytes needed to save the header.
     * @param {Pointer<Integer>} dwHdrSize Size, in bytes.
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
     * The size was successfully returned. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-getheadersize
     */
    GetHeaderSize(dwHdrSize) {
        dwHdrSizeMarshal := dwHdrSize is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, dwHdrSizeMarshal, dwHdrSize, "HRESULT")
        return result
    }

    /**
     * Returns the number of bytes needed to save the property data.
     * @param {Pointer<Void>} lpvHeader Pointer to a buffer containing the header.
     * @param {Integer} dwHdrSize Size of the header buffer.
     * @param {Pointer<Integer>} dwDataSize Size in bytes.
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
     * The size was successfully returned. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpvHeader</i> parameter is NULL, or <i>dwHdrSize</i> is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BADVALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid header buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitproplist-getdatasize
     */
    GetDataSize(lpvHeader, dwHdrSize, dwDataSize) {
        lpvHeaderMarshal := lpvHeader is VarRef ? "ptr" : "ptr"
        dwDataSizeMarshal := dwDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, lpvHeaderMarshal, lpvHeader, "uint", dwHdrSize, dwDataSizeMarshal, dwDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHeader 
     * @param {Integer} dwHdrSize 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     */
    SaveDataToStream(lpvHeader, dwHdrSize, pStream) {
        lpvHeaderMarshal := lpvHeader is VarRef ? "ptr" : "ptr"

        result := ComCall(24, this, lpvHeaderMarshal, lpvHeader, "uint", dwHdrSize, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    LoadFromMem(lpvData, dwBufSize) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(25, this, lpvDataMarshal, lpvData, "uint", dwBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} 
     */
    SaveToMem(lpvData, dwBufSize) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(26, this, lpvDataMarshal, lpvData, "uint", dwBufSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IITPropList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Set := CallbackCreate(GetMethod(implObj, "Set"), flags, 4)
        this.vtbl.Set1 := CallbackCreate(GetMethod(implObj, "Set1"), flags, 5)
        this.vtbl.Set2 := CallbackCreate(GetMethod(implObj, "Set2"), flags, 4)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 3)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.SetPersist := CallbackCreate(GetMethod(implObj, "SetPersist"), flags, 2)
        this.vtbl.SetPersist1 := CallbackCreate(GetMethod(implObj, "SetPersist1"), flags, 3)
        this.vtbl.GetFirst := CallbackCreate(GetMethod(implObj, "GetFirst"), flags, 2)
        this.vtbl.GetNext := CallbackCreate(GetMethod(implObj, "GetNext"), flags, 2)
        this.vtbl.GetPropCount := CallbackCreate(GetMethod(implObj, "GetPropCount"), flags, 2)
        this.vtbl.SaveHeader := CallbackCreate(GetMethod(implObj, "SaveHeader"), flags, 3)
        this.vtbl.SaveData := CallbackCreate(GetMethod(implObj, "SaveData"), flags, 5)
        this.vtbl.GetHeaderSize := CallbackCreate(GetMethod(implObj, "GetHeaderSize"), flags, 2)
        this.vtbl.GetDataSize := CallbackCreate(GetMethod(implObj, "GetDataSize"), flags, 4)
        this.vtbl.SaveDataToStream := CallbackCreate(GetMethod(implObj, "SaveDataToStream"), flags, 4)
        this.vtbl.LoadFromMem := CallbackCreate(GetMethod(implObj, "LoadFromMem"), flags, 3)
        this.vtbl.SaveToMem := CallbackCreate(GetMethod(implObj, "SaveToMem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Set)
        CallbackFree(this.vtbl.Set1)
        CallbackFree(this.vtbl.Set2)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.SetPersist)
        CallbackFree(this.vtbl.SetPersist1)
        CallbackFree(this.vtbl.GetFirst)
        CallbackFree(this.vtbl.GetNext)
        CallbackFree(this.vtbl.GetPropCount)
        CallbackFree(this.vtbl.SaveHeader)
        CallbackFree(this.vtbl.SaveData)
        CallbackFree(this.vtbl.GetHeaderSize)
        CallbackFree(this.vtbl.GetDataSize)
        CallbackFree(this.vtbl.SaveDataToStream)
        CallbackFree(this.vtbl.LoadFromMem)
        CallbackFree(this.vtbl.SaveToMem)
    }
}
