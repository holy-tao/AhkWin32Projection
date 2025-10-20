#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-ichecksxsconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICheckSxsConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICheckSxsConfig
     * @type {Guid}
     */
    static IID => Guid("{0ff5a96f-11fc-47d1-baa6-25dd347e7242}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSameSxsConfig"]

    /**
     * 
     * @param {PWSTR} wszSxsName 
     * @param {PWSTR} wszSxsDirectory 
     * @param {PWSTR} wszSxsAppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ichecksxsconfig-issamesxsconfig
     */
    IsSameSxsConfig(wszSxsName, wszSxsDirectory, wszSxsAppName) {
        wszSxsName := wszSxsName is String ? StrPtr(wszSxsName) : wszSxsName
        wszSxsDirectory := wszSxsDirectory is String ? StrPtr(wszSxsDirectory) : wszSxsDirectory
        wszSxsAppName := wszSxsAppName is String ? StrPtr(wszSxsAppName) : wszSxsAppName

        result := ComCall(3, this, "ptr", wszSxsName, "ptr", wszSxsDirectory, "ptr", wszSxsAppName, "HRESULT")
        return result
    }
}
