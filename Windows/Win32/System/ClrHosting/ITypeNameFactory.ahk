#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITypeNameBuilder.ahk" { ITypeNameBuilder }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITypeName.ahk" { ITypeName }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ITypeNameFactory extends IUnknown {
    /**
     * The interface identifier for ITypeNameFactory
     * @type {Guid}
     */
    static IID := Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00521}")

    /**
     * The class identifier for TypeNameFactory
     * @type {Guid}
     */
    static CLSID := Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00525}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITypeNameFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ParseTypeName      : IntPtr
        GetTypeNameBuilder : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITypeNameFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} pError 
     * @returns {ITypeName} 
     */
    ParseTypeName(szName, pError) {
        szName := szName is String ? StrPtr(szName) : szName

        pErrorMarshal := pError is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", szName, pErrorMarshal, pError, "ptr*", &ppTypeName := 0, "HRESULT")
        return ITypeName(ppTypeName)
    }

    /**
     * 
     * @returns {ITypeNameBuilder} 
     */
    GetTypeNameBuilder() {
        result := ComCall(4, this, "ptr*", &ppTypeBuilder := 0, "HRESULT")
        return ITypeNameBuilder(ppTypeBuilder)
    }

    Query(iid) {
        if (ITypeNameFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ParseTypeName := CallbackCreate(GetMethod(implObj, "ParseTypeName"), flags, 4)
        this.vtbl.GetTypeNameBuilder := CallbackCreate(GetMethod(implObj, "GetTypeNameBuilder"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ParseTypeName)
        CallbackFree(this.vtbl.GetTypeNameBuilder)
    }
}
