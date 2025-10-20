#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMouseTracker interface is implemented by the TSF manager and is used by a text service to manage mouse event notification sinks. An instance of this interface is obtained by querying an ITfContext object for IID_ITfMouseTracker.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfmousetracker
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMouseTracker extends IUnknown{
    /**
     * The interface identifier for ITfMouseTracker
     * @type {Guid}
     */
    static IID => Guid("{09d146cd-a544-4132-925b-7afa8ef322d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfRange>} range 
     * @param {Pointer<ITfMouseSink>} pSink 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    AdviseMouseSink(range, pSink, pdwCookie) {
        result := ComCall(3, this, "ptr", range, "ptr", pSink, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnadviseMouseSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
