#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMouseTrackerACP interface is implemented by an application to support mouse event sinks.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfmousetrackeracp
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMouseTrackerACP extends IUnknown{
    /**
     * The interface identifier for ITfMouseTrackerACP
     * @type {Guid}
     */
    static IID => Guid("{3bdd78e2-c16e-47fd-b883-ce6facc1a208}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfRangeACP>} range 
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
