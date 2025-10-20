#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIProgress extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ulValue 
     * @param {Integer} ulCount 
     * @param {Integer} ulTotal 
     * @returns {HRESULT} 
     */
    Progress(ulValue, ulCount, ulTotal) {
        result := ComCall(3, this, "uint", ulValue, "uint", ulCount, "uint", ulTotal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpulFlags 
     * @returns {HRESULT} 
     */
    GetFlags(lpulFlags) {
        result := ComCall(4, this, "uint*", lpulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpulMax 
     * @returns {HRESULT} 
     */
    GetMax(lpulMax) {
        result := ComCall(5, this, "uint*", lpulMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpulMin 
     * @returns {HRESULT} 
     */
    GetMin(lpulMin) {
        result := ComCall(6, this, "uint*", lpulMin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpulMin 
     * @param {Pointer<UInt32>} lpulMax 
     * @param {Pointer<UInt32>} lpulFlags 
     * @returns {HRESULT} 
     */
    SetLimits(lpulMin, lpulMax, lpulFlags) {
        result := ComCall(7, this, "uint*", lpulMin, "uint*", lpulMax, "uint*", lpulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
