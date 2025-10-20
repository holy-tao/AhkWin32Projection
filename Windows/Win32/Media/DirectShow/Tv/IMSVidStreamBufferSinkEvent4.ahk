#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidStreamBufferSinkEvent3.ahk

/**
 * The IMSVidStreamBufferSinkEvent4 interface receives events from the MSVidStreamBufferSink object.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSinkEvent4)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersinkevent4
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSinkEvent4 extends IMSVidStreamBufferSinkEvent3{
    /**
     * The interface identifier for IMSVidStreamBufferSinkEvent4
     * @type {Guid}
     */
    static IID => Guid("{1b01dcb0-daf0-412c-a5d1-590c7f62e2b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @returns {HRESULT} 
     */
    WriteFailureClear() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
