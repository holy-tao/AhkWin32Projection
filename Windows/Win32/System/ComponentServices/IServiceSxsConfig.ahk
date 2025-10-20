#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceSxsConfig extends IUnknown{
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
     * 
     * @param {Integer} scsConfig 
     * @returns {HRESULT} 
     */
    SxsConfig(scsConfig) {
        result := ComCall(3, this, "int", scsConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szSxsName 
     * @returns {HRESULT} 
     */
    SxsName(szSxsName) {
        szSxsName := szSxsName is String ? StrPtr(szSxsName) : szSxsName

        result := ComCall(4, this, "ptr", szSxsName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szSxsDirectory 
     * @returns {HRESULT} 
     */
    SxsDirectory(szSxsDirectory) {
        szSxsDirectory := szSxsDirectory is String ? StrPtr(szSxsDirectory) : szSxsDirectory

        result := ComCall(5, this, "ptr", szSxsDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
