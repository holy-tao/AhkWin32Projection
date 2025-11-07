#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemPathKeyList.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemPath interface is the primary interface for the object path parser and makes parsing a path available to programs in a standard way. This interface is the main interface for setting and retrieving path information.
 * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nn-wmiutils-iwbempath
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemPath extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemPath
     * @type {Guid}
     */
    static IID => Guid("{3bc15af2-736c-477e-9e51-238af8667dcc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetText", "GetText", "GetInfo", "SetServer", "GetServer", "GetNamespaceCount", "SetNamespaceAt", "GetNamespaceAt", "RemoveNamespaceAt", "RemoveAllNamespaces", "GetScopeCount", "SetScope", "SetScopeFromText", "GetScope", "GetScopeAsText", "RemoveScope", "RemoveAllScopes", "SetClassName", "GetClassName", "GetKeyList", "CreateClassPart", "DeleteClassPart", "IsRelative", "IsRelativeOrChild", "IsLocal", "IsSameClassName"]

    /**
     * 
     * @param {Integer} uMode 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-settext
     */
    SetText(uMode, pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(3, this, "uint", uMode, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<Integer>} puBuffLength 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-gettext
     */
    GetText(lFlags, puBuffLength, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        puBuffLengthMarshal := puBuffLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", lFlags, puBuffLengthMarshal, puBuffLength, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uRequestedInfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getinfo
     */
    GetInfo(uRequestedInfo) {
        result := ComCall(5, this, "uint", uRequestedInfo, "uint*", &puResponse := 0, "HRESULT")
        return puResponse
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-setserver
     */
    SetServer(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(6, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puNameBufLength 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getserver
     */
    GetServer(puNameBufLength, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        puNameBufLengthMarshal := puNameBufLength is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, puNameBufLengthMarshal, puNameBufLength, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getnamespacecount
     */
    GetNamespaceCount() {
        result := ComCall(8, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-setnamespaceat
     */
    SetNamespaceAt(uIndex, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "uint", uIndex, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<Integer>} puNameBufLength 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getnamespaceat
     */
    GetNamespaceAt(uIndex, puNameBufLength, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        puNameBufLengthMarshal := puNameBufLength is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", uIndex, puNameBufLengthMarshal, puNameBufLength, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-removenamespaceat
     */
    RemoveNamespaceAt(uIndex) {
        result := ComCall(11, this, "uint", uIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-removeallnamespaces
     */
    RemoveAllNamespaces() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getscopecount
     */
    GetScopeCount() {
        result := ComCall(13, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {PWSTR} pszClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-setscope
     */
    SetScope(uIndex, pszClass) {
        pszClass := pszClass is String ? StrPtr(pszClass) : pszClass

        result := ComCall(14, this, "uint", uIndex, "ptr", pszClass, "HRESULT")
        return result
    }

    /**
     * 
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
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<Integer>} puClassNameBufSize 
     * @param {PWSTR} pszClass 
     * @returns {IWbemPathKeyList} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getscope
     */
    GetScope(uIndex, puClassNameBufSize, pszClass) {
        pszClass := pszClass is String ? StrPtr(pszClass) : pszClass

        puClassNameBufSizeMarshal := puClassNameBufSize is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", uIndex, puClassNameBufSizeMarshal, puClassNameBufSize, "ptr", pszClass, "ptr*", &pKeyList := 0, "HRESULT")
        return IWbemPathKeyList(pKeyList)
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<Integer>} puTextBufSize 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getscopeastext
     */
    GetScopeAsText(uIndex, puTextBufSize, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        puTextBufSizeMarshal := puTextBufSize is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", uIndex, puTextBufSizeMarshal, puTextBufSize, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-removescope
     */
    RemoveScope(uIndex) {
        result := ComCall(18, this, "uint", uIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-removeallscopes
     */
    RemoveAllScopes() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-setclassname
     */
    SetClassName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the class to which the specified window belongs.
     * @param {Pointer<Integer>} puBuffLength 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} Type: **int**
     * 
     * If the function succeeds, the return value is the number of characters copied to the buffer, not including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclassname
     */
    GetClassName(puBuffLength, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        puBuffLengthMarshal := puBuffLength is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, puBuffLengthMarshal, puBuffLength, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWbemPathKeyList} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-getkeylist
     */
    GetKeyList() {
        result := ComCall(22, this, "ptr*", &pOut := 0, "HRESULT")
        return IWbemPathKeyList(pOut)
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-createclasspart
     */
    CreateClassPart(lFlags, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(23, this, "int", lFlags, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-deleteclasspart
     */
    DeleteClassPart(lFlags) {
        result := ComCall(24, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszMachine 
     * @param {PWSTR} wszNamespace 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-isrelative
     */
    IsRelative(wszMachine, wszNamespace) {
        wszMachine := wszMachine is String ? StrPtr(wszMachine) : wszMachine
        wszNamespace := wszNamespace is String ? StrPtr(wszNamespace) : wszNamespace

        result := ComCall(25, this, "ptr", wszMachine, "ptr", wszNamespace, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszMachine 
     * @param {PWSTR} wszNamespace 
     * @param {Integer} lFlags 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-isrelativeorchild
     */
    IsRelativeOrChild(wszMachine, wszNamespace, lFlags) {
        wszMachine := wszMachine is String ? StrPtr(wszMachine) : wszMachine
        wszNamespace := wszNamespace is String ? StrPtr(wszNamespace) : wszNamespace

        result := ComCall(26, this, "ptr", wszMachine, "ptr", wszNamespace, "int", lFlags, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszMachine 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-islocal
     */
    IsLocal(wszMachine) {
        wszMachine := wszMachine is String ? StrPtr(wszMachine) : wszMachine

        result := ComCall(27, this, "ptr", wszMachine, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszClass 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempath-issameclassname
     */
    IsSameClassName(wszClass) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(28, this, "ptr", wszClass, "int")
        return result
    }
}
