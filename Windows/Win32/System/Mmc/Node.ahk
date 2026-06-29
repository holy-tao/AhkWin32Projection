#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct Node extends IDispatch {
    /**
     * The interface identifier for Node
     * @type {Guid}
     */
    static IID := Guid("{f81ed800-7839-4447-945d-8e15da59ca55}")

    /**
     * The class identifier for Node
     * @type {Guid}
     */
    static CLSID := Guid("{f81ed800-7839-4447-945d-8e15da59ca55}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Node interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name     : IntPtr
        get_Property : IntPtr
        get_Bookmark : IntPtr
        IsScopeNode  : IntPtr
        get_Nodetype : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Node.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Bookmark {
        get => this.get_Bookmark()
    }

    /**
     * @type {BSTR} 
     */
    Nodetype {
        get => this.get_Nodetype()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @returns {BSTR} 
     */
    get_Property(PropertyName) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        _PropertyValue := BSTR.Owned()
        result := ComCall(8, this, BSTR, PropertyName, BSTR.Ptr, _PropertyValue, "HRESULT")
        return _PropertyValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Bookmark() {
        Bookmark := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, Bookmark, "HRESULT")
        return Bookmark
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsScopeNode() {
        result := ComCall(10, this, BOOL.Ptr, &IsScopeNode := 0, "HRESULT")
        return IsScopeNode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Nodetype() {
        Nodetype := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, Nodetype, "HRESULT")
        return Nodetype
    }

    Query(iid) {
        if (Node.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Property := CallbackCreate(GetMethod(implObj, "get_Property"), flags, 3)
        this.vtbl.get_Bookmark := CallbackCreate(GetMethod(implObj, "get_Bookmark"), flags, 2)
        this.vtbl.IsScopeNode := CallbackCreate(GetMethod(implObj, "IsScopeNode"), flags, 2)
        this.vtbl.get_Nodetype := CallbackCreate(GetMethod(implObj, "get_Nodetype"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Property)
        CallbackFree(this.vtbl.get_Bookmark)
        CallbackFree(this.vtbl.IsScopeNode)
        CallbackFree(this.vtbl.get_Nodetype)
    }
}
