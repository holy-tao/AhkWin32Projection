#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ScopeNamespace.ahk" { ScopeNamespace }
#Import ".\_DocumentMode.ahk" { _DocumentMode }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\View.ahk" { View }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SnapIns.ahk" { SnapIns }
#Import ".\Views.ahk" { Views }
#Import ".\Properties.ahk" { Properties }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\Node.ahk" { Node }
#Import ".\_Application.ahk" { _Application }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct Document extends IDispatch {
    /**
     * The interface identifier for Document
     * @type {Guid}
     */
    static IID := Guid("{225120d6-1e0f-40a3-93fe-1079e6a8017b}")

    /**
     * The class identifier for Document
     * @type {Guid}
     */
    static CLSID := Guid("{225120d6-1e0f-40a3-93fe-1079e6a8017b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Document interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Save               : IntPtr
        SaveAs             : IntPtr
        Close              : IntPtr
        get_Views          : IntPtr
        get_SnapIns        : IntPtr
        get_ActiveView     : IntPtr
        get_Name           : IntPtr
        put_Name           : IntPtr
        get_Location       : IntPtr
        get_IsSaved        : IntPtr
        get_Mode           : IntPtr
        put_Mode           : IntPtr
        get_RootNode       : IntPtr
        get_ScopeNamespace : IntPtr
        CreateProperties   : IntPtr
        get_Application    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Document.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Views} 
     */
    Views {
        get => this.get_Views()
    }

    /**
     * @type {SnapIns} 
     */
    SnapIns {
        get => this.get_SnapIns()
    }

    /**
     * @type {View} 
     */
    ActiveView {
        get => this.get_ActiveView()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * @type {BOOL} 
     */
    IsSaved {
        get => this.get_IsSaved()
    }

    /**
     * @type {_DocumentMode} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * @type {Node} 
     */
    RootNode {
        get => this.get_RootNode()
    }

    /**
     * @type {ScopeNamespace} 
     */
    ScopeNamespace {
        get => this.get_ScopeNamespace()
    }

    /**
     * @type {_Application} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Filename 
     * @returns {HRESULT} 
     */
    SaveAs(Filename) {
        Filename := Filename is String ? BSTR.Alloc(Filename).Value : Filename

        result := ComCall(8, this, BSTR, Filename, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} SaveChanges 
     * @returns {HRESULT} 
     */
    Close(SaveChanges) {
        result := ComCall(9, this, BOOL, SaveChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Views} 
     */
    get_Views() {
        result := ComCall(10, this, "ptr*", &_Views := 0, "HRESULT")
        return Views(_Views)
    }

    /**
     * 
     * @returns {SnapIns} 
     */
    get_SnapIns() {
        result := ComCall(11, this, "ptr*", &_SnapIns := 0, "HRESULT")
        return SnapIns(_SnapIns)
    }

    /**
     * 
     * @returns {View} 
     */
    get_ActiveView() {
        result := ComCall(12, this, "ptr*", &_View := 0, "HRESULT")
        return View(_View)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     */
    put_Name(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(14, this, BSTR, Name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Location() {
        _Location := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, _Location, "HRESULT")
        return _Location
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsSaved() {
        result := ComCall(16, this, BOOL.Ptr, &IsSaved := 0, "HRESULT")
        return IsSaved
    }

    /**
     * 
     * @returns {_DocumentMode} 
     */
    get_Mode() {
        result := ComCall(17, this, "int*", &_Mode := 0, "HRESULT")
        return _Mode
    }

    /**
     * 
     * @param {_DocumentMode} _Mode 
     * @returns {HRESULT} 
     */
    put_Mode(_Mode) {
        result := ComCall(18, this, _DocumentMode, _Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Node} 
     */
    get_RootNode() {
        result := ComCall(19, this, "ptr*", &_Node := 0, "HRESULT")
        return Node(_Node)
    }

    /**
     * 
     * @returns {ScopeNamespace} 
     */
    get_ScopeNamespace() {
        result := ComCall(20, this, "ptr*", &_ScopeNamespace := 0, "HRESULT")
        return ScopeNamespace(_ScopeNamespace)
    }

    /**
     * 
     * @returns {Properties} 
     */
    CreateProperties() {
        result := ComCall(21, this, "ptr*", &_Properties := 0, "HRESULT")
        return Properties(_Properties)
    }

    /**
     * 
     * @returns {_Application} 
     */
    get_Application() {
        result := ComCall(22, this, "ptr*", &_Application := 0, "HRESULT")
        return _Application(_Application)
    }

    Query(iid) {
        if (Document.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.SaveAs := CallbackCreate(GetMethod(implObj, "SaveAs"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 2)
        this.vtbl.get_Views := CallbackCreate(GetMethod(implObj, "get_Views"), flags, 2)
        this.vtbl.get_SnapIns := CallbackCreate(GetMethod(implObj, "get_SnapIns"), flags, 2)
        this.vtbl.get_ActiveView := CallbackCreate(GetMethod(implObj, "get_ActiveView"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Location := CallbackCreate(GetMethod(implObj, "get_Location"), flags, 2)
        this.vtbl.get_IsSaved := CallbackCreate(GetMethod(implObj, "get_IsSaved"), flags, 2)
        this.vtbl.get_Mode := CallbackCreate(GetMethod(implObj, "get_Mode"), flags, 2)
        this.vtbl.put_Mode := CallbackCreate(GetMethod(implObj, "put_Mode"), flags, 2)
        this.vtbl.get_RootNode := CallbackCreate(GetMethod(implObj, "get_RootNode"), flags, 2)
        this.vtbl.get_ScopeNamespace := CallbackCreate(GetMethod(implObj, "get_ScopeNamespace"), flags, 2)
        this.vtbl.CreateProperties := CallbackCreate(GetMethod(implObj, "CreateProperties"), flags, 2)
        this.vtbl.get_Application := CallbackCreate(GetMethod(implObj, "get_Application"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.SaveAs)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.get_Views)
        CallbackFree(this.vtbl.get_SnapIns)
        CallbackFree(this.vtbl.get_ActiveView)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Location)
        CallbackFree(this.vtbl.get_IsSaved)
        CallbackFree(this.vtbl.get_Mode)
        CallbackFree(this.vtbl.put_Mode)
        CallbackFree(this.vtbl.get_RootNode)
        CallbackFree(this.vtbl.get_ScopeNamespace)
        CallbackFree(this.vtbl.CreateProperties)
        CallbackFree(this.vtbl.get_Application)
    }
}
