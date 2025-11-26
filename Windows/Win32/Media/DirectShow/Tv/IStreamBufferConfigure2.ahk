#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IStreamBufferConfigure.ahk

/**
 * The IStreamBufferConfigure2 interface is exposed by the StreamBufferConfig object.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferConfigure2)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferconfigure2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferConfigure2 extends IStreamBufferConfigure{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferConfigure2
     * @type {Guid}
     */
    static IID => Guid("{53e037bf-3992-4282-ae34-2487b4dae06b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMultiplexedPacketSize", "GetMultiplexedPacketSize", "SetFFTransitionRates", "GetFFTransitionRates"]

    /**
     * The SetMultiplexedPacketSize method sets the size of the multiplexed packets in the backing files for the Stream Buffer Engine.
     * @param {Integer} cbBytesPerPacket Specifies the packet size, in bytes. The value must be between 8192 and 65535, inclusive. The default value is 65535.
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
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferconfigure2-setmultiplexedpacketsize
     */
    SetMultiplexedPacketSize(cbBytesPerPacket) {
        result := ComCall(9, this, "uint", cbBytesPerPacket, "HRESULT")
        return result
    }

    /**
     * The GetMultiplexedPacketSize method returns the size of the multiplexed packets in the backing files for the Stream Buffer Engine.
     * @returns {Integer} Receives the packet size, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferconfigure2-getmultiplexedpacketsize
     */
    GetMultiplexedPacketSize() {
        result := ComCall(10, this, "uint*", &pcbBytesPerPacket := 0, "HRESULT")
        return pcbBytesPerPacket
    }

    /**
     * The SetFFTransitionRates method sets the behavior of fast-forward play (&#0034;trick mode&#0034;) in the Stream Buffer Engine.
     * @param {Integer} dwMaxFullFrameRate Maximum playback rate for full-frame playback. The value must be greater than 1. The default value is 4.
     * @param {Integer} dwMaxNonSkippingRate Maximum playback rate for key-frame playback. The value must be greater than <i>dwFullFrameRate</i>. The default value is 6.
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
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferconfigure2-setfftransitionrates
     */
    SetFFTransitionRates(dwMaxFullFrameRate, dwMaxNonSkippingRate) {
        result := ComCall(11, this, "uint", dwMaxFullFrameRate, "uint", dwMaxNonSkippingRate, "HRESULT")
        return result
    }

    /**
     * The GetFFTransitionRates method returns the maximum full-frame and key-frame playback rates.
     * @param {Pointer<Integer>} pdwMaxFullFrameRate Receives the maximum full-frame playback rate. At higher playback rates, only key frames are sent.
     * @param {Pointer<Integer>} pdwMaxNonSkippingRate Receives the maximum key-frame playback rate. At higher playback rates, some key frames are skipped. The number of key frames that are skipped is proportional to the rate.
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
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferconfigure2-getfftransitionrates
     */
    GetFFTransitionRates(pdwMaxFullFrameRate, pdwMaxNonSkippingRate) {
        pdwMaxFullFrameRateMarshal := pdwMaxFullFrameRate is VarRef ? "uint*" : "ptr"
        pdwMaxNonSkippingRateMarshal := pdwMaxNonSkippingRate is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pdwMaxFullFrameRateMarshal, pdwMaxFullFrameRate, pdwMaxNonSkippingRateMarshal, pdwMaxNonSkippingRate, "HRESULT")
        return result
    }
}
