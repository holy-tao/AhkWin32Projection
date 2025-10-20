#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidStreamBufferSink.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IMSVidStreamBufferSink2 interface represents the Stream Buffer Sink filter within the Video Control.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSink2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersink2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSink2 extends IMSVidStreamBufferSink{
    /**
     * The interface identifier for IMSVidStreamBufferSink2
     * @type {Guid}
     */
    static IID => Guid("{2ca9fc63-c131-4e5a-955a-544a47c67146}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockProfile() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
