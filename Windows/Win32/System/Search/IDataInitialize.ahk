#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\COSERVERINFO.ahk" { COSERVERINFO }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\MULTI_QI.ahk" { MULTI_QI }

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
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsCtx 
     * @param {PWSTR} pwszInitializationString 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppDataSource 
     * @returns {HRESULT} 
     */
    GetDataSource(pUnkOuter, dwClsCtx, pwszInitializationString, riid, ppDataSource) {
        pwszInitializationString := pwszInitializationString is String ? StrPtr(pwszInitializationString) : pwszInitializationString

        pUnkOuterMarshal := pUnkOuter == 0 ? IntPtr : "ptr"
        pwszInitializationStringMarshal := pwszInitializationString == 0 ? IntPtr : PWSTR

        result := ComCall(3, this, pUnkOuterMarshal, pUnkOuter, UInt32, dwClsCtx, pwszInitializationStringMarshal, pwszInitializationString, Guid.Ptr, riid, IUnknown.Ptr, ppDataSource, "HRESULT")
        return result
    }

    /**
     * @param {IUnknown} pDataSource 
     * @param {Integer} fIncludePassword 
     * @returns {PWSTR} 
     */
    GetInitializationString(pDataSource, fIncludePassword) {
        pDataSourceMarshal := pDataSource == 0 ? IntPtr : "ptr"

        result := ComCall(4, this, pDataSourceMarshal, pDataSource, Int8, fIncludePassword, PWSTR.Ptr, &ppwszInitString := 0, "HRESULT")
        return ppwszInitString
    }

    /**
     * @param {Pointer<Guid>} clsidProvider 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsCtx 
     * @param {PWSTR} pwszReserved 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    CreateDBInstance(clsidProvider, pUnkOuter, dwClsCtx, pwszReserved, riid) {
        pwszReserved := pwszReserved is String ? StrPtr(pwszReserved) : pwszReserved

        pUnkOuterMarshal := pUnkOuter == 0 ? IntPtr : "ptr"
        pwszReservedMarshal := pwszReserved == 0 ? IntPtr : PWSTR

        result := ComCall(5, this, Guid.Ptr, clsidProvider, pUnkOuterMarshal, pUnkOuter, UInt32, dwClsCtx, pwszReservedMarshal, pwszReserved, Guid.Ptr, riid, "ptr*", &ppDataSource := 0, "HRESULT")
        return IUnknown(ppDataSource)
    }

    /**
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

        pUnkOuterMarshal := pUnkOuter == 0 ? IntPtr : "ptr"
        pwszReservedMarshal := pwszReserved == 0 ? IntPtr : PWSTR

        rgmqResults := MULTI_QI()
        result := ComCall(6, this, Guid.Ptr, clsidProvider, pUnkOuterMarshal, pUnkOuter, UInt32, dwClsCtx, pwszReservedMarshal, pwszReserved, COSERVERINFO.Ptr, pServerInfo, UInt32, cmq, MULTI_QI.Ptr, rgmqResults, "HRESULT")
        return rgmqResults
    }

    /**
     * @param {PWSTR} pwszFileName 
     * @returns {PWSTR} 
     */
    LoadStringFromStorage(pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        pwszFileNameMarshal := pwszFileName == 0 ? IntPtr : PWSTR

        result := ComCall(7, this, pwszFileNameMarshal, pwszFileName, PWSTR.Ptr, &ppwszInitializationString := 0, "HRESULT")
        return ppwszInitializationString
    }

    /**
     * @param {PWSTR} pwszFileName 
     * @param {PWSTR} pwszInitializationString 
     * @param {Integer} dwCreationDisposition 
     * @returns {HRESULT} 
     */
    WriteStringToStorage(pwszFileName, pwszInitializationString, dwCreationDisposition) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName
        pwszInitializationString := pwszInitializationString is String ? StrPtr(pwszInitializationString) : pwszInitializationString

        pwszFileNameMarshal := pwszFileName == 0 ? IntPtr : PWSTR
        pwszInitializationStringMarshal := pwszInitializationString == 0 ? IntPtr : PWSTR

        result := ComCall(8, this, pwszFileNameMarshal, pwszFileName, pwszInitializationStringMarshal, pwszInitializationString, UInt32, dwCreationDisposition, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IDataInitialize.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDataSource := CallbackCreate(ObjBindMethod(implObj, "GetDataSource"), flags, 6)
        this.vtbl.GetInitializationString := CallbackCreate(ObjBindMethod(implObj, "GetInitializationString"), flags, 4)
        this.vtbl.CreateDBInstance := CallbackCreate(ObjBindMethod(implObj, "CreateDBInstance"), flags, 7)
        this.vtbl.CreateDBInstanceEx := CallbackCreate(ObjBindMethod(implObj, "CreateDBInstanceEx"), flags, 8)
        this.vtbl.LoadStringFromStorage := CallbackCreate(ObjBindMethod(implObj, "LoadStringFromStorage"), flags, 3)
        this.vtbl.WriteStringToStorage := CallbackCreate(ObjBindMethod(implObj, "WriteStringToStorage"), flags, 4)
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
