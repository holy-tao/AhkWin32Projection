#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMBackupRestoreProps interface sets and retrieves properties required by the IWMLicenseBackup and IWMLicenseRestore interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmbackuprestoreprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMBackupRestoreProps extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMBackupRestoreProps
     * @type {Guid}
     */
    static IID => Guid("{3c8e0da6-996f-4ff3-a1af-4838f9377e2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropCount", "GetPropByIndex", "GetPropByName", "SetProp", "RemoveProp", "RemoveAllProps"]

    /**
     * The GetPropCount method retrieves the number of properties.
     * @returns {Integer} Pointer to a count of the properties.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-getpropcount
     */
    GetPropCount() {
        result := ComCall(3, this, "ushort*", &pcProps := 0, "HRESULT")
        return pcProps
    }

    /**
     * The GetPropByIndex method retrieves the name and value of a property by index.
     * @param {Integer} wIndex <b>WORD</b> containing the index of the property.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the name.
     * @param {Pointer<Integer>} pcchNameLen On input, contains the length of <i>pwszName</i>. On output, points to a variable containing the number of characters in <i>pwszName</i>, including the terminating <b>null</b> character.
     * @param {Pointer<Integer>} pType Pointer to a variable containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value of the property.
     * @param {Pointer<Integer>} pcbLength On input, contains the length of <i>pValue</i>. On output, points to a count of the bytes in <i>pValue</i> that are used.
     * @returns {HRESULT} The method returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-getpropbyindex
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
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the name.
     * @param {Pointer<Integer>} pType Pointer to a variable containing one member of the <b>WMT_ATTR_DATATYPE</b> enumeration type.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value of the property.
     * @param {Pointer<Integer>} pcbLength On input, contains the length of <i>pValue</i>. On output, points to a count of the bytes in <i>pValue</i> that are used.
     * @returns {HRESULT} The method returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-getpropbyname
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
     * @param {PWSTR} pszName Pointer to a null-terminated string containing the name.
     * @param {Integer} Type Pointer to a variable containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. The current implementation of this method accepts only WMT_TYPE_STRING. Specifying a different type causes the method to return E_INVALIDARG.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value of the property.
     * @param {Integer} cbLength Length of <i>pValue</i>, in bytes.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-setprop
     */
    SetProp(pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * The RemoveProp method removes a property specified by name.
     * @param {PWSTR} pcwszName Specifies the name of the property to be removed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-removeprop
     */
    RemoveProp(pcwszName) {
        pcwszName := pcwszName is String ? StrPtr(pcwszName) : pcwszName

        result := ComCall(7, this, "ptr", pcwszName, "HRESULT")
        return result
    }

    /**
     * The RemoveAllProps method removes all properties.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-removeallprops
     */
    RemoveAllProps() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
