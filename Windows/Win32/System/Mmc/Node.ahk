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
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Name
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @returns {BSTR} 
     */
    get_Property(PropertyName) {
        if(PropertyName is String) {
            pin := BSTR.Alloc(PropertyName)
            PropertyName := pin.Value
        }

        PropertyValue_ := BSTR()
        result := ComCall(8, this, "ptr", PropertyName, "ptr", PropertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyValue_
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Bookmark() {
        Bookmark := BSTR()
        result := ComCall(9, this, "ptr", Bookmark, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Bookmark
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsScopeNode() {
        result := ComCall(10, this, "int*", &IsScopeNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IsScopeNode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Nodetype() {
        Nodetype := BSTR()
        result := ComCall(11, this, "ptr", Nodetype, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Nodetype
    }
}
