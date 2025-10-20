#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostGCManager extends IUnknown{
    /**
     * The interface identifier for IHostGCManager
     * @type {Guid}
     */
    static IID => Guid("{5d4ec34e-f248-457b-b603-255faaba0d21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    ThreadIsBlockingForSuspension() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspensionStarting() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Generation 
     * @returns {HRESULT} 
     */
    SuspensionEnding(Generation) {
        result := ComCall(5, this, "uint", Generation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
