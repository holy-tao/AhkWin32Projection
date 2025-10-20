#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidFeature.ahk

/**
 * The IMSVidEncoder interface represents the MSVidEncoder feature object, which is required for stream buffer applications using the Video Control. For more information, see Using the Stream Buffer Engine with the Video Control.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidEncoder)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidencoder
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidEncoder extends IMSVidFeature{
    /**
     * The interface identifier for IMSVidEncoder
     * @type {Guid}
     */
    static IID => Guid("{c0020fd4-bee7-43d9-a495-9f213117103d}")

    /**
     * The class identifier for MSVidEncoder
     * @type {Guid}
     */
    static CLSID => Guid("{bb530c63-d9df-4b49-9439-63453962e598}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * 
     * @param {Pointer<IUnknown>} ppEncInt 
     * @returns {HRESULT} 
     */
    get_VideoEncoderInterface(ppEncInt) {
        result := ComCall(16, this, "ptr", ppEncInt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEncInt 
     * @returns {HRESULT} 
     */
    get_AudioEncoderInterface(ppEncInt) {
        result := ComCall(17, this, "ptr", ppEncInt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
