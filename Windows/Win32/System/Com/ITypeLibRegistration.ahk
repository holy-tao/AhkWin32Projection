#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * Retrieves the guide used for boxed, lined, or freeform input.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-getguide
     */
    GetGuid() {
        pGuid := Guid()
        result := ComCall(3, this, "ptr", pGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion() {
        pVersion := BSTR()
        result := ComCall(4, this, "ptr", pVersion, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVersion
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLcid() {
        result := ComCall(5, this, "uint*", &pLcid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pLcid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetWin32Path() {
        pWin32Path := BSTR()
        result := ComCall(6, this, "ptr", pWin32Path, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pWin32Path
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetWin64Path() {
        pWin64Path := BSTR()
        result := ComCall(7, this, "ptr", pWin64Path, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pWin64Path
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayName() {
        pDisplayName := BSTR()
        result := ComCall(8, this, "ptr", pDisplayName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDisplayName
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlags() {
        result := ComCall(9, this, "uint*", &pFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFlags
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetHelpDir() {
        pHelpDir := BSTR()
        result := ComCall(10, this, "ptr", pHelpDir, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pHelpDir
    }
}
