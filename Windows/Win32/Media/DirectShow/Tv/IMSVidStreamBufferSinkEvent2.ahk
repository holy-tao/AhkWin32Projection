#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidStreamBufferSinkEvent.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IMSVidStreamBufferSinkEvent2 interface is used to receive events from the MSVidStreamBufferSink object.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSinkEvent2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersinkevent2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSinkEvent2 extends IMSVidStreamBufferSinkEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSinkEvent2
     * @type {Guid}
     */
    static IID => Guid("{3d7a5166-72d7-484b-a06f-286187b80ca1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EncryptionOn", "EncryptionOff"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersinkevent2-encryptionon
     */
    EncryptionOn() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersinkevent2-encryptionoff
     */
    EncryptionOff() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
