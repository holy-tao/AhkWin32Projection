#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures the &quot;leaky bucket&quot; parameters on a video encoder.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmcodecleakybucket
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecLeakyBucket extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecLeakyBucket
     * @type {Guid}
     */
    static IID => Guid("{a81ba647-6227-43b7-b231-c7b15135dd7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBufferSizeBits", "GetBufferSizeBits", "SetBufferFullnessBits", "GetBufferFullnessBits"]

    /**
     * Sets the buffer size in bits.
     * @remarks
     * This method is not implemented on the audio encoder objects. If you call this method from the <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-iwmcodecleakybucket">IWMCodecLeakyBucket</a> interface it returns E_NOTIMPL.
     * 
     * The buffer size is equal to the bit rate of the stream multiplied by the buffer window. For example, a stream with a bit rate of 28 kilobits per second with a buffer window of 3 seconds would have a buffer of 28000 bits per second x 3 seconds = 84000 bits.
     * 
     * This method is an alternative to setting the MFPKEY_VIDEOWINDOW property. Using this method does not alter the bit rate of the stream, but does alter the buffer window. Using the stream with a bit rate of 28000 bits per second from the previous example, setting the buffer size to 84000 using this method would have exactly the same effect as setting <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-videowindowproperty">MFPKEY_VIDEOWINDOW</a> to 3000 milliseconds (3 seconds).
     * @param {Integer} ulBufferSize The buffer size, in bits.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-setbuffersizebits
     */
    SetBufferSizeBits(ulBufferSize) {
        result := ComCall(3, this, "uint", ulBufferSize, "HRESULT")
        return result
    }

    /**
     * Retrieves the current size of the buffer in bits.
     * @remarks
     * The buffer size is equal to the bit rate of the stream multiplied by the buffer window. For example, a stream with a bit rate of 28 kilobits per second with a buffer window of 3 seconds would have a buffer of 28000 bits per second x 3 seconds = 84000 bits.
     * @param {Pointer<Integer>} pulBufferSize Pointer to a variable containing the buffer size, in bits.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-getbuffersizebits
     */
    GetBufferSizeBits(pulBufferSize) {
        pulBufferSizeMarshal := pulBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulBufferSizeMarshal, pulBufferSize, "HRESULT")
        return result
    }

    /**
     * Not implemented in this release. (IWMCodecLeakyBucket.SetBufferFullnessBits)
     * @param {Integer} ulBufferFullness 
     * @returns {HRESULT} This method always returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-setbufferfullnessbits
     */
    SetBufferFullnessBits(ulBufferFullness) {
        result := ComCall(5, this, "uint", ulBufferFullness, "HRESULT")
        return result
    }

    /**
     * Not implemented in this release. (IWMCodecLeakyBucket.GetBufferFullnessBits)
     * @param {Pointer<Integer>} pulBufferFullness 
     * @returns {HRESULT} This method always returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-getbufferfullnessbits
     */
    GetBufferFullnessBits(pulBufferFullness) {
        pulBufferFullnessMarshal := pulBufferFullness is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulBufferFullnessMarshal, pulBufferFullness, "HRESULT")
        return result
    }
}
