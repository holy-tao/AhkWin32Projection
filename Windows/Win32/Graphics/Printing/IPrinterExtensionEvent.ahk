#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionEvent extends IDispatch{
    /**
     * The interface identifier for IPrinterExtensionEvent
     * @type {Guid}
     */
    static IID => Guid("{c093cb63-5ef5-4585-af8e-4d5637487b57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IPrinterExtensionEventArgs>} pEventArgs 
     * @returns {HRESULT} 
     */
    OnDriverEvent(pEventArgs) {
        result := ComCall(7, this, "ptr", pEventArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPrinterExtensionContextCollection>} pContextCollection 
     * @returns {HRESULT} 
     */
    OnPrinterQueuesEnumerated(pContextCollection) {
        result := ComCall(8, this, "ptr", pContextCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
