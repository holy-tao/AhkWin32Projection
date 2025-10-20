#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Passes configuration information to the media sinks that are used for streaming the content.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfstreamingsinkconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFStreamingSinkConfig extends IUnknown{
    /**
     * The interface identifier for IMFStreamingSinkConfig
     * @type {Guid}
     */
    static IID => Guid("{9db7aa41-3cc5-40d4-8509-555804ad34cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} fSeekOffsetIsByteOffset 
     * @param {Integer} qwSeekOffset 
     * @returns {HRESULT} 
     */
    StartStreaming(fSeekOffsetIsByteOffset, qwSeekOffset) {
        result := ComCall(3, this, "int", fSeekOffsetIsByteOffset, "uint", qwSeekOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
