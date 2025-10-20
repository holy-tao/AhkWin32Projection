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
     * 
     * @param {Integer} lVol 
     * @returns {HRESULT} 
     */
    put_Volume(lVol) {
        result := ComCall(16, this, "int", lVol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lVol 
     * @returns {HRESULT} 
     */
    get_Volume(lVol) {
        result := ComCall(17, this, "int*", lVol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lBal 
     * @returns {HRESULT} 
     */
    put_Balance(lBal) {
        result := ComCall(18, this, "int", lBal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lBal 
     * @returns {HRESULT} 
     */
    get_Balance(lBal) {
        result := ComCall(19, this, "int*", lBal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
