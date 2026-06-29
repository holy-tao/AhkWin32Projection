#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.TransactionServer
 */
export default struct ICatalog extends IDispatch {
    /**
     * The interface identifier for ICatalog
     * @type {Guid}
     */
    static IID := Guid("{6eb22870-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for Catalog
     * @type {Guid}
     */
    static CLSID := Guid("{6eb22881-8a19-11d0-81b6-00a0c9231c29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICatalog interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetCollection    : IntPtr
        Connect          : IntPtr
        get_MajorVersion : IntPtr
        get_MinorVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICatalog.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * 
     * @param {BSTR} bstrCollName 
     * @returns {IDispatch} 
     */
    GetCollection(bstrCollName) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(7, this, BSTR, bstrCollName, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * 
     * @param {BSTR} bstrConnectString 
     * @returns {IDispatch} 
     */
    Connect(bstrConnectString) {
        bstrConnectString := bstrConnectString is String ? BSTR.Alloc(bstrConnectString).Value : bstrConnectString

        result := ComCall(8, this, BSTR, bstrConnectString, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MajorVersion(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MinorVersion(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICatalog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCollection := CallbackCreate(GetMethod(implObj, "GetCollection"), flags, 3)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 3)
        this.vtbl.get_MajorVersion := CallbackCreate(GetMethod(implObj, "get_MajorVersion"), flags, 2)
        this.vtbl.get_MinorVersion := CallbackCreate(GetMethod(implObj, "get_MinorVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCollection)
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.get_MajorVersion)
        CallbackFree(this.vtbl.get_MinorVersion)
    }
}
