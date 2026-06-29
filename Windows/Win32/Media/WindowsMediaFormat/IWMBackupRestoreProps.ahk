#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMT_ATTR_DATATYPE.ahk" { WMT_ATTR_DATATYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMBackupRestoreProps interface sets and retrieves properties required by the IWMLicenseBackup and IWMLicenseRestore interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmbackuprestoreprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMBackupRestoreProps extends IUnknown {
    /**
     * The interface identifier for IWMBackupRestoreProps
     * @type {Guid}
     */
    static IID := Guid("{3c8e0da6-996f-4ff3-a1af-4838f9377e2e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMBackupRestoreProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPropCount   : IntPtr
        GetPropByIndex : IntPtr
        GetPropByName  : IntPtr
        SetProp        : IntPtr
        RemoveProp     : IntPtr
        RemoveAllProps : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMBackupRestoreProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPropCount method retrieves the number of properties.
     * @returns {Integer} Pointer to a count of the properties.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-getpropcount
     */
    GetPropCount() {
        result := ComCall(3, this, "ushort*", &pcProps := 0, "HRESULT")
        return pcProps
    }

    /**
     * The GetPropByIndex method retrieves the name and value of a property by index.
     * @remarks
     * You should make two calls to <b>GetPropByIndex</b>. On the first call, pass <b>NULL</b> for <i>pwszName</i> and <i>pValue</i>. On return, the value pointed to by <i>pcchNameLen</i> is set to the length in wide characters of the property name (including the terminating <b>null</b> character) and the value pointed to by <i>pcbLength</i> is set to the number of bytes required to hold the property value. You can then allocate buffers of the appropriate sizes to hold the values <i>pwszName</i> and <i>pValue</i> and pass pointers to them on the second call.
     * @param {Integer} wIndex <b>WORD</b> containing the index of the property.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the name.
     * @param {Pointer<Integer>} pcchNameLen On input, contains the length of <i>pwszName</i>. On output, points to a variable containing the number of characters in <i>pwszName</i>, including the terminating <b>null</b> character.
     * @param {Pointer<WMT_ATTR_DATATYPE>} pType Pointer to a variable containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value of the property.
     * @param {Pointer<Integer>} pcbLength On input, contains the length of <i>pValue</i>. On output, points to a count of the bytes in <i>pValue</i> that are used.
     * @returns {HRESULT} The method returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-getpropbyindex
     */
    GetPropByIndex(wIndex, pwszName, pcchNameLen, pType, pValue, pcbLength) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcchNameLenMarshal := pcchNameLen is VarRef ? "ushort*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "ushort", wIndex, "ptr", pwszName, pcchNameLenMarshal, pcchNameLen, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The GetPropByName method retrieves the value of a property by name.
     * @remarks
     * You should make two calls to <b>GetPropByName</b>. On the first call, pass <b>NULL</b> as <i>pValue</i>. On return, the value pointed to by <i>pcbLength</i> is set to the buffer size required to hold the property value. Then you can allocate the required amount of memory for the buffer and pass a pointer to it as <i>pValue</i> on the second call.
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the name.
     * @param {Pointer<WMT_ATTR_DATATYPE>} pType Pointer to a variable containing one member of the <b>WMT_ATTR_DATATYPE</b> enumeration type.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value of the property.
     * @param {Pointer<Integer>} pcbLength On input, contains the length of <i>pValue</i>. On output, points to a count of the bytes in <i>pValue</i> that are used.
     * @returns {HRESULT} The method returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-getpropbyname
     */
    GetPropByName(pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The SetProp method adds a property, and specifies its name and value.
     * @remarks
     * This method is used to set properties that are needed by the other backup restorer object interfaces.
     * 
     * The following table lists the predefined properties.
     * 
     * <table>
     * <tr>
     * <th>Property name
     *             </th>
     * <th>Type
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td><b>BackupPath</b></td>
     * <td><b>String</b></td>
     * <td>Full path to the location where the backup files must be saved.</td>
     * </tr>
     * <tr>
     * <td><b>RestorePath</b></td>
     * <td><b>String</b></td>
     * <td>Full path to the location where the backup files can be found and used to restore data.</td>
     * </tr>
     * </table>
     * @param {PWSTR} pszName Pointer to a null-terminated string containing the name.
     * @param {WMT_ATTR_DATATYPE} Type Pointer to a variable containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. The current implementation of this method accepts only WMT_TYPE_STRING. Specifying a different type causes the method to return E_INVALIDARG.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value of the property.
     * @param {Integer} cbLength Length of <i>pValue</i>, in bytes.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-setprop
     */
    SetProp(pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", pszName, WMT_ATTR_DATATYPE, Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * The RemoveProp method removes a property specified by name.
     * @param {PWSTR} pcwszName Specifies the name of the property to be removed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-removeprop
     */
    RemoveProp(pcwszName) {
        pcwszName := pcwszName is String ? StrPtr(pcwszName) : pcwszName

        result := ComCall(7, this, "ptr", pcwszName, "HRESULT")
        return result
    }

    /**
     * The RemoveAllProps method removes all properties.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-removeallprops
     */
    RemoveAllProps() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMBackupRestoreProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropCount := CallbackCreate(GetMethod(implObj, "GetPropCount"), flags, 2)
        this.vtbl.GetPropByIndex := CallbackCreate(GetMethod(implObj, "GetPropByIndex"), flags, 7)
        this.vtbl.GetPropByName := CallbackCreate(GetMethod(implObj, "GetPropByName"), flags, 5)
        this.vtbl.SetProp := CallbackCreate(GetMethod(implObj, "SetProp"), flags, 5)
        this.vtbl.RemoveProp := CallbackCreate(GetMethod(implObj, "RemoveProp"), flags, 2)
        this.vtbl.RemoveAllProps := CallbackCreate(GetMethod(implObj, "RemoveAllProps"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropCount)
        CallbackFree(this.vtbl.GetPropByIndex)
        CallbackFree(this.vtbl.GetPropByName)
        CallbackFree(this.vtbl.SetProp)
        CallbackFree(this.vtbl.RemoveProp)
        CallbackFree(this.vtbl.RemoveAllProps)
    }
}
