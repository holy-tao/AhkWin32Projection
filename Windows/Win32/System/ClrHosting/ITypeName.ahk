#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ITypeName extends IUnknown {
    /**
     * The interface identifier for ITypeName
     * @type {Guid}
     */
    static IID := Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00522}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITypeName interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNameCount         : IntPtr
        GetNames             : IntPtr
        GetTypeArgumentCount : IntPtr
        GetTypeArguments     : IntPtr
        GetModifierLength    : IntPtr
        GetModifiers         : IntPtr
        GetAssemblyName      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITypeName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNameCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<BSTR>} rgbszNames 
     * @returns {Integer} 
     */
    GetNames(count, rgbszNames) {
        result := ComCall(4, this, "uint", count, BSTR.Ptr, rgbszNames, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTypeArgumentCount() {
        result := ComCall(5, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<ITypeName>} rgpArguments 
     * @returns {Integer} 
     */
    GetTypeArguments(count, rgpArguments) {
        result := ComCall(6, this, "uint", count, ITypeName.Ptr, rgpArguments, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetModifierLength() {
        result := ComCall(7, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<Integer>} rgModifiers 
     * @returns {Integer} 
     */
    GetModifiers(count, rgModifiers) {
        rgModifiersMarshal := rgModifiers is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", count, rgModifiersMarshal, rgModifiers, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetAssemblyName() {
        rgbszAssemblyNames := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, rgbszAssemblyNames, "HRESULT")
        return rgbszAssemblyNames
    }

    Query(iid) {
        if (ITypeName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNameCount := CallbackCreate(GetMethod(implObj, "GetNameCount"), flags, 2)
        this.vtbl.GetNames := CallbackCreate(GetMethod(implObj, "GetNames"), flags, 4)
        this.vtbl.GetTypeArgumentCount := CallbackCreate(GetMethod(implObj, "GetTypeArgumentCount"), flags, 2)
        this.vtbl.GetTypeArguments := CallbackCreate(GetMethod(implObj, "GetTypeArguments"), flags, 4)
        this.vtbl.GetModifierLength := CallbackCreate(GetMethod(implObj, "GetModifierLength"), flags, 2)
        this.vtbl.GetModifiers := CallbackCreate(GetMethod(implObj, "GetModifiers"), flags, 4)
        this.vtbl.GetAssemblyName := CallbackCreate(GetMethod(implObj, "GetAssemblyName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNameCount)
        CallbackFree(this.vtbl.GetNames)
        CallbackFree(this.vtbl.GetTypeArgumentCount)
        CallbackFree(this.vtbl.GetTypeArguments)
        CallbackFree(this.vtbl.GetModifierLength)
        CallbackFree(this.vtbl.GetModifiers)
        CallbackFree(this.vtbl.GetAssemblyName)
    }
}
