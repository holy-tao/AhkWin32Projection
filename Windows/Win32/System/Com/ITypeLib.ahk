#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @returns {Integer} 
     */
    GetTypeInfoCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ITypeInfo>} ppTInfo 
     * @returns {HRESULT} 
     */
    GetTypeInfo(index, ppTInfo) {
        result := ComCall(4, this, "uint", index, "ptr", ppTInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Int32>} pTKind 
     * @returns {HRESULT} 
     */
    GetTypeInfoType(index, pTKind) {
        result := ComCall(5, this, "uint", index, "int*", pTKind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<ITypeInfo>} ppTinfo 
     * @returns {HRESULT} 
     */
    GetTypeInfoOfGuid(guid, ppTinfo) {
        result := ComCall(6, this, "ptr", guid, "ptr", ppTinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TLIBATTR>} ppTLibAttr 
     * @returns {HRESULT} 
     */
    GetLibAttr(ppTLibAttr) {
        result := ComCall(7, this, "ptr", ppTLibAttr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITypeComp>} ppTComp 
     * @returns {HRESULT} 
     */
    GetTypeComp(ppTComp) {
        result := ComCall(8, this, "ptr", ppTComp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pBstrName 
     * @param {Pointer<BSTR>} pBstrDocString 
     * @param {Pointer<UInt32>} pdwHelpContext 
     * @param {Pointer<BSTR>} pBstrHelpFile 
     * @returns {HRESULT} 
     */
    GetDocumentation(index, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile) {
        result := ComCall(9, this, "int", index, "ptr", pBstrName, "ptr", pBstrDocString, "uint*", pdwHelpContext, "ptr", pBstrHelpFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szNameBuf 
     * @param {Integer} lHashVal 
     * @param {Pointer<BOOL>} pfName 
     * @returns {HRESULT} 
     */
    IsName(szNameBuf, lHashVal, pfName) {
        szNameBuf := szNameBuf is String ? StrPtr(szNameBuf) : szNameBuf

        result := ComCall(10, this, "ptr", szNameBuf, "uint", lHashVal, "ptr", pfName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szNameBuf 
     * @param {Integer} lHashVal 
     * @param {Pointer<ITypeInfo>} ppTInfo 
     * @param {Pointer<Int32>} rgMemId 
     * @param {Pointer<UInt16>} pcFound 
     * @returns {HRESULT} 
     */
    FindName(szNameBuf, lHashVal, ppTInfo, rgMemId, pcFound) {
        szNameBuf := szNameBuf is String ? StrPtr(szNameBuf) : szNameBuf

        result := ComCall(11, this, "ptr", szNameBuf, "uint", lHashVal, "ptr", ppTInfo, "int*", rgMemId, "ushort*", pcFound, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TLIBATTR>} pTLibAttr 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseTLibAttr(pTLibAttr) {
        ComCall(12, this, "ptr", pTLibAttr)
        return result
    }
}
