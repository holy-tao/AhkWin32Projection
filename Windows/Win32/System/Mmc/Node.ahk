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
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @param {Pointer<BSTR>} PropertyValue 
     * @returns {HRESULT} 
     */
    get_Property(PropertyName, PropertyValue) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(8, this, "ptr", PropertyName, "ptr", PropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Bookmark 
     * @returns {HRESULT} 
     */
    get_Bookmark(Bookmark) {
        result := ComCall(9, this, "ptr", Bookmark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} IsScopeNode 
     * @returns {HRESULT} 
     */
    IsScopeNode(IsScopeNode) {
        result := ComCall(10, this, "ptr", IsScopeNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Nodetype 
     * @returns {HRESULT} 
     */
    get_Nodetype(Nodetype) {
        result := ComCall(11, this, "ptr", Nodetype, "HRESULT")
        return result
    }
}
