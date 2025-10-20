#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IEventServerTrace extends IDispatch{
    /**
     * The interface identifier for IEventServerTrace
     * @type {Guid}
     */
    static IID => Guid("{9a9f12b8-80af-47ab-a579-35ea57725370}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrguidEvent 
     * @param {BSTR} bstrguidFilter 
     * @param {Integer} lPidFilter 
     * @returns {HRESULT} 
     */
    StartTraceGuid(bstrguidEvent, bstrguidFilter, lPidFilter) {
        bstrguidEvent := bstrguidEvent is String ? BSTR.Alloc(bstrguidEvent).Value : bstrguidEvent
        bstrguidFilter := bstrguidFilter is String ? BSTR.Alloc(bstrguidFilter).Value : bstrguidFilter

        result := ComCall(7, this, "ptr", bstrguidEvent, "ptr", bstrguidFilter, "int", lPidFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrguidEvent 
     * @param {BSTR} bstrguidFilter 
     * @param {Integer} lPidFilter 
     * @returns {HRESULT} 
     */
    StopTraceGuid(bstrguidEvent, bstrguidFilter, lPidFilter) {
        bstrguidEvent := bstrguidEvent is String ? BSTR.Alloc(bstrguidEvent).Value : bstrguidEvent
        bstrguidFilter := bstrguidFilter is String ? BSTR.Alloc(bstrguidFilter).Value : bstrguidFilter

        result := ComCall(8, this, "ptr", bstrguidEvent, "ptr", bstrguidFilter, "int", lPidFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCntGuids 
     * @param {Pointer<BSTR>} pbstrGuidList 
     * @returns {HRESULT} 
     */
    EnumTraceGuid(plCntGuids, pbstrGuidList) {
        result := ComCall(9, this, "int*", plCntGuids, "ptr", pbstrGuidList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
