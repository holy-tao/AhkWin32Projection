#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidOutputDeviceEvent.ahk

/**
 * This topic applies to Windows XP Service Pack 1 or later.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSinkEvent)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersinkevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSinkEvent extends IMSVidOutputDeviceEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSinkEvent
     * @type {Guid}
     */
    static IID => Guid("{f798a36b-b05b-4bbe-9703-eaea7d61cd51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CertificateFailure", "CertificateSuccess", "WriteFailure"]

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Returns S_OK or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersinkevent-certificatefailure
     */
    CertificateFailure() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersinkevent-certificatesuccess
     */
    CertificateSuccess() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Returns S_OK or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersinkevent-writefailure
     */
    WriteFailure() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
