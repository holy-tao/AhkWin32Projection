#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISWbemNamedValueSet.ahk" { ISWbemNamedValueSet }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ISWbemSecurity.ahk" { ISWbemSecurity }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemObjectPath extends IDispatch {
    /**
     * The interface identifier for ISWbemObjectPath
     * @type {Guid}
     */
    static IID := Guid("{5791bc27-ce9c-11d1-97bf-0000f81e849c}")

    /**
     * The class identifier for SWbemObjectPath
     * @type {Guid}
     */
    static CLSID := Guid("{5791bc26-ce9c-11d1-97bf-0000f81e849c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemObjectPath interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Path            : IntPtr
        put_Path            : IntPtr
        get_RelPath         : IntPtr
        put_RelPath         : IntPtr
        get_Server          : IntPtr
        put_Server          : IntPtr
        get_Namespace       : IntPtr
        put_Namespace       : IntPtr
        get_ParentNamespace : IntPtr
        get_DisplayName     : IntPtr
        put_DisplayName     : IntPtr
        get_Class           : IntPtr
        put_Class           : IntPtr
        get_IsClass         : IntPtr
        SetAsClass          : IntPtr
        get_IsSingleton     : IntPtr
        SetAsSingleton      : IntPtr
        get_Keys            : IntPtr
        get_Security_       : IntPtr
        get_Locale          : IntPtr
        put_Locale          : IntPtr
        get_Authority       : IntPtr
        put_Authority       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemObjectPath.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        strPath := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, strPath, "HRESULT")
        return strPath
    }

    /**
     * 
     * @param {BSTR} strPath 
     * @returns {HRESULT} 
     */
    put_Path(strPath) {
        strPath := strPath is String ? BSTR.Alloc(strPath).Value : strPath

        result := ComCall(8, this, BSTR, strPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RelPath() {
        strRelPath := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, strRelPath, "HRESULT")
        return strRelPath
    }

    /**
     * 
     * @param {BSTR} strRelPath 
     * @returns {HRESULT} 
     */
    put_RelPath(strRelPath) {
        strRelPath := strRelPath is String ? BSTR.Alloc(strRelPath).Value : strRelPath

        result := ComCall(10, this, BSTR, strRelPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Server() {
        strServer := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, strServer, "HRESULT")
        return strServer
    }

    /**
     * 
     * @param {BSTR} strServer 
     * @returns {HRESULT} 
     */
    put_Server(strServer) {
        strServer := strServer is String ? BSTR.Alloc(strServer).Value : strServer

        result := ComCall(12, this, BSTR, strServer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Namespace() {
        strNamespace := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, strNamespace, "HRESULT")
        return strNamespace
    }

    /**
     * 
     * @param {BSTR} strNamespace 
     * @returns {HRESULT} 
     */
    put_Namespace(strNamespace) {
        strNamespace := strNamespace is String ? BSTR.Alloc(strNamespace).Value : strNamespace

        result := ComCall(14, this, BSTR, strNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ParentNamespace() {
        strParentNamespace := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, strParentNamespace, "HRESULT")
        return strParentNamespace
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        strDisplayName := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, strDisplayName, "HRESULT")
        return strDisplayName
    }

    /**
     * 
     * @param {BSTR} strDisplayName 
     * @returns {HRESULT} 
     */
    put_DisplayName(strDisplayName) {
        strDisplayName := strDisplayName is String ? BSTR.Alloc(strDisplayName).Value : strDisplayName

        result := ComCall(17, this, BSTR, strDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Class() {
        strClass := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, strClass, "HRESULT")
        return strClass
    }

    /**
     * 
     * @param {BSTR} strClass 
     * @returns {HRESULT} 
     */
    put_Class(strClass) {
        strClass := strClass is String ? BSTR.Alloc(strClass).Value : strClass

        result := ComCall(19, this, BSTR, strClass, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsClass() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &bIsClass := 0, "HRESULT")
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
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &bIsSingleton := 0, "HRESULT")
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
        strLocale := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, strLocale, "HRESULT")
        return strLocale
    }

    /**
     * 
     * @param {BSTR} strLocale 
     * @returns {HRESULT} 
     */
    put_Locale(strLocale) {
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale

        result := ComCall(27, this, BSTR, strLocale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Authority() {
        strAuthority := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, strAuthority, "HRESULT")
        return strAuthority
    }

    /**
     * 
     * @param {BSTR} strAuthority 
     * @returns {HRESULT} 
     */
    put_Authority(strAuthority) {
        strAuthority := strAuthority is String ? BSTR.Alloc(strAuthority).Value : strAuthority

        result := ComCall(29, this, BSTR, strAuthority, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISWbemObjectPath.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.put_Path := CallbackCreate(GetMethod(implObj, "put_Path"), flags, 2)
        this.vtbl.get_RelPath := CallbackCreate(GetMethod(implObj, "get_RelPath"), flags, 2)
        this.vtbl.put_RelPath := CallbackCreate(GetMethod(implObj, "put_RelPath"), flags, 2)
        this.vtbl.get_Server := CallbackCreate(GetMethod(implObj, "get_Server"), flags, 2)
        this.vtbl.put_Server := CallbackCreate(GetMethod(implObj, "put_Server"), flags, 2)
        this.vtbl.get_Namespace := CallbackCreate(GetMethod(implObj, "get_Namespace"), flags, 2)
        this.vtbl.put_Namespace := CallbackCreate(GetMethod(implObj, "put_Namespace"), flags, 2)
        this.vtbl.get_ParentNamespace := CallbackCreate(GetMethod(implObj, "get_ParentNamespace"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.put_DisplayName := CallbackCreate(GetMethod(implObj, "put_DisplayName"), flags, 2)
        this.vtbl.get_Class := CallbackCreate(GetMethod(implObj, "get_Class"), flags, 2)
        this.vtbl.put_Class := CallbackCreate(GetMethod(implObj, "put_Class"), flags, 2)
        this.vtbl.get_IsClass := CallbackCreate(GetMethod(implObj, "get_IsClass"), flags, 2)
        this.vtbl.SetAsClass := CallbackCreate(GetMethod(implObj, "SetAsClass"), flags, 1)
        this.vtbl.get_IsSingleton := CallbackCreate(GetMethod(implObj, "get_IsSingleton"), flags, 2)
        this.vtbl.SetAsSingleton := CallbackCreate(GetMethod(implObj, "SetAsSingleton"), flags, 1)
        this.vtbl.get_Keys := CallbackCreate(GetMethod(implObj, "get_Keys"), flags, 2)
        this.vtbl.get_Security_ := CallbackCreate(GetMethod(implObj, "get_Security_"), flags, 2)
        this.vtbl.get_Locale := CallbackCreate(GetMethod(implObj, "get_Locale"), flags, 2)
        this.vtbl.put_Locale := CallbackCreate(GetMethod(implObj, "put_Locale"), flags, 2)
        this.vtbl.get_Authority := CallbackCreate(GetMethod(implObj, "get_Authority"), flags, 2)
        this.vtbl.put_Authority := CallbackCreate(GetMethod(implObj, "put_Authority"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.put_Path)
        CallbackFree(this.vtbl.get_RelPath)
        CallbackFree(this.vtbl.put_RelPath)
        CallbackFree(this.vtbl.get_Server)
        CallbackFree(this.vtbl.put_Server)
        CallbackFree(this.vtbl.get_Namespace)
        CallbackFree(this.vtbl.put_Namespace)
        CallbackFree(this.vtbl.get_ParentNamespace)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.put_DisplayName)
        CallbackFree(this.vtbl.get_Class)
        CallbackFree(this.vtbl.put_Class)
        CallbackFree(this.vtbl.get_IsClass)
        CallbackFree(this.vtbl.SetAsClass)
        CallbackFree(this.vtbl.get_IsSingleton)
        CallbackFree(this.vtbl.SetAsSingleton)
        CallbackFree(this.vtbl.get_Keys)
        CallbackFree(this.vtbl.get_Security_)
        CallbackFree(this.vtbl.get_Locale)
        CallbackFree(this.vtbl.put_Locale)
        CallbackFree(this.vtbl.get_Authority)
        CallbackFree(this.vtbl.put_Authority)
    }
}
