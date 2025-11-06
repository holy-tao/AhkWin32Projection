#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\Views.ahk
#Include .\SnapIns.ahk
#Include .\View.ahk
#Include .\Node.ahk
#Include .\ScopeNamespace.ahk
#Include .\Properties.ahk
#Include .\_Application.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Document extends IDispatch{

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
        result := ComCall(10, this, "ptr*", &Views := 0, "HRESULT")
        return Views(Views)
    }

    /**
     * 
     * @returns {SnapIns} 
     */
    get_SnapIns() {
        result := ComCall(11, this, "ptr*", &SnapIns := 0, "HRESULT")
        return SnapIns(SnapIns)
    }

    /**
     * 
     * @returns {View} 
     */
    get_ActiveView() {
        result := ComCall(12, this, "ptr*", &View := 0, "HRESULT")
        return View(View)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
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
        Location := BSTR()
        result := ComCall(15, this, "ptr", Location, "HRESULT")
        return Location
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
     * @returns {Integer} 
     */
    get_Mode() {
        result := ComCall(17, this, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    put_Mode(Mode) {
        result := ComCall(18, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Node} 
     */
    get_RootNode() {
        result := ComCall(19, this, "ptr*", &Node := 0, "HRESULT")
        return Node(Node)
    }

    /**
     * 
     * @returns {ScopeNamespace} 
     */
    get_ScopeNamespace() {
        result := ComCall(20, this, "ptr*", &ScopeNamespace := 0, "HRESULT")
        return ScopeNamespace(ScopeNamespace)
    }

    /**
     * 
     * @returns {Properties} 
     */
    CreateProperties() {
        result := ComCall(21, this, "ptr*", &Properties := 0, "HRESULT")
        return Properties(Properties)
    }

    /**
     * 
     * @returns {_Application} 
     */
    get_Application() {
        result := ComCall(22, this, "ptr*", &Application := 0, "HRESULT")
        return _Application(Application)
    }
}
