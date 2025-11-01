#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} strPath 
     * @returns {HRESULT} 
     */
    get_Path(strPath) {
        result := ComCall(7, this, "ptr", strPath, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} strRelPath 
     * @returns {HRESULT} 
     */
    get_RelPath(strRelPath) {
        result := ComCall(9, this, "ptr", strRelPath, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} strServer 
     * @returns {HRESULT} 
     */
    get_Server(strServer) {
        result := ComCall(11, this, "ptr", strServer, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} strNamespace 
     * @returns {HRESULT} 
     */
    get_Namespace(strNamespace) {
        result := ComCall(13, this, "ptr", strNamespace, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} strParentNamespace 
     * @returns {HRESULT} 
     */
    get_ParentNamespace(strParentNamespace) {
        result := ComCall(15, this, "ptr", strParentNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strDisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(strDisplayName) {
        result := ComCall(16, this, "ptr", strDisplayName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} strClass 
     * @returns {HRESULT} 
     */
    get_Class(strClass) {
        result := ComCall(18, this, "ptr", strClass, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} bIsClass 
     * @returns {HRESULT} 
     */
    get_IsClass(bIsClass) {
        result := ComCall(20, this, "ptr", bIsClass, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} bIsSingleton 
     * @returns {HRESULT} 
     */
    get_IsSingleton(bIsSingleton) {
        result := ComCall(22, this, "ptr", bIsSingleton, "HRESULT")
        return result
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
     * @param {Pointer<ISWbemNamedValueSet>} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    get_Keys(objWbemNamedValueSet) {
        result := ComCall(24, this, "ptr*", objWbemNamedValueSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemSecurity>} objWbemSecurity 
     * @returns {HRESULT} 
     */
    get_Security_(objWbemSecurity) {
        result := ComCall(25, this, "ptr*", objWbemSecurity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strLocale 
     * @returns {HRESULT} 
     */
    get_Locale(strLocale) {
        result := ComCall(26, this, "ptr", strLocale, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} strAuthority 
     * @returns {HRESULT} 
     */
    get_Authority(strAuthority) {
        result := ComCall(28, this, "ptr", strAuthority, "HRESULT")
        return result
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
