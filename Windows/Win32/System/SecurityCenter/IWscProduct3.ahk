#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWscProduct2.ahk

/**
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class IWscProduct3 extends IWscProduct2{
    /**
     * The interface identifier for IWscProduct3
     * @type {Guid}
     */
    static IID => Guid("{55536524-d1d1-4726-8c7c-04996a1904e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Pointer<UInt32>} pdwDays 
     * @returns {HRESULT} 
     */
    get_AntivirusDaysUntilExpired(pdwDays) {
        result := ComCall(20, this, "uint*", pdwDays, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
