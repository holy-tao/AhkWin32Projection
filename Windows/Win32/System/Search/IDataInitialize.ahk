#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\MULTI_QI.ahk" { MULTI_QI }
#Import "..\Com\COSERVERINFO.ahk" { COSERVERINFO }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDataInitialize extends IUnknown {
    /**
     * The interface identifier for IDataInitialize
     * @type {Guid}
     */
    static IID := Guid("{2206ccb1-19c1-11d1-89e0-00c04fd7a829}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataInitialize interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDataSource           : IntPtr
        GetInitializationString : IntPtr
        CreateDBInstance        : IntPtr
        CreateDBInstanceEx      : IntPtr
        LoadStringFromStorage   : IntPtr
        WriteStringToStorage    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataInitialize.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(3, this, "ptr", pUnkOuter, "uint", dwClsCtx, "ptr", pwszInitializationString, Guid.Ptr, riid, IUnknown.Ptr, ppDataSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDataSource 
     * @param {Integer} fIncludePassword 
     * @returns {PWSTR} 
     */
    GetInitializationString(pDataSource, fIncludePassword) {
        result := ComCall(4, this, "ptr", pDataSource, "char", fIncludePassword, PWSTR.Ptr, &ppwszInitString := 0, "HRESULT")
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

        result := ComCall(5, this, Guid.Ptr, clsidProvider, "ptr", pUnkOuter, "uint", dwClsCtx, "ptr", pwszReserved, Guid.Ptr, riid, "ptr*", &ppDataSource := 0, "HRESULT")
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
        result := ComCall(6, this, Guid.Ptr, clsidProvider, "ptr", pUnkOuter, "uint", dwClsCtx, "ptr", pwszReserved, COSERVERINFO.Ptr, pServerInfo, "uint", cmq, MULTI_QI.Ptr, rgmqResults, "HRESULT")
        return rgmqResults
    }

    /**
     * 
     * @param {PWSTR} pwszFileName 
     * @returns {PWSTR} 
     */
    LoadStringFromStorage(pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(7, this, "ptr", pwszFileName, PWSTR.Ptr, &ppwszInitializationString := 0, "HRESULT")
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

    Query(iid) {
        if (IDataInitialize.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDataSource := CallbackCreate(GetMethod(implObj, "GetDataSource"), flags, 6)
        this.vtbl.GetInitializationString := CallbackCreate(GetMethod(implObj, "GetInitializationString"), flags, 4)
        this.vtbl.CreateDBInstance := CallbackCreate(GetMethod(implObj, "CreateDBInstance"), flags, 7)
        this.vtbl.CreateDBInstanceEx := CallbackCreate(GetMethod(implObj, "CreateDBInstanceEx"), flags, 8)
        this.vtbl.LoadStringFromStorage := CallbackCreate(GetMethod(implObj, "LoadStringFromStorage"), flags, 3)
        this.vtbl.WriteStringToStorage := CallbackCreate(GetMethod(implObj, "WriteStringToStorage"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDataSource)
        CallbackFree(this.vtbl.GetInitializationString)
        CallbackFree(this.vtbl.CreateDBInstance)
        CallbackFree(this.vtbl.CreateDBInstanceEx)
        CallbackFree(this.vtbl.LoadStringFromStorage)
        CallbackFree(this.vtbl.WriteStringToStorage)
    }
}
