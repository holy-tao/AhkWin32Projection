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
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(8, this, "ptr", PropertyName, "ptr", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Bookmark 
     * @returns {HRESULT} 
     */
    get_Bookmark(Bookmark) {
        result := ComCall(9, this, "ptr", Bookmark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} IsScopeNode 
     * @returns {HRESULT} 
     */
    IsScopeNode(IsScopeNode) {
        result := ComCall(10, this, "ptr", IsScopeNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Nodetype 
     * @returns {HRESULT} 
     */
    get_Nodetype(Nodetype) {
        result := ComCall(11, this, "ptr", Nodetype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
