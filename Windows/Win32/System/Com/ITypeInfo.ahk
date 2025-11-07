#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITypeComp.ahk
#Include .\ITypeInfo.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {Pointer<TYPEATTR>} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-gettypeattr
     */
    GetTypeAttr() {
        result := ComCall(3, this, "ptr*", &ppTypeAttr := 0, "HRESULT")
        return ppTypeAttr
    }

    /**
     * 
     * @returns {ITypeComp} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-gettypecomp
     */
    GetTypeComp() {
        result := ComCall(4, this, "ptr*", &ppTComp := 0, "HRESULT")
        return ITypeComp(ppTComp)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Pointer<FUNCDESC>} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getfuncdesc
     */
    GetFuncDesc(index) {
        result := ComCall(5, this, "uint", index, "ptr*", &ppFuncDesc := 0, "HRESULT")
        return ppFuncDesc
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Pointer<VARDESC>} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getvardesc
     */
    GetVarDesc(index) {
        result := ComCall(6, this, "uint", index, "ptr*", &ppVarDesc := 0, "HRESULT")
        return ppVarDesc
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getreftypeofimpltype
     */
    GetRefTypeOfImplType(index) {
        result := ComCall(8, this, "uint", index, "uint*", &pRefType := 0, "HRESULT")
        return pRefType
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getimpltypeflags
     */
    GetImplTypeFlags(index) {
        result := ComCall(9, this, "uint", index, "int*", &pImplTypeFlags := 0, "HRESULT")
        return pImplTypeFlags
    }

    /**
     * 
     * @param {Pointer<PWSTR>} rgszNames 
     * @param {Integer} cNames 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getidsofnames
     */
    GetIDsOfNames(rgszNames, cNames) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, rgszNamesMarshal, rgszNames, "uint", cNames, "int*", &pMemId := 0, "HRESULT")
        return pMemId
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
     * @returns {ITypeInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getreftypeinfo
     */
    GetRefTypeInfo(hRefType) {
        result := ComCall(14, this, "uint", hRefType, "ptr*", &ppTInfo := 0, "HRESULT")
        return ITypeInfo(ppTInfo)
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} invKind 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-addressofmember
     */
    AddressOfMember(memid, invKind) {
        result := ComCall(15, this, "int", memid, "int", invKind, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-createinstance
     */
    CreateInstance(pUnkOuter, riid) {
        result := ComCall(16, this, "ptr", pUnkOuter, "ptr", riid, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }

    /**
     * 
     * @param {Integer} memid 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo-getmops
     */
    GetMops(memid) {
        pBstrMops := BSTR()
        result := ComCall(17, this, "int", memid, "ptr", pBstrMops, "HRESULT")
        return pBstrMops
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
