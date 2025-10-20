#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Float} dwRate 
     * @param {Integer} dwFramesPerSecond 
     * @returns {HRESULT} 
     */
    put_RateEx(dwRate, dwFramesPerSecond) {
        result := ComCall(41, this, "double", dwRate, "uint", dwFramesPerSecond, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get_AudioCounter(ppUnk) {
        result := ComCall(42, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get_VideoCounter(ppUnk) {
        result := ComCall(43, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get_CCCounter(ppUnk) {
        result := ComCall(44, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get_WSTCounter(ppUnk) {
        result := ComCall(45, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
