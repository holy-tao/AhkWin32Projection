#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<Views>} Views 
     * @returns {HRESULT} 
     */
    get_Views(Views) {
        result := ComCall(10, this, "ptr*", Views, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SnapIns>} SnapIns 
     * @returns {HRESULT} 
     */
    get_SnapIns(SnapIns) {
        result := ComCall(11, this, "ptr*", SnapIns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<View>} View 
     * @returns {HRESULT} 
     */
    get_ActiveView(View) {
        result := ComCall(12, this, "ptr*", View, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(13, this, "ptr", Name, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} Location 
     * @returns {HRESULT} 
     */
    get_Location(Location) {
        result := ComCall(15, this, "ptr", Location, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} IsSaved 
     * @returns {HRESULT} 
     */
    get_IsSaved(IsSaved) {
        result := ComCall(16, this, "ptr", IsSaved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Mode 
     * @returns {HRESULT} 
     */
    get_Mode(Mode) {
        ModeMarshal := Mode is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, ModeMarshal, Mode, "HRESULT")
        return result
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
     * @param {Pointer<Node>} Node 
     * @returns {HRESULT} 
     */
    get_RootNode(Node) {
        result := ComCall(19, this, "ptr*", Node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ScopeNamespace>} ScopeNamespace 
     * @returns {HRESULT} 
     */
    get_ScopeNamespace(ScopeNamespace) {
        result := ComCall(20, this, "ptr*", ScopeNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Properties>} Properties 
     * @returns {HRESULT} 
     */
    CreateProperties(Properties) {
        result := ComCall(21, this, "ptr*", Properties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<_Application>} Application 
     * @returns {HRESULT} 
     */
    get_Application(Application) {
        result := ComCall(22, this, "ptr*", Application, "HRESULT")
        return result
    }
}
