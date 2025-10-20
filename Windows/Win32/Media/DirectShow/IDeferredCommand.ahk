#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDeferredCommand interface cancels or modify graph-control commands that were queued using the IQueueCommand interface.When an application calls an IQueueCommand method on the Filter Graph Manager, it receives a pointer to the IDeferredCommand interface. The application can use the interface to cancel or postpone the command, or retrieve the return value from the command.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-ideferredcommand
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDeferredCommand extends IUnknown{
    /**
     * The interface identifier for IDeferredCommand
     * @type {Guid}
     */
    static IID => Guid("{56a868b8-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pConfidence 
     * @returns {HRESULT} 
     */
    Confidence(pConfidence) {
        result := ComCall(4, this, "int*", pConfidence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} newtime 
     * @returns {HRESULT} 
     */
    Postpone(newtime) {
        result := ComCall(5, this, "double", newtime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrResult 
     * @returns {HRESULT} 
     */
    GetHResult(phrResult) {
        result := ComCall(6, this, "ptr", phrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
