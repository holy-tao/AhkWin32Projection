#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDataInitialize extends IUnknown{
    /**
     * The interface identifier for IDataInitialize
     * @type {Guid}
     */
    static IID => Guid("{2206ccb1-19c1-11d1-89e0-00c04fd7a829}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Integer} dwClsCtx 
     * @param {PWSTR} pwszInitializationString 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppDataSource 
     * @returns {HRESULT} 
     */
    GetDataSource(pUnkOuter, dwClsCtx, pwszInitializationString, riid, ppDataSource) {
        pwszInitializationString := pwszInitializationString is String ? StrPtr(pwszInitializationString) : pwszInitializationString

        result := ComCall(3, this, "ptr", pUnkOuter, "uint", dwClsCtx, "ptr", pwszInitializationString, "ptr", riid, "ptr", ppDataSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pDataSource 
     * @param {Integer} fIncludePassword 
     * @param {Pointer<PWSTR>} ppwszInitString 
     * @returns {HRESULT} 
     */
    GetInitializationString(pDataSource, fIncludePassword, ppwszInitString) {
        result := ComCall(4, this, "ptr", pDataSource, "char", fIncludePassword, "ptr", ppwszInitString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidProvider 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Integer} dwClsCtx 
     * @param {PWSTR} pwszReserved 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppDataSource 
     * @returns {HRESULT} 
     */
    CreateDBInstance(clsidProvider, pUnkOuter, dwClsCtx, pwszReserved, riid, ppDataSource) {
        pwszReserved := pwszReserved is String ? StrPtr(pwszReserved) : pwszReserved

        result := ComCall(5, this, "ptr", clsidProvider, "ptr", pUnkOuter, "uint", dwClsCtx, "ptr", pwszReserved, "ptr", riid, "ptr", ppDataSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidProvider 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Integer} dwClsCtx 
     * @param {PWSTR} pwszReserved 
     * @param {Pointer<COSERVERINFO>} pServerInfo 
     * @param {Integer} cmq 
     * @param {Pointer<MULTI_QI>} rgmqResults 
     * @returns {HRESULT} 
     */
    CreateDBInstanceEx(clsidProvider, pUnkOuter, dwClsCtx, pwszReserved, pServerInfo, cmq, rgmqResults) {
        pwszReserved := pwszReserved is String ? StrPtr(pwszReserved) : pwszReserved

        result := ComCall(6, this, "ptr", clsidProvider, "ptr", pUnkOuter, "uint", dwClsCtx, "ptr", pwszReserved, "ptr", pServerInfo, "uint", cmq, "ptr", rgmqResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFileName 
     * @param {Pointer<PWSTR>} ppwszInitializationString 
     * @returns {HRESULT} 
     */
    LoadStringFromStorage(pwszFileName, ppwszInitializationString) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(7, this, "ptr", pwszFileName, "ptr", ppwszInitializationString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFileName 
     * @param {PWSTR} pwszInitializationString 
     * @param {Integer} dwCreationDisposition 
     * @returns {HRESULT} 
     */
    WriteStringToStorage(pwszFileName, pwszInitializationString, dwCreationDisposition) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName
        pwszInitializationString := pwszInitializationString is String ? StrPtr(pwszInitializationString) : pwszInitializationString

        result := ComCall(8, this, "ptr", pwszFileName, "ptr", pwszInitializationString, "uint", dwCreationDisposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
