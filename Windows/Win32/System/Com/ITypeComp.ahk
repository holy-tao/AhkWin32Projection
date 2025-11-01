#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The ITypeComp interface provides a fast way to access information that compilers need when binding to and instantiating structures and interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypecomp
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeComp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeComp
     * @type {Guid}
     */
    static IID => Guid("{00020403-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Bind", "BindType"]

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Integer} lHashVal 
     * @param {Integer} wFlags 
     * @param {Pointer<ITypeInfo>} ppTInfo 
     * @param {Pointer<Integer>} pDescKind 
     * @param {Pointer<BINDPTR>} pBindPtr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypecomp-bind
     */
    Bind(szName, lHashVal, wFlags, ppTInfo, pDescKind, pBindPtr) {
        szName := szName is String ? StrPtr(szName) : szName

        pDescKindMarshal := pDescKind is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", szName, "uint", lHashVal, "ushort", wFlags, "ptr*", ppTInfo, pDescKindMarshal, pDescKind, "ptr", pBindPtr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Integer} lHashVal 
     * @param {Pointer<ITypeInfo>} ppTInfo 
     * @param {Pointer<ITypeComp>} ppTComp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypecomp-bindtype
     */
    BindType(szName, lHashVal, ppTInfo, ppTComp) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(4, this, "ptr", szName, "uint", lHashVal, "ptr*", ppTInfo, "ptr*", ppTComp, "HRESULT")
        return result
    }
}
