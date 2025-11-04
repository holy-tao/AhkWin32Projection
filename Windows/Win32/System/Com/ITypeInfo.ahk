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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTypeAttr", "GetTypeComp", "GetFuncDesc", "GetVarDesc", "GetNames", "GetRefTypeOfImplType", "GetImplTypeFlags", "GetIDsOfNames", "Invoke", "GetDocumentation", "GetDllEntry", "GetRefTypeInfo", "AddressOfMember", "CreateInstance", "GetMops", "GetContainingTypeLib", "ReleaseTypeAttr", "ReleaseFuncDesc", "ReleaseVarDesc"]

    /**
     * 
     * @param {Pointer<Pointer<TYPEATTR>>} ppTypeAttr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-gettypeattr
     */
    GetTypeAttr(ppTypeAttr) {
        ppTypeAttrMarshal := ppTypeAttr is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppTypeAttrMarshal, ppTypeAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITypeComp>} ppTComp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-gettypecomp
     */
    GetTypeComp(ppTComp) {
        result := ComCall(4, this, "ptr*", ppTComp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Pointer<FUNCDESC>>} ppFuncDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getfuncdesc
     */
    GetFuncDesc(index, ppFuncDesc) {
        ppFuncDescMarshal := ppFuncDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", index, ppFuncDescMarshal, ppFuncDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Pointer<VARDESC>>} ppVarDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getvardesc
     */
    GetVarDesc(index, ppVarDesc) {
        ppVarDescMarshal := ppVarDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", index, ppVarDescMarshal, ppVarDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Pointer<BSTR>} rgBstrNames 
     * @param {Integer} cMaxNames 
     * @param {Pointer<Integer>} pcNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getnames
     */
    GetNames(memid, rgBstrNames, cMaxNames, pcNames) {
        pcNamesMarshal := pcNames is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "int", memid, "ptr", rgBstrNames, "uint", cMaxNames, pcNamesMarshal, pcNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Integer>} pRefType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getreftypeofimpltype
     */
    GetRefTypeOfImplType(index, pRefType) {
        pRefTypeMarshal := pRefType is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", index, pRefTypeMarshal, pRefType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Integer>} pImplTypeFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getimpltypeflags
     */
    GetImplTypeFlags(index, pImplTypeFlags) {
        pImplTypeFlagsMarshal := pImplTypeFlags is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "uint", index, pImplTypeFlagsMarshal, pImplTypeFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} rgszNames 
     * @param {Integer} cNames 
     * @param {Pointer<Integer>} pMemId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getidsofnames
     */
    GetIDsOfNames(rgszNames, cNames, pMemId) {
        pMemIdMarshal := pMemId is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "ptr", rgszNames, "uint", cNames, pMemIdMarshal, pMemId, "HRESULT")
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
     * @param {Pointer<Integer>} puArgErr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-invoke
     */
    Invoke(pvInstance, memid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr) {
        pvInstanceMarshal := pvInstance is VarRef ? "ptr" : "ptr"
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pvInstanceMarshal, pvInstance, "int", memid, "ushort", wFlags, "ptr", pDispParams, "ptr", pVarResult, "ptr", pExcepInfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Pointer<BSTR>} pBstrName 
     * @param {Pointer<BSTR>} pBstrDocString 
     * @param {Pointer<Integer>} pdwHelpContext 
     * @param {Pointer<BSTR>} pBstrHelpFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getdocumentation
     */
    GetDocumentation(memid, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile) {
        pdwHelpContextMarshal := pdwHelpContext is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "int", memid, "ptr", pBstrName, "ptr", pBstrDocString, pdwHelpContextMarshal, pdwHelpContext, "ptr", pBstrHelpFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} invKind 
     * @param {Pointer<BSTR>} pBstrDllName 
     * @param {Pointer<BSTR>} pBstrName 
     * @param {Pointer<Integer>} pwOrdinal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getdllentry
     */
    GetDllEntry(memid, invKind, pBstrDllName, pBstrName, pwOrdinal) {
        pwOrdinalMarshal := pwOrdinal is VarRef ? "ushort*" : "ptr"

        result := ComCall(13, this, "int", memid, "int", invKind, "ptr", pBstrDllName, "ptr", pBstrName, pwOrdinalMarshal, pwOrdinal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hRefType 
     * @param {Pointer<ITypeInfo>} ppTInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getreftypeinfo
     */
    GetRefTypeInfo(hRefType, ppTInfo) {
        result := ComCall(14, this, "uint", hRefType, "ptr*", ppTInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} invKind 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-addressofmember
     */
    AddressOfMember(memid, invKind, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "int", memid, "int", invKind, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-createinstance
     */
    CreateInstance(pUnkOuter, riid, ppvObj) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, "ptr", pUnkOuter, "ptr", riid, ppvObjMarshal, ppvObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Pointer<BSTR>} pBstrMops 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getmops
     */
    GetMops(memid, pBstrMops) {
        result := ComCall(17, this, "int", memid, "ptr", pBstrMops, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITypeLib>} ppTLib 
     * @param {Pointer<Integer>} pIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getcontainingtypelib
     */
    GetContainingTypeLib(ppTLib, pIndex) {
        pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr*", ppTLib, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TYPEATTR>} pTypeAttr 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-releasetypeattr
     */
    ReleaseTypeAttr(pTypeAttr) {
        ComCall(19, this, "ptr", pTypeAttr)
    }

    /**
     * 
     * @param {Pointer<FUNCDESC>} pFuncDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-releasefuncdesc
     */
    ReleaseFuncDesc(pFuncDesc) {
        ComCall(20, this, "ptr", pFuncDesc)
    }

    /**
     * 
     * @param {Pointer<VARDESC>} pVarDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-releasevardesc
     */
    ReleaseVarDesc(pVarDesc) {
        ComCall(21, this, "ptr", pVarDesc)
    }
}
