#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCollection.ahk

/**
 * The ITCollection2 interface is an extension of the ITCollection interface. ITCollection2 exposes additional methods for modifying the collection.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcollection2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCollection2 extends ITCollection{
    /**
     * The interface identifier for ITCollection2
     * @type {Guid}
     */
    static IID => Guid("{e6dddda5-a6d3-48ff-8737-d32fc4d95477}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    Add(Index, pVariant) {
        result := ComCall(10, this, "int", Index, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
