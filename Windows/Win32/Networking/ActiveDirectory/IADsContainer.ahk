#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsContainer interface enables an ADSI container object to create, delete, and manage contained ADSI objects. Container objects represent hierarchical directory trees, such as in a file system, and to organize the directory hierarchy.
 * @remarks
 * 
  * To determine if an object is a container, use the <a href="https://docs.microsoft.com/windows/desktop/ADSI/iadsclass-property-methods">IADsClass.Container</a> property of the object.
  * 
  * When you bind to a container object using its GUID (or SID), you can only perform specific operations on the container object. These operations include examination of the object attributes and enumeration of the object's immediate children. These operations are shown in the following code example.
  * 
  * 
  * ```vb
  * Dim con As IADsContainer
  * Dim obj As IADs
  * Set con = GetObject("LDAP://svr01/<GUID=xxxx>")
  * con.Filter = Array("user")
  * For Each item In con
  *     debug.print item.Name " &  " of " & item.Class
  * Next
  * ```
  * 
  * 
  * All other operations, that is, <b>GetObject</b>, <b>Create</b>, <b>Delete</b>, <b>CopyHere</b>, and <b>MoveHere</b> are not supported in the container's GUID representation. For example, the last line of the following code example will result in an error.
  * 
  * 
  * ```vb
  * Dim con As IADsContainer
  * Dim obj As IADs
  * Set con = GetObject("LDAP://svr01/<GUID=xxxx>")
  * Set obj = con.GetObject("user", "CN=Jeff Smith")
  * ```
  * 
  * 
  * Binding, using GUID (or SID), is intended for low overhead and, thus, fast binds, which are often used for object introspection.
  * 
  * To call these methods of the container bound with its GUID (or SID), rebind to the object using its distinguished name.
  * 
  * 
  * ```vb
  * Dim conGUID, conDN As IADsContainer
  * Dim obj As IADs
  * Set conGUID = GetObject("LDAP://svr/<GUID=xxxx>")
  * Set conDN=GetObject("LDAP://svr/" & conGUID.Get("distinguishedName"))
  * Set obj = conDN.GetObject("user", "CN=Jeff Smith")
  * ```
  * 
  * 
  * For more information about object GUID representation, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/iads-property-methods">IADs.GUID</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadscontainer
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsContainer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsContainer
     * @type {Guid}
     */
    static IID => Guid("{001677d0-fd16-11ce-abc4-02608c9e7553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Filter", "put_Filter", "get_Hints", "put_Hints", "GetObject", "Create", "Delete", "CopyHere", "MoveHere"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Count(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-get__newenum
     */
    get__NewEnum(retval) {
        result := ComCall(8, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    get_Filter(pVar) {
        result := ComCall(9, this, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Var 
     * @returns {HRESULT} 
     */
    put_Filter(Var) {
        result := ComCall(10, this, "ptr", Var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvFilter 
     * @returns {HRESULT} 
     */
    get_Hints(pvFilter) {
        result := ComCall(11, this, "ptr", pvFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vHints 
     * @returns {HRESULT} 
     */
    put_Hints(vHints) {
        result := ComCall(12, this, "ptr", vHints, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {BSTR} ClassName 
     * @param {BSTR} RelativeName 
     * @param {Pointer<IDispatch>} ppObject 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(ClassName, RelativeName, ppObject) {
        ClassName := ClassName is String ? BSTR.Alloc(ClassName).Value : ClassName
        RelativeName := RelativeName is String ? BSTR.Alloc(RelativeName).Value : RelativeName

        result := ComCall(13, this, "ptr", ClassName, "ptr", RelativeName, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ClassName 
     * @param {BSTR} RelativeName 
     * @param {Pointer<IDispatch>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-create
     */
    Create(ClassName, RelativeName, ppObject) {
        ClassName := ClassName is String ? BSTR.Alloc(ClassName).Value : ClassName
        RelativeName := RelativeName is String ? BSTR.Alloc(RelativeName).Value : RelativeName

        result := ComCall(14, this, "ptr", ClassName, "ptr", RelativeName, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrClassName 
     * @param {BSTR} bstrRelativeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-delete
     */
    Delete(bstrClassName, bstrRelativeName) {
        bstrClassName := bstrClassName is String ? BSTR.Alloc(bstrClassName).Value : bstrClassName
        bstrRelativeName := bstrRelativeName is String ? BSTR.Alloc(bstrRelativeName).Value : bstrRelativeName

        result := ComCall(15, this, "ptr", bstrClassName, "ptr", bstrRelativeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} SourceName 
     * @param {BSTR} NewName 
     * @param {Pointer<IDispatch>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-copyhere
     */
    CopyHere(SourceName, NewName, ppObject) {
        SourceName := SourceName is String ? BSTR.Alloc(SourceName).Value : SourceName
        NewName := NewName is String ? BSTR.Alloc(NewName).Value : NewName

        result := ComCall(16, this, "ptr", SourceName, "ptr", NewName, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} SourceName 
     * @param {BSTR} NewName 
     * @param {Pointer<IDispatch>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscontainer-movehere
     */
    MoveHere(SourceName, NewName, ppObject) {
        SourceName := SourceName is String ? BSTR.Alloc(SourceName).Value : SourceName
        NewName := NewName is String ? BSTR.Alloc(NewName).Value : NewName

        result := ComCall(17, this, "ptr", SourceName, "ptr", NewName, "ptr*", ppObject, "HRESULT")
        return result
    }
}
