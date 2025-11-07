#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEncoderAPI.ahk

/**
 * The IVideoEncoder interface is optionally exposed by video encoder filters.
 * @remarks
 * 
 * The original purpose of this interface was to enable application to determine whether a filter was a video decoder, by calling <b>QueryInterface</b> for the <b>IVideoEncoder</b> interface. The application could then use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iencoderapi">IEncoderAPI</a> interface (which <b>IVideoEncoder</b> inherits) to set properties on the encoder. However, <b>IEncoderAPI</b> is deprecated. Encoder filters should expose <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-icodecapi">ICodecAPI</a> instead, and applications should use <b>ICodecAPI</b> to configure encoders.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivideoencoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVideoEncoder extends IEncoderAPI{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoEncoder
     * @type {Guid}
     */
    static IID => Guid("{02997c3b-8e1b-460e-9270-545e0de9563e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
