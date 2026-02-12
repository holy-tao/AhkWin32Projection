#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the Overlay Mixer to control the properties of a hardware device such as a decoder that uses a video port. The IVPNotify interface derives from this interface.Applications should never use this interface.
 * @remarks
 * Include Vptype.h before Vpnotify.h.
 * @see https://learn.microsoft.com/windows/win32/api//content/vpnotify/nn-vpnotify-ivpbasenotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVPBaseNotify extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenegotiateVPParameters"]

    /**
     * The RenegotiateVPParameters method initializes the connection to the decoder.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter negotiates various parameters (by using the <a href="https://docs.microsoft.com/windows/desktop/api/vpconfig/nn-vpconfig-ivpbaseconfig">IVPBaseConfig</a> interface) with the decoder or driver. Call this method if any of those parameters (such as the video format or size) change. Currently, the Overlay Mixer repeats the whole connection process. You can call this method even while the graph is playing.
     * 
     * Include Vptype.h before Vpnotify.h.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/vpnotify/nf-vpnotify-ivpbasenotify-renegotiatevpparameters
     */
    RenegotiateVPParameters() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
