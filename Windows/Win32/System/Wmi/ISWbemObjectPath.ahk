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
        result := ComCall(7, this, "ptr", strPath, "HRESULT")
        return strPath
    }

    /**
     * 
     * @param {BSTR} strPath 
     * @returns {HRESULT} 
     */
    put_Path(strPath) {
        strPath := strPath is String ? BSTR.Alloc(strPath).Value : strPath

        result := ComCall(8, this, "ptr", strPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RelPath() {
        strRelPath := BSTR()
        result := ComCall(9, this, "ptr", strRelPath, "HRESULT")
        return strRelPath
    }

    /**
     * 
     * @param {BSTR} strRelPath 
     * @returns {HRESULT} 
     */
    put_RelPath(strRelPath) {
        strRelPath := strRelPath is String ? BSTR.Alloc(strRelPath).Value : strRelPath

        result := ComCall(10, this, "ptr", strRelPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Server() {
        strServer := BSTR()
        result := ComCall(11, this, "ptr", strServer, "HRESULT")
        return strServer
    }

    /**
     * 
     * @param {BSTR} strServer 
     * @returns {HRESULT} 
     */
    put_Server(strServer) {
        strServer := strServer is String ? BSTR.Alloc(strServer).Value : strServer

        result := ComCall(12, this, "ptr", strServer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Namespace() {
        strNamespace := BSTR()
        result := ComCall(13, this, "ptr", strNamespace, "HRESULT")
        return strNamespace
    }

    /**
     * 
     * @param {BSTR} strNamespace 
     * @returns {HRESULT} 
     */
    put_Namespace(strNamespace) {
        strNamespace := strNamespace is String ? BSTR.Alloc(strNamespace).Value : strNamespace

        result := ComCall(14, this, "ptr", strNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ParentNamespace() {
        strParentNamespace := BSTR()
        result := ComCall(15, this, "ptr", strParentNamespace, "HRESULT")
        return strParentNamespace
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        strDisplayName := BSTR()
        result := ComCall(16, this, "ptr", strDisplayName, "HRESULT")
        return strDisplayName
    }

    /**
     * 
     * @param {BSTR} strDisplayName 
     * @returns {HRESULT} 
     */
    put_DisplayName(strDisplayName) {
        strDisplayName := strDisplayName is String ? BSTR.Alloc(strDisplayName).Value : strDisplayName

        result := ComCall(17, this, "ptr", strDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Class() {
        strClass := BSTR()
        result := ComCall(18, this, "ptr", strClass, "HRESULT")
        return strClass
    }

    /**
     * 
     * @param {BSTR} strClass 
     * @returns {HRESULT} 
     */
    put_Class(strClass) {
        strClass := strClass is String ? BSTR.Alloc(strClass).Value : strClass

        result := ComCall(19, this, "ptr", strClass, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsClass() {
        result := ComCall(20, this, "short*", &bIsClass := 0, "HRESULT")
        return bIsClass
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAsClass() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsSingleton() {
        result := ComCall(22, this, "short*", &bIsSingleton := 0, "HRESULT")
        return bIsSingleton
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAsSingleton() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISWbemNamedValueSet} 
     */
    get_Keys() {
        result := ComCall(24, this, "ptr*", &objWbemNamedValueSet := 0, "HRESULT")
        return ISWbemNamedValueSet(objWbemNamedValueSet)
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(25, this, "ptr*", &objWbemSecurity := 0, "HRESULT")
        return ISWbemSecurity(objWbemSecurity)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Locale() {
        strLocale := BSTR()
        result := ComCall(26, this, "ptr", strLocale, "HRESULT")
        return strLocale
    }

    /**
     * 
     * @param {BSTR} strLocale 
     * @returns {HRESULT} 
     */
    put_Locale(strLocale) {
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale

        result := ComCall(27, this, "ptr", strLocale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Authority() {
        strAuthority := BSTR()
        result := ComCall(28, this, "ptr", strAuthority, "HRESULT")
        return strAuthority
    }

    /**
     * 
     * @param {BSTR} strAuthority 
     * @returns {HRESULT} 
     */
    put_Authority(strAuthority) {
        strAuthority := strAuthority is String ? BSTR.Alloc(strAuthority).Value : strAuthority

        result := ComCall(29, this, "ptr", strAuthority, "HRESULT")
        return result
    }
}
