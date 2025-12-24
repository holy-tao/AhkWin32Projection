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
     * Provides the number of type descriptions that are in a type library.
     * @returns {Integer} The number of type descriptions in the type library.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-gettypeinfocount
     */
    GetTypeInfoCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Retrieves the specified type description in the library.
     * @param {Integer} index The index of the interface to be returned.
     * @returns {ITypeInfo} If successful, returns a pointer to the pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-gettypeinfo
     */
    GetTypeInfo(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &ppTInfo := 0, "HRESULT")
        return ITypeInfo(ppTInfo)
    }

    /**
     * Retrieves the type of a type description.
     * @param {Integer} index The index of the type description within the type library.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ne-oaidl-typekind">TYPEKIND</a> enumeration value for the type description.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-gettypeinfotype
     */
    GetTypeInfoType(index) {
        result := ComCall(5, this, "uint", index, "int*", &pTKind := 0, "HRESULT")
        return pTKind
    }

    /**
     * Retrieves the type description that corresponds to the specified GUID.
     * @param {Pointer<Guid>} guid The GUID of the type description.
     * @returns {ITypeInfo} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-gettypeinfoofguid
     */
    GetTypeInfoOfGuid(guid) {
        result := ComCall(6, this, "ptr", guid, "ptr*", &ppTinfo := 0, "HRESULT")
        return ITypeInfo(ppTinfo)
    }

    /**
     * Retrieves the structure that contains the library's attributes.
     * @returns {Pointer<TLIBATTR>} The library's attributes.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-getlibattr
     */
    GetLibAttr() {
        result := ComCall(7, this, "ptr*", &ppTLibAttr := 0, "HRESULT")
        return ppTLibAttr
    }

    /**
     * Enables a client compiler to bind to the types, variables, constants, and global functions for a library.
     * @returns {ITypeComp} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> instance for this <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypelib">ITypeLib</a>. A client compiler uses the methods in the <b>ITypeComp</b> interface to bind to types in <b>ITypeLib</b>, as well as to the global functions, variables, and constants defined in <b>ITypeLib</b>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-gettypecomp
     */
    GetTypeComp() {
        result := ComCall(8, this, "ptr*", &ppTComp := 0, "HRESULT")
        return ITypeComp(ppTComp)
    }

    /**
     * Retrieves the documentation string for the library, the complete Help file name and path, and the context identifier for the library Help topic in the Help file.
     * @param {Integer} index The index of the type description whose documentation is to be returned. If <i>index</i> is -1, then the documentation for the library itself is returned.
     * @param {Pointer<BSTR>} pBstrName The name of the specified item. If the caller does not need the item name, then <i>pBstrName</i> can be null.
     * @param {Pointer<BSTR>} pBstrDocString The documentation string for the specified item. If the caller does not need the documentation string, then <i>pBstrDocString</i> can be null..
     * @param {Pointer<Integer>} pdwHelpContext The Help context identifier (ID) associated with the specified item. If the caller does not need the Help context ID, then <i>pdwHelpContext</i> can be null.
     * @param {Pointer<BSTR>} pBstrHelpFile The fully qualified name of the Help file. If the caller does not need the Help file name, then <i>pBstrHelpFile</i> can be null.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-getdocumentation
     */
    GetDocumentation(index, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile) {
        pdwHelpContextMarshal := pdwHelpContext is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "int", index, "ptr", pBstrName, "ptr", pBstrDocString, pdwHelpContextMarshal, pdwHelpContext, "ptr", pBstrHelpFile, "HRESULT")
        return result
    }

    /**
     * Indicates whether a passed-in string contains the name of a type or member described in the library.
     * @param {PWSTR} szNameBuf The string to test. If this method is successful, <i>szNameBuf</i> is modified to match the case (capitalization) found in the type library.
     * @param {Integer} lHashVal The hash value of <i>szNameBuf</i>.
     * @returns {BOOL} True if <i>szNameBuf</i> was found in the type library; otherwise false.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-isname
     */
    IsName(szNameBuf, lHashVal) {
        szNameBuf := szNameBuf is String ? StrPtr(szNameBuf) : szNameBuf

        result := ComCall(10, this, "ptr", szNameBuf, "uint", lHashVal, "int*", &pfName := 0, "HRESULT")
        return pfName
    }

    /**
     * Finds occurrences of a type description in a type library. This may be used to quickly verify that a name exists in a type library.
     * @param {PWSTR} szNameBuf The name to search for.
     * @param {Integer} lHashVal A hash value to speed up the search, computed by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-lhashvalofnamesys">LHashValOfNameSys</a> function. If <i>lHashVal</i> = 0, a value is computed.
     * @param {Pointer<ITypeInfo>} ppTInfo An array of pointers to the type descriptions that contain the name specified in <i>szNameBuf</i>. This parameter cannot be null.
     * @param {Pointer<Integer>} rgMemId An array of the found items; <i>rgMemId</i>[<i>i</i>] is the MEMBERID that indexes into the type description specified by <i>ppTInfo</i>[<i>i</i>]. This parameter cannot be null.
     * @param {Pointer<Integer>} pcFound On entry, indicates how many instances to look for. For example, *<i>pcFound</i> = 1 can be called to find the first occurrence. The search stops when one is found.
     * 
     * On exit, indicates the number of instances that were found. If the in and out values of *<i>pcFound</i> are identical, there may be more type descriptions that contain the name.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-findname
     */
    FindName(szNameBuf, lHashVal, ppTInfo, rgMemId, pcFound) {
        szNameBuf := szNameBuf is String ? StrPtr(szNameBuf) : szNameBuf

        rgMemIdMarshal := rgMemId is VarRef ? "int*" : "ptr"
        pcFoundMarshal := pcFound is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, "ptr", szNameBuf, "uint", lHashVal, "ptr*", ppTInfo, rgMemIdMarshal, rgMemId, pcFoundMarshal, pcFound, "HRESULT")
        return result
    }

    /**
     * Releases the TLIBATTR originally obtained from GetLibAttr.
     * @param {Pointer<TLIBATTR>} pTLibAttr The TLIBATTR to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib-releasetlibattr
     */
    ReleaseTLibAttr(pTLibAttr) {
        ComCall(12, this, "ptr", pTLibAttr)
    }
}
