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
     * 
     * @param {Integer} celt 
     * @param {Pointer<VARIANT>} rgVar 
     * @param {Pointer<UInt32>} pCeltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgVar, pCeltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgVar, "uint*", pCeltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
