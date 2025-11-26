#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAssemblyName.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IAssemblyName interface represents a side-by-side assembly name.
 * @see https://docs.microsoft.com/windows/win32/api//winsxs/nn-winsxs-iassemblyname
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IAssemblyName extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAssemblyName
     * @type {Guid}
     */
    static IID => Guid("{cd193bc0-b4bc-11d2-9833-00c04fc31d2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProperty", "GetProperty", "Finalize", "GetDisplayName", "Reserved", "GetName", "GetVersion", "IsEqual", "Clone"]

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
     * The method did not succeed. The <a href="/windows/desktop/api/winsxs/nf-winsxs-iassemblyname-setproperty">SetProperty</a> method was called after the <a href="/windows/desktop/api/winsxs/nf-winsxs-iassemblyname-finalize">Finalize</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsxs/nf-winsxs-iassemblyname-setproperty
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
     * @see https://docs.microsoft.com/windows/win32/api//winsxs/nf-winsxs-iassemblyname-getproperty
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
     * @see https://docs.microsoft.com/windows/win32/api//winsxs/nf-winsxs-iassemblyname-finalize
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
     * @see https://docs.microsoft.com/windows/win32/api//winsxs/nf-winsxs-iassemblyname-getdisplayname
     */
    GetDisplayName(szDisplayName, pccDisplayName, dwDisplayFlags) {
        szDisplayName := szDisplayName is String ? StrPtr(szDisplayName) : szDisplayName

        pccDisplayNameMarshal := pccDisplayName is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", szDisplayName, pccDisplayNameMarshal, pccDisplayName, "uint", dwDisplayFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} refIID 
     * @param {IUnknown} pUnkReserved1 
     * @param {IUnknown} pUnkReserved2 
     * @param {PWSTR} szReserved 
     * @param {Integer} llReserved 
     * @param {Pointer<Void>} pvReserved 
     * @param {Integer} cbReserved 
     * @param {Pointer<Pointer<Void>>} ppReserved 
     * @returns {HRESULT} 
     */
    Reserved(refIID, pUnkReserved1, pUnkReserved2, szReserved, llReserved, pvReserved, cbReserved, ppReserved) {
        szReserved := szReserved is String ? StrPtr(szReserved) : szReserved

        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"
        ppReservedMarshal := ppReserved is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", refIID, "ptr", pUnkReserved1, "ptr", pUnkReserved2, "ptr", szReserved, "int64", llReserved, pvReservedMarshal, pvReserved, "uint", cbReserved, ppReservedMarshal, ppReserved, "HRESULT")
        return result
    }

    /**
     * The GetName method returns the name portion of the assembly name.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsxs/nf-winsxs-iassemblyname-getname
     */
    GetName(lpcwBuffer, pwzName) {
        pwzName := pwzName is String ? StrPtr(pwzName) : pwzName

        lpcwBufferMarshal := lpcwBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, lpcwBufferMarshal, lpcwBuffer, "ptr", pwzName, "HRESULT")
        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<Integer>} pdwVersionHi 
     * @param {Pointer<Integer>} pdwVersionLow 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
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
     * @see https://docs.microsoft.com/windows/win32/api//winsxs/nf-winsxs-iassemblyname-isequal
     */
    IsEqual(pName, dwCmpFlags) {
        result := ComCall(10, this, "ptr", pName, "uint", dwCmpFlags, "HRESULT")
        return result
    }

    /**
     * The Clone method copies the current side-by-side assembly name to a new instance of IAssemblyName.
     * @returns {IAssemblyName} Pointer to the location that contains the pointer to the new instance of <a href="https://docs.microsoft.com/windows/desktop/api/winsxs/nn-winsxs-iassemblyname">IAssemblyName</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsxs/nf-winsxs-iassemblyname-clone
     */
    Clone() {
        result := ComCall(11, this, "ptr*", &pName := 0, "HRESULT")
        return IAssemblyName(pName)
    }
}
