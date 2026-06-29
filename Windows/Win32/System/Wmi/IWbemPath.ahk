#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWbemPathKeyList.ahk" { IWbemPathKeyList }

/**
 * The IWbemPath interface is the primary interface for the object path parser and makes parsing a path available to programs in a standard way. This interface is the main interface for setting and retrieving path information.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nn-wmiutils-iwbempath
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemPath extends IUnknown {
    /**
     * The interface identifier for IWbemPath
     * @type {Guid}
     */
    static IID := Guid("{3bc15af2-736c-477e-9e51-238af8667dcc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemPath interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetText             : IntPtr
        GetText             : IntPtr
        GetInfo             : IntPtr
        SetServer           : IntPtr
        GetServer           : IntPtr
        GetNamespaceCount   : IntPtr
        SetNamespaceAt      : IntPtr
        GetNamespaceAt      : IntPtr
        RemoveNamespaceAt   : IntPtr
        RemoveAllNamespaces : IntPtr
        GetScopeCount       : IntPtr
        SetScope            : IntPtr
        SetScopeFromText    : IntPtr
        GetScope            : IntPtr
        GetScopeAsText      : IntPtr
        RemoveScope         : IntPtr
        RemoveAllScopes     : IntPtr
        SetClassName        : IntPtr
        GetClassName        : IntPtr
        GetKeyList          : IntPtr
        CreateClassPart     : IntPtr
        DeleteClassPart     : IntPtr
        IsRelative          : IntPtr
        IsRelativeOrChild   : IntPtr
        IsLocal             : IntPtr
        IsSameClassName     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemPath.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemPath::SetText method parses a path so that information on the path can be returned by the path parser.
     * @param {Integer} uMode Flag specifying the type of paths accepted.
     * @param {PWSTR} pszPath Path to be parsed.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-settext
     */
    SetText(uMode, pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(3, this, "uint", uMode, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::GetText method returns a textual representation of a path that has previously been placed into a parser object.
     * @param {Integer} lFlags Flag which controls how the text is returned.
     * @param {Pointer<Integer>} puBuffLength Caller sets this to the size of <i>pszText</i>. If the method is successful, it sets <i>puBufferLength</i> to the number of wide characters used, including the terminating null character.
     * @param {PWSTR} pszText Textual representation of the path.
     * @returns {HRESULT} This method returns the following values.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-gettext
     */
    GetText(lFlags, puBuffLength, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        puBuffLengthMarshal := puBuffLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", lFlags, puBuffLengthMarshal, puBuffLength, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::GetInfo method returns details about a path that has been placed into a parser object.
     * @param {Integer} uRequestedInfo Reserved for future use. Must be 0 (zero).
     * @returns {Integer} Upon success, this bitmap is set to 0 (zero) or more bits in the following list.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getinfo
     */
    GetInfo(uRequestedInfo) {
        result := ComCall(5, this, "uint", uRequestedInfo, "uint*", &puResponse := 0, "HRESULT")
        return puResponse
    }

    /**
     * The IWbemPath::SetServer method sets the server portion of the path.
     * @param {PWSTR} Name New server name. <b>NULL</b> is an acceptable value.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-setserver
     */
    SetServer(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(6, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::GetServer method retrieves the server portion of the path.
     * @remarks
     * This method can be used to determine how big a buffer is needed for <i>pszName</i>. This is done by passing in a <b>NULL</b> pointer for the buffer, setting <i>puNameBufLength</i> to 0 (zero) and then making the call. Upon return, <i>puNameBufLength</i> indicates how large a buffer is needed for <i>pszName</i> and its terminating <b>NULL</b> character.
     * @param {Pointer<Integer>} puNameBufLength Upon input, this is the size in characters of the buffer pointed to by <i>pszName</i>. Upon return, this is the number of characters in the server name, including the <b>NULL</b> terminator.
     * @param {PWSTR} pName Server name.
     * @returns {HRESULT} This method returns the following values.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getserver
     */
    GetServer(puNameBufLength, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        puNameBufLengthMarshal := puNameBufLength is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, puNameBufLengthMarshal, puNameBufLength, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::GetNamespaceCount method returns the number of namespaces in the path.
     * @returns {Integer} Number of namespaces in the path.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getnamespacecount
     */
    GetNamespaceCount() {
        result := ComCall(8, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * The IWbemPath::SetNamespace method sets a namespace in a path using zero-based indexing to designate where in the path the namespace is positioned.
     * @param {Integer} uIndex Index of where the namespace is to be put. The leftmost namespace in the path is index 0 (zero) with each namespace to the right having a progressively higher index value. The maximum permitted value is the current number of namespaces, because specifying that would add a namespace to the end as the namespaces have a zero-based index.
     * @param {PWSTR} pszName Namespace name.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-setnamespaceat
     */
    SetNamespaceAt(uIndex, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "uint", uIndex, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Retrieves a namespace based upon its index.
     * @remarks
     * This method can be used to determine how big a buffer is needed for <i>pName</i>. This is done by passing in a <b>NULL</b> pointer for the buffer, setting <i>puNameBufLength</i> to 0 and then making the call. Upon return, <i>puNameBufLength</i> indicates how large of a buffer is needed for <i>pName</i> and its terminating <b>NULL</b> character.
     * @param {Integer} uIndex Index of the namespace to be read. The leftmost namespace in the path is index 0 with each namespace to the right having a progressively higher index value. The maximum permitted value is one less than the current number of namespaces.
     * @param {Pointer<Integer>} puNameBufLength Caller sets this to the number of characters the buffer can hold. Upon success, this is set to the number of characters copied into the buffer including the <b>NULL</b> terminator.
     * @param {PWSTR} pName Namespace name.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getnamespaceat
     */
    GetNamespaceAt(uIndex, puNameBufLength, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        puNameBufLengthMarshal := puNameBufLength is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", uIndex, puNameBufLengthMarshal, puNameBufLength, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::RemoveNamespaceAt method removes a namespace at a particular index. The leftmost namespace has an index value of 0 (zero), while namespaces to the right have progressively higher index values.
     * @param {Integer} uIndex Zero-based index value of the namespace to be removed.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> with one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-removenamespaceat
     */
    RemoveNamespaceAt(uIndex) {
        result := ComCall(11, this, "uint", uIndex, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::RemoveAllNamespaces method removes the namespace portion of the path.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-removeallnamespaces
     */
    RemoveAllNamespaces() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::GetScopeCount method returns the number of scopes in the path.
     * @returns {Integer} Number of scopes in the path. When there is a scope it is basically the class or key portion of the path.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getscopecount
     */
    GetScopeCount() {
        result := ComCall(13, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * The IWbemPath::SetScope method sets a scope in the path based upon an index. The index is always 0 (zero) and the scope is the class or key portion of the path. This method also sets the class name.
     * @param {Integer} uIndex Index of the scope.
     * @param {PWSTR} pszClass Class name of the scope.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-setscope
     */
    SetScope(uIndex, pszClass) {
        pszClass := pszClass is String ? StrPtr(pszClass) : pszClass

        result := ComCall(14, this, "uint", uIndex, "ptr", pszClass, "HRESULT")
        return result
    }

    /**
     * The IWbemPath interface is the primary interface for the object path parser and makes parsing a path available to programs in a standard way. This interface is the main interface for setting and retrieving path information.
     * @param {Integer} uIndex 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nn-wmiutils-iwbempath
     */
    SetScopeFromText(uIndex, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(15, this, "uint", uIndex, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * Retrieves a scope based upon an index.
     * @remarks
     * This method can be used to determine how big a buffer is needed for <i>pszClass</i>. This is done by passing in a <b>NULL</b> pointer for the buffer, setting <i>puClassNameBufSize</i> to 0 and then making the call. Upon return, <i>puClassNameBufSize</i> indicates how large of a buffer is needed for <i>pszClass</i> and its terminating <b>NULL</b> character.
     * @param {Integer} uIndex Index of the scope.
     * @param {Pointer<Integer>} puClassNameBufSize Caller sets this to the number of characters that the buffer can hold. Upon success, this is set to the number of characters copied into the buffer including the <b>NULL</b> terminator.
     * @param {PWSTR} pszClass Buffer where the scope is to be copied.
     * @returns {IWbemPathKeyList} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmiutils/nn-wmiutils-iwbempathkeylist">IWbemPathKeyList</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getscope
     */
    GetScope(uIndex, puClassNameBufSize, pszClass) {
        pszClass := pszClass is String ? StrPtr(pszClass) : pszClass

        puClassNameBufSizeMarshal := puClassNameBufSize is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", uIndex, puClassNameBufSizeMarshal, puClassNameBufSize, "ptr", pszClass, "ptr*", &pKeyList := 0, "HRESULT")
        return IWbemPathKeyList(pKeyList)
    }

    /**
     * Retrieves a scope in text format based on an index.
     * @remarks
     * This method can be used to determine how big a buffer is needed for <i>pszText</i>. This is done by passing in a <b>NULL</b> pointer for the buffer, setting <i>puTextBufSize</i> to zero (0), and then making the call. When returned, <i>puTextBufSize</i> indicates how large  a buffer is needed for <i>pszText</i> and its terminating <b>NULL</b> character.
     * @param {Integer} uIndex Index of the scope.
     * @param {Pointer<Integer>} puTextBufSize Caller sets this to the number of characters that the buffer can hold. After success this is set to the number of characters copied into the buffer including the <b>NULL</b> terminator.
     * @param {PWSTR} pszText Buffer where the scope is to be copied.
     * @returns {HRESULT} This method returns the following values.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getscopeastext
     */
    GetScopeAsText(uIndex, puTextBufSize, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        puTextBufSizeMarshal := puTextBufSize is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", uIndex, puTextBufSizeMarshal, puTextBufSize, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::RemoveScope method removes a scope based on the index.
     * @param {Integer} uIndex Index of the scope to be removed.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> with one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-removescope
     */
    RemoveScope(uIndex) {
        result := ComCall(18, this, "uint", uIndex, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::RemoveAllScopes method removes all scopes from the path.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> with one of the values in the following.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-removeallscopes
     */
    RemoveAllScopes() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::SetClassName method sets the class name portion of the path.
     * @param {PWSTR} Name Class name.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-setclassname
     */
    SetClassName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::GetClassName method retrieves the class name portion from the path.
     * @remarks
     * This method can be used to determine how big a buffer is needed for <i>pszName</i>. This is done by passing in a <b>NULL</b> pointer for the buffer, setting <i>puBuffLength</i> to 0 and then making the call. Upon return, <i>puBuffLength</i> indicates how large of a buffer is needed for <i>pszName</i> and its terminating <b>NULL</b> character.
     * @param {Pointer<Integer>} puBuffLength Caller sets this to the number of characters the buffer can hold. Upon success, this is set to the number of characters copied into the buffer, including the <b>NULL</b> terminator.
     * @param {PWSTR} pszName Buffer into which the class name is copied.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getclassname
     */
    GetClassName(puBuffLength, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        puBuffLengthMarshal := puBuffLength is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, puBuffLengthMarshal, puBuffLength, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Retrieves an IWbemPathKeyList pointer so that the individual key may be accessed.
     * @returns {IWbemPathKeyList} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmiutils/nn-wmiutils-iwbempathkeylist">IWbemPathKeyList</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getkeylist
     */
    GetKeyList() {
        result := ComCall(22, this, "ptr*", &pOut := 0, "HRESULT")
        return IWbemPathKeyList(pOut)
    }

    /**
     * Initializes the class or key portion of the path.
     * @param {Integer} lFlags Reserved. Must be 0 (zero).
     * @param {PWSTR} Name Initial class name.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-createclasspart
     */
    CreateClassPart(lFlags, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(23, this, "int", lFlags, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::DeleteClassPart method deletes the class portion of the path.
     * @param {Integer} lFlags Reserved. Must be 0 (zero).
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-deleteclasspart
     */
    DeleteClassPart(lFlags) {
        result := ComCall(24, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The IWbemPath::IsRelative method tests if the path, as already set in the parser, is relative to a particular computer and namespace.
     * @param {PWSTR} wszMachine Name of the computer.
     * @param {PWSTR} wszNamespace Namespace being tested.
     * @returns {BOOL} This method returns a BOOL indicating whether the path is relative to the specified computer and namespace.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-isrelative
     */
    IsRelative(wszMachine, wszNamespace) {
        wszMachine := wszMachine is String ? StrPtr(wszMachine) : wszMachine
        wszNamespace := wszNamespace is String ? StrPtr(wszNamespace) : wszNamespace

        result := ComCall(25, this, "ptr", wszMachine, "ptr", wszNamespace, BOOL)
        return result
    }

    /**
     * The IWbemPath::IsRelativeOrChild method tests if the path, as already set in the parser, is relative to or a child of a particular computer and namespace.
     * @param {PWSTR} wszMachine Name of the computer.
     * @param {PWSTR} wszNamespace Namespace being tested.
     * @param {Integer} lFlags Reserved. Must be 0 (zero).
     * @returns {BOOL} This method returns a <b>BOOL</b> indicating whether the path is relative to the specified computer and namespace.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-isrelativeorchild
     */
    IsRelativeOrChild(wszMachine, wszNamespace, lFlags) {
        wszMachine := wszMachine is String ? StrPtr(wszMachine) : wszMachine
        wszNamespace := wszNamespace is String ? StrPtr(wszNamespace) : wszNamespace

        result := ComCall(26, this, "ptr", wszMachine, "ptr", wszNamespace, "int", lFlags, BOOL)
        return result
    }

    /**
     * The IWbemPath::IsLocal method tests if the computer name passed in matches the computer name in the path, or if the server name in the path is NULL or &quot;.&quot;.
     * @param {PWSTR} wszMachine Name of the computer to test.
     * @returns {BOOL} This method returns a <b>BOOL</b> indicating whether the path matches the passed in computer name, or if the server name in the path is <b>NULL</b> or ".".
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-islocal
     */
    IsLocal(wszMachine) {
        wszMachine := wszMachine is String ? StrPtr(wszMachine) : wszMachine

        result := ComCall(27, this, "ptr", wszMachine, BOOL)
        return result
    }

    /**
     * The IWbemPath::IsSameClassName method tests whether the class name passed in matches the one in the path. The method can return TRUE only if the path actually has a class name.
     * @param {PWSTR} wszClass Class name to test.
     * @returns {BOOL} This method returns a BOOL indicating whether the class name matches the one in the path.
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-issameclassname
     */
    IsSameClassName(wszClass) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(28, this, "ptr", wszClass, BOOL)
        return result
    }

    Query(iid) {
        if (IWbemPath.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetText := CallbackCreate(GetMethod(implObj, "SetText"), flags, 3)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 4)
        this.vtbl.GetInfo := CallbackCreate(GetMethod(implObj, "GetInfo"), flags, 3)
        this.vtbl.SetServer := CallbackCreate(GetMethod(implObj, "SetServer"), flags, 2)
        this.vtbl.GetServer := CallbackCreate(GetMethod(implObj, "GetServer"), flags, 3)
        this.vtbl.GetNamespaceCount := CallbackCreate(GetMethod(implObj, "GetNamespaceCount"), flags, 2)
        this.vtbl.SetNamespaceAt := CallbackCreate(GetMethod(implObj, "SetNamespaceAt"), flags, 3)
        this.vtbl.GetNamespaceAt := CallbackCreate(GetMethod(implObj, "GetNamespaceAt"), flags, 4)
        this.vtbl.RemoveNamespaceAt := CallbackCreate(GetMethod(implObj, "RemoveNamespaceAt"), flags, 2)
        this.vtbl.RemoveAllNamespaces := CallbackCreate(GetMethod(implObj, "RemoveAllNamespaces"), flags, 1)
        this.vtbl.GetScopeCount := CallbackCreate(GetMethod(implObj, "GetScopeCount"), flags, 2)
        this.vtbl.SetScope := CallbackCreate(GetMethod(implObj, "SetScope"), flags, 3)
        this.vtbl.SetScopeFromText := CallbackCreate(GetMethod(implObj, "SetScopeFromText"), flags, 3)
        this.vtbl.GetScope := CallbackCreate(GetMethod(implObj, "GetScope"), flags, 5)
        this.vtbl.GetScopeAsText := CallbackCreate(GetMethod(implObj, "GetScopeAsText"), flags, 4)
        this.vtbl.RemoveScope := CallbackCreate(GetMethod(implObj, "RemoveScope"), flags, 2)
        this.vtbl.RemoveAllScopes := CallbackCreate(GetMethod(implObj, "RemoveAllScopes"), flags, 1)
        this.vtbl.SetClassName := CallbackCreate(GetMethod(implObj, "SetClassName"), flags, 2)
        this.vtbl.GetClassName := CallbackCreate(GetMethod(implObj, "GetClassName"), flags, 3)
        this.vtbl.GetKeyList := CallbackCreate(GetMethod(implObj, "GetKeyList"), flags, 2)
        this.vtbl.CreateClassPart := CallbackCreate(GetMethod(implObj, "CreateClassPart"), flags, 3)
        this.vtbl.DeleteClassPart := CallbackCreate(GetMethod(implObj, "DeleteClassPart"), flags, 2)
        this.vtbl.IsRelative := CallbackCreate(GetMethod(implObj, "IsRelative"), flags, 3)
        this.vtbl.IsRelativeOrChild := CallbackCreate(GetMethod(implObj, "IsRelativeOrChild"), flags, 4)
        this.vtbl.IsLocal := CallbackCreate(GetMethod(implObj, "IsLocal"), flags, 2)
        this.vtbl.IsSameClassName := CallbackCreate(GetMethod(implObj, "IsSameClassName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetText)
        CallbackFree(this.vtbl.GetText)
        CallbackFree(this.vtbl.GetInfo)
        CallbackFree(this.vtbl.SetServer)
        CallbackFree(this.vtbl.GetServer)
        CallbackFree(this.vtbl.GetNamespaceCount)
        CallbackFree(this.vtbl.SetNamespaceAt)
        CallbackFree(this.vtbl.GetNamespaceAt)
        CallbackFree(this.vtbl.RemoveNamespaceAt)
        CallbackFree(this.vtbl.RemoveAllNamespaces)
        CallbackFree(this.vtbl.GetScopeCount)
        CallbackFree(this.vtbl.SetScope)
        CallbackFree(this.vtbl.SetScopeFromText)
        CallbackFree(this.vtbl.GetScope)
        CallbackFree(this.vtbl.GetScopeAsText)
        CallbackFree(this.vtbl.RemoveScope)
        CallbackFree(this.vtbl.RemoveAllScopes)
        CallbackFree(this.vtbl.SetClassName)
        CallbackFree(this.vtbl.GetClassName)
        CallbackFree(this.vtbl.GetKeyList)
        CallbackFree(this.vtbl.CreateClassPart)
        CallbackFree(this.vtbl.DeleteClassPart)
        CallbackFree(this.vtbl.IsRelative)
        CallbackFree(this.vtbl.IsRelativeOrChild)
        CallbackFree(this.vtbl.IsLocal)
        CallbackFree(this.vtbl.IsSameClassName)
    }
}
