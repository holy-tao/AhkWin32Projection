#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Configures side-by-side assemblies for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-iservicesxsconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceSxsConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceSxsConfig
     * @type {Guid}
     */
    static IID => Guid("{c7cd7379-f3f2-4634-811b-703281d73e08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SxsConfig", "SxsName", "SxsDirectory"]

    /**
     * Configures the side-by-side assembly for the enclosed work.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsdirectory">SxsDirectory</a> method must be called if a new side-by-side assembly domain is created using a call to this method.
     * @param {Integer} scsConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_sxsconfig">CSC_SxsConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iservicesxsconfig-sxsconfig
     */
    SxsConfig(scsConfig) {
        result := ComCall(3, this, "int", scsConfig, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the file name of the side-by-side assembly for the enclosed work.
     * @remarks
     * The appropriate file name extension will be added to the <i>szSxsName</i> parameter. A default file name is used if this method is not called.
     * @param {PWSTR} szSxsName The file name for the side-by-side assembly.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iservicesxsconfig-sxsname
     */
    SxsName(szSxsName) {
        szSxsName := szSxsName is String ? StrPtr(szSxsName) : szSxsName

        result := ComCall(4, this, "ptr", szSxsName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the directory for the side-by-side assembly for the enclosed work.
     * @remarks
     * This method must be called if a new side-by-side assembly domain is created using the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsconfig">SxsConfig</a>.
     * @param {PWSTR} szSxsDirectory The name of the directory for the side-by-side assembly that is to be used for the enclosed work.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iservicesxsconfig-sxsdirectory
     */
    SxsDirectory(szSxsDirectory) {
        szSxsDirectory := szSxsDirectory is String ? StrPtr(szSxsDirectory) : szSxsDirectory

        result := ComCall(5, this, "ptr", szSxsDirectory, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
