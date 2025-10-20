#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMediaEvent interface contains methods for retrieving event notifications and for overriding the Filter Graph Manager's default handling of events.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-imediaevent
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaEvent extends IDispatch{
    /**
     * The interface identifier for IMediaEvent
     * @type {Guid}
     */
    static IID => Guid("{56a868b6-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IntPtr>} hEvent 
     * @returns {HRESULT} 
     */
    GetEventHandle(hEvent) {
        result := ComCall(7, this, "ptr*", hEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lEventCode 
     * @param {Pointer<IntPtr>} lParam1 
     * @param {Pointer<IntPtr>} lParam2 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    GetEvent(lEventCode, lParam1, lParam2, msTimeout) {
        result := ComCall(8, this, "int*", lEventCode, "ptr*", lParam1, "ptr*", lParam2, "int", msTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @param {Pointer<Int32>} pEvCode 
     * @returns {HRESULT} 
     */
    WaitForCompletion(msTimeout, pEvCode) {
        result := ComCall(9, this, "int", msTimeout, "int*", pEvCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lEvCode 
     * @returns {HRESULT} 
     */
    CancelDefaultHandling(lEvCode) {
        result := ComCall(10, this, "int", lEvCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lEvCode 
     * @returns {HRESULT} 
     */
    RestoreDefaultHandling(lEvCode) {
        result := ComCall(11, this, "int", lEvCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lEvCode 
     * @param {Pointer} lParam1 
     * @param {Pointer} lParam2 
     * @returns {HRESULT} 
     */
    FreeEventParams(lEvCode, lParam1, lParam2) {
        result := ComCall(12, this, "int", lEvCode, "ptr", lParam1, "ptr", lParam2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
