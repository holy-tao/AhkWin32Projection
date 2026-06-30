#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ScopeNamespace.ahk
#Include .\SnapIns.ahk
#Include .\View.ahk
#Include .\_DocumentMode.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\Views.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include .\Properties.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\_Application.ahk
#Include .\Node.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 */
class Document extends IDispatch {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Document
     * @type {Guid}
     */
    static IID => Guid("{225120d6-1e0f-40a3-93fe-1079e6a8017b}")

    /**
     * The class identifier for Document
     * @type {Guid}
     */
    static CLSID => Guid("{225120d6-1e0f-40a3-93fe-1079e6a8017b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Save", "SaveAs", "Close", "get_Views", "get_SnapIns", "get_ActiveView", "get_Name", "put_Name", "get_Location", "get_IsSaved", "get_Mode", "put_Mode", "get_RootNode", "get_ScopeNamespace", "CreateProperties", "get_Application"]

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

        result := ComCall(8, this, "ptr", Filename, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} SaveChanges 
     * @returns {HRESULT} 
     */
    Close(SaveChanges) {
        result := ComCall(9, this, "int", SaveChanges, "HRESULT")
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
        Name := BSTR({Value: 0}, True)
        result := ComCall(13, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {HRESULT} 
     */
    put_Name(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(14, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Location() {
        _Location := BSTR({Value: 0}, True)
        result := ComCall(15, this, "ptr", _Location, "HRESULT")
        return _Location
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsSaved() {
        result := ComCall(16, this, "int*", &IsSaved := 0, "HRESULT")
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
        result := ComCall(18, this, "int", _Mode, "HRESULT")
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
}
