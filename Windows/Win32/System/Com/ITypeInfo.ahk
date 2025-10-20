#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Used for reading information about objects.
 * @remarks
 * 
  * Type information interfaces are intended to describe the parts of the application that can be called by outside clients, rather than those that might be used internally to build an application.
  * 
  * The <b>ITypeInfo</b> interface provides access to the following:  
  * 
  * <ul>
  * <li>
  * The set of function descriptions associated with the type. For interfaces, this contains the set of member functions in the interface.
  * 
  * </li>
  * <li>
  * The set of data member descriptions associated with the type. For structures, this contains the set of fields of the type.
  * 
  * </li>
  * <li>
  * The general attributes of the type, such as whether it describes a structure, an interface, and so on.
  * 
  * </li>
  * </ul>
  * The type description of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface can be used to implement the interface. For more information, see the description of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-createstddispatch">CreateStdDispatch</a> in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/dispatch-interfaces">Dispatch Interface and API Functions</a>. 
  * 
  * An instance of <b>ITypeInfo</b> provides various information about the type of an object, and is used in different ways. A compiler can use an <b>ITypeInfo</b> to compile references to members of the type. A type interface browser can use it to find information about each member of the type. An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> implementor can use it to provide automatic delegation of <b>IDispatch</b> calls to an interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypeinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeInfo extends IUnknown{
    /**
     * The interface identifier for ITypeInfo
     * @type {Guid}
     */
    static IID => Guid("{00020401-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<TYPEATTR>} ppTypeAttr 
     * @returns {HRESULT} 
     */
    GetTypeAttr(ppTypeAttr) {
        result := ComCall(3, this, "ptr", ppTypeAttr, "int")
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
        result := ComCall(4, this, "ptr", ppTComp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<FUNCDESC>} ppFuncDesc 
     * @returns {HRESULT} 
     */
    GetFuncDesc(index, ppFuncDesc) {
        result := ComCall(5, this, "uint", index, "ptr", ppFuncDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<VARDESC>} ppVarDesc 
     * @returns {HRESULT} 
     */
    GetVarDesc(index, ppVarDesc) {
        result := ComCall(6, this, "uint", index, "ptr", ppVarDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Pointer<BSTR>} rgBstrNames 
     * @param {Integer} cMaxNames 
     * @param {Pointer<UInt32>} pcNames 
     * @returns {HRESULT} 
     */
    GetNames(memid, rgBstrNames, cMaxNames, pcNames) {
        result := ComCall(7, this, "int", memid, "ptr", rgBstrNames, "uint", cMaxNames, "uint*", pcNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<UInt32>} pRefType 
     * @returns {HRESULT} 
     */
    GetRefTypeOfImplType(index, pRefType) {
        result := ComCall(8, this, "uint", index, "uint*", pRefType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Int32>} pImplTypeFlags 
     * @returns {HRESULT} 
     */
    GetImplTypeFlags(index, pImplTypeFlags) {
        result := ComCall(9, this, "uint", index, "int*", pImplTypeFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} rgszNames 
     * @param {Integer} cNames 
     * @param {Pointer<Int32>} pMemId 
     * @returns {HRESULT} 
     */
    GetIDsOfNames(rgszNames, cNames, pMemId) {
        result := ComCall(10, this, "ptr", rgszNames, "uint", cNames, "int*", pMemId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvInstance 
     * @param {Integer} memid 
     * @param {Integer} wFlags 
     * @param {Pointer<DISPPARAMS>} pDispParams 
     * @param {Pointer<VARIANT>} pVarResult 
     * @param {Pointer<EXCEPINFO>} pExcepInfo 
     * @param {Pointer<UInt32>} puArgErr 
     * @returns {HRESULT} 
     */
    Invoke(pvInstance, memid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr) {
        result := ComCall(11, this, "ptr", pvInstance, "int", memid, "ushort", wFlags, "ptr", pDispParams, "ptr", pVarResult, "ptr", pExcepInfo, "uint*", puArgErr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Pointer<BSTR>} pBstrName 
     * @param {Pointer<BSTR>} pBstrDocString 
     * @param {Pointer<UInt32>} pdwHelpContext 
     * @param {Pointer<BSTR>} pBstrHelpFile 
     * @returns {HRESULT} 
     */
    GetDocumentation(memid, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile) {
        result := ComCall(12, this, "int", memid, "ptr", pBstrName, "ptr", pBstrDocString, "uint*", pdwHelpContext, "ptr", pBstrHelpFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} invKind 
     * @param {Pointer<BSTR>} pBstrDllName 
     * @param {Pointer<BSTR>} pBstrName 
     * @param {Pointer<UInt16>} pwOrdinal 
     * @returns {HRESULT} 
     */
    GetDllEntry(memid, invKind, pBstrDllName, pBstrName, pwOrdinal) {
        result := ComCall(13, this, "int", memid, "int", invKind, "ptr", pBstrDllName, "ptr", pBstrName, "ushort*", pwOrdinal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hRefType 
     * @param {Pointer<ITypeInfo>} ppTInfo 
     * @returns {HRESULT} 
     */
    GetRefTypeInfo(hRefType, ppTInfo) {
        result := ComCall(14, this, "uint", hRefType, "ptr", ppTInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} invKind 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    AddressOfMember(memid, invKind, ppv) {
        result := ComCall(15, this, "int", memid, "int", invKind, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObj 
     * @returns {HRESULT} 
     */
    CreateInstance(pUnkOuter, riid, ppvObj) {
        result := ComCall(16, this, "ptr", pUnkOuter, "ptr", riid, "ptr", ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Pointer<BSTR>} pBstrMops 
     * @returns {HRESULT} 
     */
    GetMops(memid, pBstrMops) {
        result := ComCall(17, this, "int", memid, "ptr", pBstrMops, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITypeLib>} ppTLib 
     * @param {Pointer<UInt32>} pIndex 
     * @returns {HRESULT} 
     */
    GetContainingTypeLib(ppTLib, pIndex) {
        result := ComCall(18, this, "ptr", ppTLib, "uint*", pIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TYPEATTR>} pTypeAttr 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseTypeAttr(pTypeAttr) {
        ComCall(19, this, "ptr", pTypeAttr)
        return result
    }

    /**
     * 
     * @param {Pointer<FUNCDESC>} pFuncDesc 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseFuncDesc(pFuncDesc) {
        ComCall(20, this, "ptr", pFuncDesc)
        return result
    }

    /**
     * 
     * @param {Pointer<VARDESC>} pVarDesc 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseVarDesc(pVarDesc) {
        ComCall(21, this, "ptr", pVarDesc)
        return result
    }
}
