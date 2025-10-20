#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICheckSxsConfig extends IUnknown{
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
     * 
     * @param {PWSTR} wszSxsName 
     * @param {PWSTR} wszSxsDirectory 
     * @param {PWSTR} wszSxsAppName 
     * @returns {HRESULT} 
     */
    IsSameSxsConfig(wszSxsName, wszSxsDirectory, wszSxsAppName) {
        wszSxsName := wszSxsName is String ? StrPtr(wszSxsName) : wszSxsName
        wszSxsDirectory := wszSxsDirectory is String ? StrPtr(wszSxsDirectory) : wszSxsDirectory
        wszSxsAppName := wszSxsAppName is String ? StrPtr(wszSxsAppName) : wszSxsAppName

        result := ComCall(3, this, "ptr", wszSxsName, "ptr", wszSxsDirectory, "ptr", wszSxsAppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
