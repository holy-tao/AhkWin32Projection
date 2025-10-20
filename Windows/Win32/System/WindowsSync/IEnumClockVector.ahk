#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates the clock vector elements that are stored in a clock vector.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumclockvector
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumClockVector extends IUnknown{
    /**
     * The interface identifier for IEnumClockVector
     * @type {Guid}
     */
    static IID => Guid("{525844db-2837-4799-9e80-81a66e02220c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cClockVectorElements 
     * @param {Pointer<IClockVectorElement>} ppiClockVectorElements 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cClockVectorElements, ppiClockVectorElements, pcFetched) {
        result := ComCall(3, this, "uint", cClockVectorElements, "ptr", ppiClockVectorElements, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cSyncVersions 
     * @returns {HRESULT} 
     */
    Skip(cSyncVersions) {
        result := ComCall(4, this, "uint", cSyncVersions, "int")
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
     * @param {Pointer<IEnumClockVector>} ppiEnum 
     * @returns {HRESULT} 
     */
    Clone(ppiEnum) {
        result := ComCall(6, this, "ptr", ppiEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
