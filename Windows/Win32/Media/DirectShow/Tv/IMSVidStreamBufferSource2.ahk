#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IMSVidStreamBufferSource.ahk

/**
 * The IMSVidStreamBufferSource2 interface represents the Stream Buffer Source filter within the Video Control.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSource2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersource2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSource2 extends IMSVidStreamBufferSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSource2
     * @type {Guid}
     */
    static IID => Guid("{e4ba9059-b1ce-40d8-b9a0-d4ea4a9989d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 41

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_RateEx", "get_AudioCounter", "get_VideoCounter", "get_CCCounter", "get_WSTCounter"]

    /**
     * 
     * @param {Float} dwRate 
     * @param {Integer} dwFramesPerSecond 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-put_rateex
     */
    put_RateEx(dwRate, dwFramesPerSecond) {
        result := ComCall(41, this, "double", dwRate, "uint", dwFramesPerSecond, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-get_audiocounter
     */
    get_AudioCounter() {
        result := ComCall(42, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-get_videocounter
     */
    get_VideoCounter() {
        result := ComCall(43, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-get_cccounter
     */
    get_CCCounter() {
        result := ComCall(44, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource2-get_wstcounter
     */
    get_WSTCounter() {
        result := ComCall(45, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }
}
