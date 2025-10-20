#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IKsFormatSupport interface provides information about the audio data formats that are supported by a software-configured I/O connection (typically a DMA channel) between an audio adapter device and system memory.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iksformatsupport
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsFormatSupport extends IUnknown{
    /**
     * The interface identifier for IKsFormatSupport
     * @type {Guid}
     */
    static IID => Guid("{3cb4a69d-bb6f-4d2b-95b7-452d2c155db5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<KSDATAFORMAT>} pKsFormat 
     * @param {Integer} cbFormat 
     * @param {Pointer<BOOL>} pbSupported 
     * @returns {HRESULT} 
     */
    IsFormatSupported(pKsFormat, cbFormat, pbSupported) {
        result := ComCall(3, this, "ptr", pKsFormat, "uint", cbFormat, "ptr", pbSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KSDATAFORMAT>} ppKsFormat 
     * @returns {HRESULT} 
     */
    GetDevicePreferredFormat(ppKsFormat) {
        result := ComCall(4, this, "ptr", ppKsFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
