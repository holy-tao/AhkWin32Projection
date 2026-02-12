#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemNamedValueSet.ahk
#Include .\ISWbemSecurity.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemObjectPath extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemObjectPath
     * @type {Guid}
     */
    static IID => Guid("{5791bc27-ce9c-11d1-97bf-0000f81e849c}")

    /**
     * The class identifier for SWbemObjectPath
     * @type {Guid}
     */
    static CLSID => Guid("{5791bc26-ce9c-11d1-97bf-0000f81e849c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "put_Path", "get_RelPath", "put_RelPath", "get_Server", "put_Server", "get_Namespace", "put_Namespace", "get_ParentNamespace", "get_DisplayName", "put_DisplayName", "get_Class", "put_Class", "get_IsClass", "SetAsClass", "get_IsSingleton", "SetAsSingleton", "get_Keys", "get_Security_", "get_Locale", "put_Locale", "get_Authority", "put_Authority"]

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * @type {BSTR} 
     */
    RelPath {
        get => this.get_RelPath()
        set => this.put_RelPath(value)
    }

    /**
     * @type {BSTR} 
     */
    Server {
        get => this.get_Server()
        set => this.put_Server(value)
    }

    /**
     * @type {BSTR} 
     */
    Namespace {
        get => this.get_Namespace()
        set => this.put_Namespace(value)
    }

    /**
     * @type {BSTR} 
     */
    ParentNamespace {
        get => this.get_ParentNamespace()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {BSTR} 
     */
    Class {
        get => this.get_Class()
        set => this.put_Class(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsClass {
        get => this.get_IsClass()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsSingleton {
        get => this.get_IsSingleton()
    }

    /**
     * @type {ISWbemNamedValueSet} 
     */
    Keys {
        get => this.get_Keys()
    }

    /**
     * @type {ISWbemSecurity} 
     */
    Security_ {
        get => this.get_Security_()
    }

    /**
     * @type {BSTR} 
     */
    Locale {
        get => this.get_Locale()
        set => this.put_Locale(value)
    }

    /**
     * @type {BSTR} 
     */
    Authority {
        get => this.get_Authority()
        set => this.put_Authority(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        strPath := BSTR()
        result := ComCall(7, this, "ptr", strPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strPath
    }

    /**
     * 
     * @param {BSTR} strPath 
     * @returns {HRESULT} 
     */
    put_Path(strPath) {
        if(strPath is String) {
            pin := BSTR.Alloc(strPath)
            strPath := pin.Value
        }

        result := ComCall(8, this, "ptr", strPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RelPath() {
        strRelPath := BSTR()
        result := ComCall(9, this, "ptr", strRelPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strRelPath
    }

    /**
     * 
     * @param {BSTR} strRelPath 
     * @returns {HRESULT} 
     */
    put_RelPath(strRelPath) {
        if(strRelPath is String) {
            pin := BSTR.Alloc(strRelPath)
            strRelPath := pin.Value
        }

        result := ComCall(10, this, "ptr", strRelPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Server() {
        strServer := BSTR()
        result := ComCall(11, this, "ptr", strServer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strServer
    }

    /**
     * 
     * @param {BSTR} strServer 
     * @returns {HRESULT} 
     */
    put_Server(strServer) {
        if(strServer is String) {
            pin := BSTR.Alloc(strServer)
            strServer := pin.Value
        }

        result := ComCall(12, this, "ptr", strServer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Namespace() {
        strNamespace := BSTR()
        result := ComCall(13, this, "ptr", strNamespace, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strNamespace
    }

    /**
     * 
     * @param {BSTR} strNamespace 
     * @returns {HRESULT} 
     */
    put_Namespace(strNamespace) {
        if(strNamespace is String) {
            pin := BSTR.Alloc(strNamespace)
            strNamespace := pin.Value
        }

        result := ComCall(14, this, "ptr", strNamespace, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ParentNamespace() {
        strParentNamespace := BSTR()
        result := ComCall(15, this, "ptr", strParentNamespace, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strParentNamespace
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        strDisplayName := BSTR()
        result := ComCall(16, this, "ptr", strDisplayName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strDisplayName
    }

    /**
     * 
     * @param {BSTR} strDisplayName 
     * @returns {HRESULT} 
     */
    put_DisplayName(strDisplayName) {
        if(strDisplayName is String) {
            pin := BSTR.Alloc(strDisplayName)
            strDisplayName := pin.Value
        }

        result := ComCall(17, this, "ptr", strDisplayName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Class() {
        strClass := BSTR()
        result := ComCall(18, this, "ptr", strClass, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strClass
    }

    /**
     * 
     * @param {BSTR} strClass 
     * @returns {HRESULT} 
     */
    put_Class(strClass) {
        if(strClass is String) {
            pin := BSTR.Alloc(strClass)
            strClass := pin.Value
        }

        result := ComCall(19, this, "ptr", strClass, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsClass() {
        result := ComCall(20, this, "short*", &bIsClass := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bIsClass
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAsClass() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsSingleton() {
        result := ComCall(22, this, "short*", &bIsSingleton := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bIsSingleton
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAsSingleton() {
        result := ComCall(23, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISWbemNamedValueSet} 
     */
    get_Keys() {
        result := ComCall(24, this, "ptr*", &objWbemNamedValueSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemNamedValueSet(objWbemNamedValueSet)
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(25, this, "ptr*", &objWbemSecurity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemSecurity(objWbemSecurity)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Locale() {
        strLocale := BSTR()
        result := ComCall(26, this, "ptr", strLocale, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strLocale
    }

    /**
     * 
     * @param {BSTR} strLocale 
     * @returns {HRESULT} 
     */
    put_Locale(strLocale) {
        if(strLocale is String) {
            pin := BSTR.Alloc(strLocale)
            strLocale := pin.Value
        }

        result := ComCall(27, this, "ptr", strLocale, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Authority() {
        strAuthority := BSTR()
        result := ComCall(28, this, "ptr", strAuthority, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strAuthority
    }

    /**
     * 
     * @param {BSTR} strAuthority 
     * @returns {HRESULT} 
     */
    put_Authority(strAuthority) {
        if(strAuthority is String) {
            pin := BSTR.Alloc(strAuthority)
            strAuthority := pin.Value
        }

        result := ComCall(29, this, "ptr", strAuthority, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
