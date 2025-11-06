#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWiaItem2.ahk
#Include .\IEnumWiaItem2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IEnumWiaItem2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWiaItem2
     * @type {Guid}
     */
    static IID => Guid("{59970af4-cd0d-44d9-ab24-52295630e582}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "GetCount"]

    /**
     * 
     * @param {Integer} cElt 
     * @param {Pointer<Integer>} pcEltFetched 
     * @returns {IWiaItem2} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-next
     */
    Next(cElt, pcEltFetched) {
        pcEltFetchedMarshal := pcEltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cElt, "ptr*", &ppIWiaItem2 := 0, pcEltFetchedMarshal, pcEltFetched, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * 
     * @param {Integer} cElt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-skip
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumWiaItem2} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWiaItem2(ppIEnum)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &cElt := 0, "HRESULT")
        return cElt
    }
}
