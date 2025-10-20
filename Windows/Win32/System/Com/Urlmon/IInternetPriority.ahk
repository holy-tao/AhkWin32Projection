#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetPriority extends IUnknown{
    /**
     * The interface identifier for IInternetPriority
     * @type {Guid}
     */
    static IID => Guid("{79eac9eb-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} nPriority 
     * @returns {HRESULT} 
     */
    SetPriority(nPriority) {
        result := ComCall(3, this, "int", nPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnPriority 
     * @returns {HRESULT} 
     */
    GetPriority(pnPriority) {
        result := ComCall(4, this, "int*", pnPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
