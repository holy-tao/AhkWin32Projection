#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Iterates through an array of STATPROPSTG structures. The STATPROPSTG structures contain statistical data about properties in a property set.
 * @see https://docs.microsoft.com/windows/win32/api//propidlbase/nn-propidlbase-ienumstatpropstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IEnumSTATPROPSTG extends IUnknown{
    /**
     * The interface identifier for IEnumSTATPROPSTG
     * @type {Guid}
     */
    static IID => Guid("{00000139-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<STATPROPSTG>} rgelt 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", rgelt, "uint*", pceltFetched, "int")
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
     * @param {Pointer<IEnumSTATPROPSTG>} ppenum 
     * @returns {HRESULT} 
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
