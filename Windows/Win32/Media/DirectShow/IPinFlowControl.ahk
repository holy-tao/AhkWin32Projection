#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Blocks data flow from an active output pin.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ipinflowcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IPinFlowControl extends IUnknown{
    /**
     * The interface identifier for IPinFlowControl
     * @type {Guid}
     */
    static IID => Guid("{c56e9858-dbf3-4f6b-8119-384af2060deb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwBlockFlags 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     */
    Block(dwBlockFlags, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(3, this, "uint", dwBlockFlags, "ptr", hEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
