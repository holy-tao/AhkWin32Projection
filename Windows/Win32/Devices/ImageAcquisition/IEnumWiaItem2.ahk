#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IEnumWiaItem2 extends IUnknown{
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
     * 
     * @param {Integer} cElt 
     * @param {Pointer<IWiaItem2>} ppIWiaItem2 
     * @param {Pointer<UInt32>} pcEltFetched 
     * @returns {HRESULT} 
     */
    Next(cElt, ppIWiaItem2, pcEltFetched) {
        result := ComCall(3, this, "uint", cElt, "ptr", ppIWiaItem2, "uint*", pcEltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cElt 
     * @returns {HRESULT} 
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "int")
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
     * @param {Pointer<IEnumWiaItem2>} ppIEnum 
     * @returns {HRESULT} 
     */
    Clone(ppIEnum) {
        result := ComCall(6, this, "ptr", ppIEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} cElt 
     * @returns {HRESULT} 
     */
    GetCount(cElt) {
        result := ComCall(7, this, "uint*", cElt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
