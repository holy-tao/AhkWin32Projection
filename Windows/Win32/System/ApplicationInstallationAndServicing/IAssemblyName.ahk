#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} PropertyId 
     * @param {Pointer<Void>} pvProperty 
     * @param {Integer} cbProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-setproperty
     */
    SetProperty(PropertyId, pvProperty, cbProperty) {
        result := ComCall(3, this, "uint", PropertyId, "ptr", pvProperty, "uint", cbProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropertyId 
     * @param {Pointer<Void>} pvProperty 
     * @param {Pointer<Integer>} pcbProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-getproperty
     */
    GetProperty(PropertyId, pvProperty, pcbProperty) {
        result := ComCall(4, this, "uint", PropertyId, "ptr", pvProperty, "uint*", pcbProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-finalize
     */
    Finalize() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szDisplayName 
     * @param {Pointer<Integer>} pccDisplayName 
     * @param {Integer} dwDisplayFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-getdisplayname
     */
    GetDisplayName(szDisplayName, pccDisplayName, dwDisplayFlags) {
        szDisplayName := szDisplayName is String ? StrPtr(szDisplayName) : szDisplayName

        result := ComCall(6, this, "ptr", szDisplayName, "uint*", pccDisplayName, "uint", dwDisplayFlags, "HRESULT")
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

        result := ComCall(7, this, "ptr", refIID, "ptr", pUnkReserved1, "ptr", pUnkReserved2, "ptr", szReserved, "int64", llReserved, "ptr", pvReserved, "uint", cbReserved, "ptr*", ppReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpcwBuffer 
     * @param {PWSTR} pwzName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-getname
     */
    GetName(lpcwBuffer, pwzName) {
        pwzName := pwzName is String ? StrPtr(pwzName) : pwzName

        result := ComCall(8, this, "uint*", lpcwBuffer, "ptr", pwzName, "HRESULT")
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
        result := ComCall(9, this, "uint*", pdwVersionHi, "uint*", pdwVersionLow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAssemblyName} pName 
     * @param {Integer} dwCmpFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-isequal
     */
    IsEqual(pName, dwCmpFlags) {
        result := ComCall(10, this, "ptr", pName, "uint", dwCmpFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAssemblyName>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblyname-clone
     */
    Clone(pName) {
        result := ComCall(11, this, "ptr*", pName, "HRESULT")
        return result
    }
}
