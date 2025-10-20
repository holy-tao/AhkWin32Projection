#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeLibRegistration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeLibRegistration
     * @type {Guid}
     */
    static IID => Guid("{76a3e735-02df-4a12-98eb-043ad3600af3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGuid", "GetVersion", "GetLcid", "GetWin32Path", "GetWin64Path", "GetDisplayName", "GetFlags", "GetHelpDir"]

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    GetGuid(pGuid) {
        result := ComCall(3, this, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pVersion) {
        result := ComCall(4, this, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLcid 
     * @returns {HRESULT} 
     */
    GetLcid(pLcid) {
        result := ComCall(5, this, "uint*", pLcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pWin32Path 
     * @returns {HRESULT} 
     */
    GetWin32Path(pWin32Path) {
        result := ComCall(6, this, "ptr", pWin32Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pWin64Path 
     * @returns {HRESULT} 
     */
    GetWin64Path(pWin64Path) {
        result := ComCall(7, this, "ptr", pWin64Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDisplayName 
     * @returns {HRESULT} 
     */
    GetDisplayName(pDisplayName) {
        result := ComCall(8, this, "ptr", pDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pFlags) {
        result := ComCall(9, this, "uint*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pHelpDir 
     * @returns {HRESULT} 
     */
    GetHelpDir(pHelpDir) {
        result := ComCall(10, this, "ptr", pHelpDir, "HRESULT")
        return result
    }
}
