#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo4.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo5 extends ICorProfilerInfo4{
    /**
     * The interface identifier for ICorProfilerInfo5
     * @type {Guid}
     */
    static IID => Guid("{07602928-ce38-4b83-81e7-74adaf781214}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 81

    /**
     * 
     * @param {Pointer<UInt32>} pdwEventsLow 
     * @param {Pointer<UInt32>} pdwEventsHigh 
     * @returns {HRESULT} 
     */
    GetEventMask2(pdwEventsLow, pdwEventsHigh) {
        result := ComCall(81, this, "uint*", pdwEventsLow, "uint*", pdwEventsHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEventsLow 
     * @param {Integer} dwEventsHigh 
     * @returns {HRESULT} 
     */
    SetEventMask2(dwEventsLow, dwEventsHigh) {
        result := ComCall(82, this, "uint", dwEventsLow, "uint", dwEventsHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
