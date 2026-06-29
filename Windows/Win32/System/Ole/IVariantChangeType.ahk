#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\Variant\VARENUM.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class IVariantChangeType extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVariantChangeType
     * @type {Guid}
     */
    static IID => Guid("{a6ef9862-c720-11d0-9337-00a0c90dcaa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ChangeType"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvarDst 
     * @param {Pointer<VARIANT>} pvarSrc 
     * @param {Integer} lcid 
     * @param {VARENUM} vtNew 
     * @returns {HRESULT} 
     */
    ChangeType(pvarDst, pvarSrc, lcid, vtNew) {
        result := ComCall(3, this, "ptr", pvarDst, "ptr", pvarSrc, "uint", lcid, "ushort", vtNew, "HRESULT")
        return result
    }
}
