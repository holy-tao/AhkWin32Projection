#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a request for a sample from a MediaStreamSource.
 * @remarks
 * 
  * <b>MFMediaStreamSourceSampleRequest</b> is implemented by the
  *      <a href="https://docs.microsoft.com/uwp/api/windows.media.core.mediastreamsourcesamplerequest">Windows.Media.Core.MediaStreamSourceSampleRequest</a> runtime class.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediastreamsourcesamplerequest
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaStreamSourceSampleRequest extends IUnknown{
    /**
     * The interface identifier for IMFMediaStreamSourceSampleRequest
     * @type {Guid}
     */
    static IID => Guid("{380b9af9-a85b-4e78-a2af-ea5ce645c6b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFSample>} value 
     * @returns {HRESULT} 
     */
    SetSample(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
