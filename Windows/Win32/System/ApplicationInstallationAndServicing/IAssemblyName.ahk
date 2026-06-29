#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAssemblyName interface represents a side-by-side assembly name.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/nn-winsxs-iassemblyname
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IAssemblyName extends IUnknown {
    /**
     * The interface identifier for IAssemblyName
     * @type {Guid}
     */
    static IID := Guid("{cd193bc0-b4bc-11d2-9833-00c04fc31d2e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAssemblyName interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetProperty    : IntPtr
        GetProperty    : IntPtr
        Finalize       : IntPtr
        GetDisplayName : IntPtr
        Reserved       : IntPtr
        GetName        : IntPtr
        GetVersion     : IntPtr
        IsEqual        : IntPtr
        Clone          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAssemblyName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetProperty method adds a name-value pair to the side-by-side assembly name. This method can change or delete the value of an existing name-value pair.
     * @param {Integer} PropertyId A property ID that represents the name-value pair. Valid property IDs are <a href="https://docs.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_name">ASM_NAME</a> enumeration values.
     * @param {Pointer<Void>} pvProperty A pointer to a buffer that contains the value of the name-value pair.
     * @param {Integer} cbProperty The size in bytes of the buffer specified by <i>pvProperty</i>. Set the value of this parameter to zero to remove the name-value pair from the assembly name.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
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
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method did not succeed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_UNEXPECTED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method did not succeed. The <a href="https://docs.microsoft.com/windows/desktop/api/winsxs/nf-winsxs-iassemblyname-setproperty">SetProperty</a> method was called after the <a href="https://docs.microsoft.com/windows/desktop/api/winsxs/nf-winsxs-iassemblyname-finalize">Finalize</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-setproperty
     */
    SetProperty(PropertyId, pvProperty, cbProperty) {
        pvPropertyMarshal := pvProperty is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", PropertyId, pvPropertyMarshal, pvProperty, "uint", cbProperty, "HRESULT")
        return result
    }

    /**
     * The GetProperty method gets the value of a name-value pair in the assembly name.
     * @param {Integer} PropertyId A property ID that represents the name-value pair. Valid property IDs are <a href="https://docs.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_name">ASM_NAME</a> enumeration values.
     * @param {Pointer<Void>} pvProperty A pointer to a buffer that receives the value of the name-value pair.
     * @param {Pointer<Integer>} pcbProperty The size in bytes of the buffer specified by <i>pvProperty</i>. The value is zero if this property is not set.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
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
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-getproperty
     */
    GetProperty(PropertyId, pvProperty, pcbProperty) {
        pvPropertyMarshal := pvProperty is VarRef ? "ptr" : "ptr"
        pcbPropertyMarshal := pcbProperty is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", PropertyId, pvPropertyMarshal, pvProperty, pcbPropertyMarshal, pcbProperty, "HRESULT")
        return result
    }

    /**
     * The Finalize method prevents a side-by-side assembly name from being changed. After Finalize is called, additional calls to the SetProperty returns E_UNEXPECTED.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
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
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-finalize
     */
    Finalize() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The GetDisplayName method gets a string representation of the side-by-side assembly name.
     * @param {PWSTR} szDisplayName A pointer to a buffer that receives the string value that contains the assembly name.
     * @param {Pointer<Integer>} pccDisplayName When calling this method, set this parameter to the size of the buffer specified by <b>szDisplayName</b>. Specify the size in characters and include the null terminator. When the method returns, the value of <i>pccDisplayName</i> is the size of the name returned.
     * @param {Integer} dwDisplayFlags One or more of the options of the <a href="https://docs.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_display_flags">ASM_DISPLAY_FLAGS</a> enumeration to specify which portions of the assembly's name to include in the string representation of the assembly name. The default for <i>dwDisplayFlags</i> is 0, which returns all portions of the assembly's display name.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
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
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-getdisplayname
     */
    GetDisplayName(szDisplayName, pccDisplayName, dwDisplayFlags) {
        szDisplayName := szDisplayName is String ? StrPtr(szDisplayName) : szDisplayName

        pccDisplayNameMarshal := pccDisplayName is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", szDisplayName, pccDisplayNameMarshal, pccDisplayName, "uint", dwDisplayFlags, "HRESULT")
        return result
    }

    /**
     * The following words are reserved for use by the HLSL language. Do not use them to name variables or functions in your HLSL code.
     * @param {Pointer<Guid>} refIID 
     * @param {IUnknown} pUnkReserved1 
     * @param {IUnknown} pUnkReserved2 
     * @param {PWSTR} szReserved 
     * @param {Integer} llReserved 
     * @param {Pointer<Void>} pvReserved 
     * @param {Integer} cbReserved 
     * @param {Pointer<Pointer<Void>>} ppReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-appendix-reserved-words
     */
    Reserved(refIID, pUnkReserved1, pUnkReserved2, szReserved, llReserved, pvReserved, cbReserved, ppReserved) {
        szReserved := szReserved is String ? StrPtr(szReserved) : szReserved

        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"
        ppReservedMarshal := ppReserved is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, Guid.Ptr, refIID, "ptr", pUnkReserved1, "ptr", pUnkReserved2, "ptr", szReserved, "int64", llReserved, pvReservedMarshal, pvReserved, "uint", cbReserved, ppReservedMarshal, ppReserved, "HRESULT")
        return result
    }

    /**
     * The GetName method returns the name portion of the assembly name.
     * @remarks
     * This method is equivalent to using the <a href="https://docs.microsoft.com/windows/desktop/api/winsxs/nf-winsxs-iassemblyname-getproperty">GetProperty</a> method with the <i>PropertyId</i> set to the <b>ASM_NAME_NAME</b> option of <a href="https://docs.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_name">ASM_NAME</a>. In case ASM_NAME_NAME is not set, the size of the buffer returned by <i>lpcwBuffer</i> is  0, and the content of <i>pwzName</i> is undefined.
     * @param {Pointer<Integer>} lpcwBuffer When calling this method, set this parameter to the size of the buffer specified by <i>pwzName</i>. The specify the size in characters and include the null terminator. When the method returns, the value of <i>lpcwBuffer</i> is the size of the name returned.
     * @param {PWSTR} pwzName Pointer to the string value that receives  the name.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
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
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method did not succeed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-getname
     */
    GetName(lpcwBuffer, pwzName) {
        pwzName := pwzName is String ? StrPtr(pwzName) : pwzName

        lpcwBufferMarshal := lpcwBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, lpcwBufferMarshal, lpcwBuffer, "ptr", pwzName, "HRESULT")
        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getversionexa">GetVersionEx</a> function was developed because many existing applications err when examining the packed <b>DWORD</b> value returned by 
     * <b>GetVersion</b>, transposing the major and minor version numbers. 
     * <b>GetVersionEx</b> forces applications to explicitly examine each element of version information. 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-verifyversioninfoa">VerifyVersionInfo</a> eliminates further potential for error by comparing the required system version with the current system version for you.
     * @param {Pointer<Integer>} pdwVersionHi 
     * @param {Pointer<Integer>} pdwVersionLow 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pdwVersionHi, pdwVersionLow) {
        pdwVersionHiMarshal := pdwVersionHi is VarRef ? "uint*" : "ptr"
        pdwVersionLowMarshal := pdwVersionLow is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwVersionHiMarshal, pdwVersionHi, pdwVersionLowMarshal, pdwVersionLow, "HRESULT")
        return result
    }

    /**
     * The IsEqual method compares the current assembly name to another assembly name.
     * @param {IAssemblyName} pName A pointer to another  <a href="https://docs.microsoft.com/windows/desktop/api/winsxs/nn-winsxs-iassemblyname">IAssemblyName</a> instance, which is to be compared to the current assembly.
     * @param {Integer} dwCmpFlags Indicates which portion of the assembly names are to be compared. The value can be one of the options of the <a href="https://docs.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_cmp_flags">ASM_CMP_FLAGS</a> enumeration.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified portions of the names match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified portions of the names do not match.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-isequal
     */
    IsEqual(pName, dwCmpFlags) {
        result := ComCall(10, this, "ptr", pName, "uint", dwCmpFlags, "HRESULT")
        return result
    }

    /**
     * The Clone method copies the current side-by-side assembly name to a new instance of IAssemblyName.
     * @returns {IAssemblyName} Pointer to the location that contains the pointer to the new instance of <a href="https://docs.microsoft.com/windows/desktop/api/winsxs/nn-winsxs-iassemblyname">IAssemblyName</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-clone
     */
    Clone() {
        result := ComCall(11, this, "ptr*", &pName := 0, "HRESULT")
        return IAssemblyName(pName)
    }

    Query(iid) {
        if (IAssemblyName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 4)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
        this.vtbl.Finalize := CallbackCreate(GetMethod(implObj, "Finalize"), flags, 1)
        this.vtbl.GetDisplayName := CallbackCreate(GetMethod(implObj, "GetDisplayName"), flags, 4)
        this.vtbl.Reserved := CallbackCreate(GetMethod(implObj, "Reserved"), flags, 9)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 3)
        this.vtbl.GetVersion := CallbackCreate(GetMethod(implObj, "GetVersion"), flags, 3)
        this.vtbl.IsEqual := CallbackCreate(GetMethod(implObj, "IsEqual"), flags, 3)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.Finalize)
        CallbackFree(this.vtbl.GetDisplayName)
        CallbackFree(this.vtbl.Reserved)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetVersion)
        CallbackFree(this.vtbl.IsEqual)
        CallbackFree(this.vtbl.Clone)
    }
}
