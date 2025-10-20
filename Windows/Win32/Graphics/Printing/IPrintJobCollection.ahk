#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintJobCollection extends IDispatch{
    /**
     * The interface identifier for IPrintJobCollection
     * @type {Guid}
     */
    static IID => Guid("{72b82a24-a598-4e87-895f-cdb23a49e9dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<UInt32>} pulCount 
     * @returns {HRESULT} 
     */
    get_Count(pulCount) {
        result := ComCall(7, this, "uint*", pulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<IPrintJob>} ppJob 
     * @returns {HRESULT} 
     */
    GetAt(ulIndex, ppJob) {
        result := ComCall(8, this, "uint", ulIndex, "ptr", ppJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppUnk) {
        result := ComCall(9, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
