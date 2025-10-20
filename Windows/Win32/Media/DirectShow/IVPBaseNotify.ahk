#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the Overlay Mixer to control the properties of a hardware device such as a decoder that uses a video port. The IVPNotify interface derives from this interface.Applications should never use this interface.
 * @remarks
 * 
  * Include Vptype.h before Vpnotify.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vpnotify/nn-vpnotify-ivpbasenotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVPBaseNotify extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    RenegotiateVPParameters() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
