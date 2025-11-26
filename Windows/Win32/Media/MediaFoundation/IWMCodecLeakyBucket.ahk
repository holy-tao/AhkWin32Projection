#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures the &quot;leaky bucket&quot; parameters on a video encoder.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcodecleakybucket
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-setbuffersizebits
     */
    SetBufferSizeBits(ulBufferSize) {
        result := ComCall(3, this, "uint", ulBufferSize, "HRESULT")
        return result
    }

    /**
     * Retrieves the current size of the buffer in bits.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-getbuffersizebits
     */
    GetBufferSizeBits(pulBufferSize) {
        pulBufferSizeMarshal := pulBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulBufferSizeMarshal, pulBufferSize, "HRESULT")
        return result
    }

    /**
     * Not implemented in this release.
     * @param {Integer} ulBufferFullness 
     * @returns {HRESULT} This method always returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-setbufferfullnessbits
     */
    SetBufferFullnessBits(ulBufferFullness) {
        result := ComCall(5, this, "uint", ulBufferFullness, "HRESULT")
        return result
    }

    /**
     * Not implemented in this release.
     * @param {Pointer<Integer>} pulBufferFullness 
     * @returns {HRESULT} This method always returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmcodecleakybucket-getbufferfullnessbits
     */
    GetBufferFullnessBits(pulBufferFullness) {
        pulBufferFullnessMarshal := pulBufferFullness is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulBufferFullnessMarshal, pulBufferFullness, "HRESULT")
        return result
    }
}
