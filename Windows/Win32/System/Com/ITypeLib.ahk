#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITypeInfo.ahk
#Include .\ITypeComp.ahk
#Include .\IUnknown.ahk

/**
 * Represents a type library, the data that describes a set of objects.
 * @remarks
 * 
 * The system registry contains a list of all the installed type libraries. Type library organization is illustrated in the following figure:
 * 
 * :::image type="content" source="./images/oa03_10.Png" border="false" alt-text="Diagram showing the organization of installed type libraries as they are listed in the system registry.":::
 * 
 * The <b>ITypeLib</b> interface provides methods for accessing a library of type descriptions. This interface supports the following:  
 * 
 * <ul>
 * <li>
 * Generalized containment for type information. <b>ITypeLib</b> allows iteration over the type descriptions contained in the library.
 * 
 * </li>
 * <li>
 * Global functions and data. A type library can contain descriptions of a set of modules (.DLLs) that exports data and functions. The type library supports compiling references to the exported data and functions.
 * 
 * </li>
 * <li>
 * General information, including a user-readable name for the library and help for the library as a whole.
 * 
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypelib
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeLib extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeLib
     * @type {Guid}
     */
    static IID => Guid("{00020402-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTypeInfoCount", "GetTypeInfo", "GetTypeInfoType", "GetTypeInfoOfGuid", "GetLibAttr", "GetTypeComp", "GetDocumentation", "IsName", "FindName", "ReleaseTLibAttr"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-gettypeinfocount
     */
    GetTypeInfoCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ITypeInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-gettypeinfo
     */
    GetTypeInfo(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &ppTInfo := 0, "HRESULT")
        return ITypeInfo(ppTInfo)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-gettypeinfotype
     */
    GetTypeInfoType(index) {
        result := ComCall(5, this, "uint", index, "int*", &pTKind := 0, "HRESULT")
        return pTKind
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {ITypeInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-gettypeinfoofguid
     */
    GetTypeInfoOfGuid(guid) {
        result := ComCall(6, this, "ptr", guid, "ptr*", &ppTinfo := 0, "HRESULT")
        return ITypeInfo(ppTinfo)
    }

    /**
     * 
     * @returns {Pointer<TLIBATTR>} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-getlibattr
     */
    GetLibAttr() {
        result := ComCall(7, this, "ptr*", &ppTLibAttr := 0, "HRESULT")
        return ppTLibAttr
    }

    /**
     * 
     * @returns {ITypeComp} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-gettypecomp
     */
    GetTypeComp() {
        result := ComCall(8, this, "ptr*", &ppTComp := 0, "HRESULT")
        return ITypeComp(ppTComp)
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pBstrName 
     * @param {Pointer<BSTR>} pBstrDocString 
     * @param {Pointer<Integer>} pdwHelpContext 
     * @param {Pointer<BSTR>} pBstrHelpFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-getdocumentation
     */
    GetDocumentation(index, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile) {
        pdwHelpContextMarshal := pdwHelpContext is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "int", index, "ptr", pBstrName, "ptr", pBstrDocString, pdwHelpContextMarshal, pdwHelpContext, "ptr", pBstrHelpFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szNameBuf 
     * @param {Integer} lHashVal 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-isname
     */
    IsName(szNameBuf, lHashVal) {
        szNameBuf := szNameBuf is String ? StrPtr(szNameBuf) : szNameBuf

        result := ComCall(10, this, "ptr", szNameBuf, "uint", lHashVal, "int*", &pfName := 0, "HRESULT")
        return pfName
    }

    /**
     * 
     * @param {PWSTR} szNameBuf 
     * @param {Integer} lHashVal 
     * @param {Pointer<ITypeInfo>} ppTInfo 
     * @param {Pointer<Integer>} rgMemId 
     * @param {Pointer<Integer>} pcFound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-findname
     */
    FindName(szNameBuf, lHashVal, ppTInfo, rgMemId, pcFound) {
        szNameBuf := szNameBuf is String ? StrPtr(szNameBuf) : szNameBuf

        rgMemIdMarshal := rgMemId is VarRef ? "int*" : "ptr"
        pcFoundMarshal := pcFound is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, "ptr", szNameBuf, "uint", lHashVal, "ptr*", ppTInfo, rgMemIdMarshal, rgMemId, pcFoundMarshal, pcFound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TLIBATTR>} pTLibAttr 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib-releasetlibattr
     */
    ReleaseTLibAttr(pTLibAttr) {
        ComCall(12, this, "ptr", pTLibAttr)
    }
}
