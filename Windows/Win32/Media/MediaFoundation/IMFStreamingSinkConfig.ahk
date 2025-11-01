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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartStreaming"]

    /**
     * 
     * @param {BOOL} fSeekOffsetIsByteOffset 
     * @param {Integer} qwSeekOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamingsinkconfig-startstreaming
     */
    StartStreaming(fSeekOffsetIsByteOffset, qwSeekOffset) {
        result := ComCall(3, this, "int", fSeekOffsetIsByteOffset, "uint", qwSeekOffset, "HRESULT")
        return result
    }
}
