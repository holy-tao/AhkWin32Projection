#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Node extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Node
     * @type {Guid}
     */
    static IID => Guid("{f81ed800-7839-4447-945d-8e15da59ca55}")

    /**
     * The class identifier for Node
     * @type {Guid}
     */
    static CLSID => Guid("{f81ed800-7839-4447-945d-8e15da59ca55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Property", "get_Bookmark", "IsScopeNode", "get_Nodetype"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @returns {BSTR} 
     */
    get_Property(PropertyName) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        PropertyValue := BSTR()
        result := ComCall(8, this, "ptr", PropertyName, "ptr", PropertyValue, "HRESULT")
        return PropertyValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Bookmark() {
        Bookmark := BSTR()
        result := ComCall(9, this, "ptr", Bookmark, "HRESULT")
        return Bookmark
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsScopeNode() {
        result := ComCall(10, this, "int*", &IsScopeNode := 0, "HRESULT")
        return IsScopeNode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Nodetype() {
        Nodetype := BSTR()
        result := ComCall(11, this, "ptr", Nodetype, "HRESULT")
        return Nodetype
    }
}
