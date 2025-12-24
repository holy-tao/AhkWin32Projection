#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets properties on the audio resampler DSP.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmresamplerprops
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMResamplerProps extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMResamplerProps
     * @type {Guid}
     */
    static IID => Guid("{e7e9984f-f09f-4da4-903f-6e2e0efe56b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHalfFilterLength", "SetUserChannelMtx"]

    /**
     * Specifies the quality of the output.
     * @param {Integer} lhalfFilterLen Specifies the quality of the output. The valid range is 1 to 60, inclusive.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmresamplerprops-sethalffilterlength
     */
    SetHalfFilterLength(lhalfFilterLen) {
        result := ComCall(3, this, "int", lhalfFilterLen, "HRESULT")
        return result
    }

    /**
     * Specifies the channel matrix.
     * @param {Pointer<Float>} userChannelMtx Pointer to an array of floating-point values that represents a channel conversion matrix.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmresamplerprops-setuserchannelmtx
     */
    SetUserChannelMtx(userChannelMtx) {
        userChannelMtxMarshal := userChannelMtx is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, userChannelMtxMarshal, userChannelMtx, "HRESULT")
        return result
    }
}
