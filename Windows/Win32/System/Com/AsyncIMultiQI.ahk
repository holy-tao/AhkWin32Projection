#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class AsyncIMultiQI extends IUnknown{
    /**
     * The interface identifier for AsyncIMultiQI
     * @type {Guid}
     */
    static IID => Guid("{000e0020-0000-0000-c000-000000000046}")

    /**
     * The class identifier for AsyncIMultiQI
     * @type {Guid}
     */
    static CLSID => Guid("{000e0020-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cMQIs 
     * @param {Pointer<MULTI_QI>} pMQIs 
     * @returns {HRESULT} 
     */
    Begin_QueryMultipleInterfaces(cMQIs, pMQIs) {
        result := ComCall(3, this, "uint", cMQIs, "ptr", pMQIs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MULTI_QI>} pMQIs 
     * @returns {HRESULT} 
     */
    Finish_QueryMultipleInterfaces(pMQIs) {
        result := ComCall(4, this, "ptr", pMQIs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
