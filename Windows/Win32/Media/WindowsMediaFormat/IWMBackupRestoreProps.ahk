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
     * 
     * @param {Pointer<Integer>} pcProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-getpropcount
     */
    GetPropCount(pcProps) {
        pcPropsMarshal := pcProps is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, pcPropsMarshal, pcProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pcchNameLen 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-setprop
     */
    SetProp(pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pcwszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-removeprop
     */
    RemoveProp(pcwszName) {
        pcwszName := pcwszName is String ? StrPtr(pcwszName) : pcwszName

        result := ComCall(7, this, "ptr", pcwszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmbackuprestoreprops-removeallprops
     */
    RemoveAllProps() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
