#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a method for enumerating a collection of variants, including heterogeneous collections of objects and intrinsic types.
 * @remarks
 * 
  * To see how to implement a collection of objects using <b>IEnumVARIANT</b>, refer to the file Enumvar.cpp in the Lines sample code.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-ienumvariant
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IEnumVARIANT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumVARIANT
     * @type {Guid}
     */
    static IID => Guid("{00020404-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<VARIANT>} rgVar 
     * @param {Pointer<Integer>} pCeltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ienumvariant-next
     */
    Next(celt, rgVar, pCeltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgVar, "uint*", pCeltFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ienumvariant-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ienumvariant-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ienumvariant-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
