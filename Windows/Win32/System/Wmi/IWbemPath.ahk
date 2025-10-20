#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemPath interface is the primary interface for the object path parser and makes parsing a path available to programs in a standard way. This interface is the main interface for setting and retrieving path information.
 * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nn-wmiutils-iwbempath
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemPath extends IUnknown{
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
     * 
     * @param {Integer} uMode 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    SetText(uMode, pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(3, this, "uint", uMode, "ptr", pszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<UInt32>} puBuffLength 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    GetText(lFlags, puBuffLength, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(4, this, "int", lFlags, "uint*", puBuffLength, "ptr", pszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uRequestedInfo 
     * @param {Pointer<UInt64>} puResponse 
     * @returns {HRESULT} 
     */
    GetInfo(uRequestedInfo, puResponse) {
        result := ComCall(5, this, "uint", uRequestedInfo, "uint*", puResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     */
    SetServer(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(6, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puNameBufLength 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    GetServer(puNameBufLength, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(7, this, "uint*", puNameBufLength, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puCount 
     * @returns {HRESULT} 
     */
    GetNamespaceCount(puCount) {
        result := ComCall(8, this, "uint*", puCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    SetNamespaceAt(uIndex, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(9, this, "uint", uIndex, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<UInt32>} puNameBufLength 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    GetNamespaceAt(uIndex, puNameBufLength, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(10, this, "uint", uIndex, "uint*", puNameBufLength, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {HRESULT} 
     */
    RemoveNamespaceAt(uIndex) {
        result := ComCall(11, this, "uint", uIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllNamespaces() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puCount 
     * @returns {HRESULT} 
     */
    GetScopeCount(puCount) {
        result := ComCall(13, this, "uint*", puCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {PWSTR} pszClass 
     * @returns {HRESULT} 
     */
    SetScope(uIndex, pszClass) {
        pszClass := pszClass is String ? StrPtr(pszClass) : pszClass

        result := ComCall(14, this, "uint", uIndex, "ptr", pszClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    SetScopeFromText(uIndex, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(15, this, "uint", uIndex, "ptr", pszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<UInt32>} puClassNameBufSize 
     * @param {PWSTR} pszClass 
     * @param {Pointer<IWbemPathKeyList>} pKeyList 
     * @returns {HRESULT} 
     */
    GetScope(uIndex, puClassNameBufSize, pszClass, pKeyList) {
        pszClass := pszClass is String ? StrPtr(pszClass) : pszClass

        result := ComCall(16, this, "uint", uIndex, "uint*", puClassNameBufSize, "ptr", pszClass, "ptr", pKeyList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<UInt32>} puTextBufSize 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    GetScopeAsText(uIndex, puTextBufSize, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(17, this, "uint", uIndex, "uint*", puTextBufSize, "ptr", pszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {HRESULT} 
     */
    RemoveScope(uIndex) {
        result := ComCall(18, this, "uint", uIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllScopes() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     */
    SetClassName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the name of the class to which the specified window belongs.
     * @param {Pointer<UInt32>} puBuffLength 
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

        result := ComCall(21, this, "uint*", puBuffLength, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemPathKeyList>} pOut 
     * @returns {HRESULT} 
     */
    GetKeyList(pOut) {
        result := ComCall(22, this, "ptr", pOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     */
    CreateClassPart(lFlags, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(23, this, "int", lFlags, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    DeleteClassPart(lFlags) {
        result := ComCall(24, this, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszMachine 
     * @param {PWSTR} wszNamespace 
     * @returns {BOOL} 
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
     */
    IsSameClassName(wszClass) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(28, this, "ptr", wszClass, "int")
        return result
    }
}
