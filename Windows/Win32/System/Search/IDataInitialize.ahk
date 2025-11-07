#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\MULTI_QI.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDataInitialize extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDataSource", "GetInitializationString", "CreateDBInstance", "CreateDBInstanceEx", "LoadStringFromStorage", "WriteStringToStorage"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsCtx 
     * @param {PWSTR} pwszInitializationString 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppDataSource 
     * @returns {HRESULT} 
     */
    GetDataSource(pUnkOuter, dwClsCtx, pwszInitializationString, riid, ppDataSource) {
        pwszInitializationString := pwszInitializationString is String ? StrPtr(pwszInitializationString) : pwszInitializationString

        result := ComCall(3, this, "ptr", pUnkOuter, "uint", dwClsCtx, "ptr", pwszInitializationString, "ptr", riid, "ptr*", ppDataSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDataSource 
     * @param {Integer} fIncludePassword 
     * @returns {PWSTR} 
     */
    GetInitializationString(pDataSource, fIncludePassword) {
        result := ComCall(4, this, "ptr", pDataSource, "char", fIncludePassword, "ptr*", &ppwszInitString := 0, "HRESULT")
        return ppwszInitString
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidProvider 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsCtx 
     * @param {PWSTR} pwszReserved 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    CreateDBInstance(clsidProvider, pUnkOuter, dwClsCtx, pwszReserved, riid) {
        pwszReserved := pwszReserved is String ? StrPtr(pwszReserved) : pwszReserved

        result := ComCall(5, this, "ptr", clsidProvider, "ptr", pUnkOuter, "uint", dwClsCtx, "ptr", pwszReserved, "ptr", riid, "ptr*", &ppDataSource := 0, "HRESULT")
        return IUnknown(ppDataSource)
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidProvider 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsCtx 
     * @param {PWSTR} pwszReserved 
     * @param {Pointer<COSERVERINFO>} pServerInfo 
     * @param {Integer} cmq 
     * @returns {MULTI_QI} 
     */
    CreateDBInstanceEx(clsidProvider, pUnkOuter, dwClsCtx, pwszReserved, pServerInfo, cmq) {
        pwszReserved := pwszReserved is String ? StrPtr(pwszReserved) : pwszReserved

        rgmqResults := MULTI_QI()
        result := ComCall(6, this, "ptr", clsidProvider, "ptr", pUnkOuter, "uint", dwClsCtx, "ptr", pwszReserved, "ptr", pServerInfo, "uint", cmq, "ptr", rgmqResults, "HRESULT")
        return rgmqResults
    }

    /**
     * 
     * @param {PWSTR} pwszFileName 
     * @returns {PWSTR} 
     */
    LoadStringFromStorage(pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(7, this, "ptr", pwszFileName, "ptr*", &ppwszInitializationString := 0, "HRESULT")
        return ppwszInitializationString
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

        result := ComCall(8, this, "ptr", pwszFileName, "ptr", pwszInitializationString, "uint", dwCreationDisposition, "HRESULT")
        return result
    }
}
