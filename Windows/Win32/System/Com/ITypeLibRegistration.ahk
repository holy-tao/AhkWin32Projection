#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class ITypeLibRegistration extends IUnknown {

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
     * @returns {Guid} 
     */
    GetGuid() {
        pGuid := Guid()
        result := ComCall(3, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getversionexa">GetVersionEx</a> function was developed because many existing applications err when examining the packed <b>DWORD</b> value returned by 
     * <b>GetVersion</b>, transposing the major and minor version numbers. 
     * <b>GetVersionEx</b> forces applications to explicitly examine each element of version information. 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-verifyversioninfoa">VerifyVersionInfo</a> eliminates further potential for error by comparing the required system version with the current system version for you.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion() {
        pVersion := BSTR({Value: 0}, True)
        result := ComCall(4, this, "ptr", pVersion, "HRESULT")
        return pVersion
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLcid() {
        result := ComCall(5, this, "uint*", &pLcid := 0, "HRESULT")
        return pLcid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetWin32Path() {
        pWin32Path := BSTR({Value: 0}, True)
        result := ComCall(6, this, "ptr", pWin32Path, "HRESULT")
        return pWin32Path
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetWin64Path() {
        pWin64Path := BSTR({Value: 0}, True)
        result := ComCall(7, this, "ptr", pWin64Path, "HRESULT")
        return pWin64Path
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayName() {
        pDisplayName := BSTR({Value: 0}, True)
        result := ComCall(8, this, "ptr", pDisplayName, "HRESULT")
        return pDisplayName
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlags() {
        result := ComCall(9, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetHelpDir() {
        pHelpDir := BSTR({Value: 0}, True)
        result := ComCall(10, this, "ptr", pHelpDir, "HRESULT")
        return pHelpDir
    }
}
