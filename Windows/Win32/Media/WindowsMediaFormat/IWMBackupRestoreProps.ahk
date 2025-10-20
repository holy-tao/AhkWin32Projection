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
     * 
     * @param {Pointer<UInt16>} pcProps 
     * @returns {HRESULT} 
     */
    GetPropCount(pcProps) {
        result := ComCall(3, this, "ushort*", pcProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {PWSTR} pwszName 
     * @param {Pointer<UInt16>} pcchNameLen 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetPropByIndex(wIndex, pwszName, pcchNameLen, pType, pValue, pcbLength) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(4, this, "ushort", wIndex, "ptr", pwszName, "ushort*", pcchNameLen, "int*", pType, "char*", pValue, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetPropByName(pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "int*", pType, "char*", pValue, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     */
    SetProp(pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ptr", pszName, "int", Type, "char*", pValue, "ushort", cbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pcwszName 
     * @returns {HRESULT} 
     */
    RemoveProp(pcwszName) {
        pcwszName := pcwszName is String ? StrPtr(pcwszName) : pcwszName

        result := ComCall(7, this, "ptr", pcwszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllProps() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
