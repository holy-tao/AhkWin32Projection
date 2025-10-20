#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IGCThreadControl extends IUnknown{
    /**
     * The interface identifier for IGCThreadControl
     * @type {Guid}
     */
    static IID => Guid("{f31d1788-c397-4725-87a5-6af3472c2791}")

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
