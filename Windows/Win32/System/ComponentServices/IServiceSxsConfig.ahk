#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicesxsconfig
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
     * 
     * @param {Integer} scsConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsconfig
     */
    SxsConfig(scsConfig) {
        result := ComCall(3, this, "int", scsConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szSxsName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsname
     */
    SxsName(szSxsName) {
        szSxsName := szSxsName is String ? StrPtr(szSxsName) : szSxsName

        result := ComCall(4, this, "ptr", szSxsName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szSxsDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesxsconfig-sxsdirectory
     */
    SxsDirectory(szSxsDirectory) {
        szSxsDirectory := szSxsDirectory is String ? StrPtr(szSxsDirectory) : szSxsDirectory

        result := ComCall(5, this, "ptr", szSxsDirectory, "HRESULT")
        return result
    }
}
