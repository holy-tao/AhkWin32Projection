#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidOutputDevice.ahk

/**
 * The IMSVidAudioRenderer interface represents an audio renderer device. It enables applications to control the volume and balance. To retrieve the audio renderer device that is currently active, call the IMSVidCtl::get_AudioRendererActive method.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidAudioRenderer)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidaudiorenderer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidAudioRenderer extends IMSVidOutputDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidAudioRenderer
     * @type {Guid}
     */
    static IID => Guid("{37b0353f-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The class identifier for MSVidAudioRenderer
     * @type {Guid}
     */
    static CLSID => Guid("{37b03544-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Volume", "get_Volume", "put_Balance", "get_Balance"]

    /**
     * 
     * @param {Integer} lVol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorenderer-put_volume
     */
    put_Volume(lVol) {
        result := ComCall(16, this, "int", lVol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lVol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorenderer-get_volume
     */
    get_Volume(lVol) {
        lVolMarshal := lVol is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, lVolMarshal, lVol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lBal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorenderer-put_balance
     */
    put_Balance(lBal) {
        result := ComCall(18, this, "int", lBal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lBal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidaudiorenderer-get_balance
     */
    get_Balance(lBal) {
        lBalMarshal := lBal is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, lBalMarshal, lBal, "HRESULT")
        return result
    }
}
