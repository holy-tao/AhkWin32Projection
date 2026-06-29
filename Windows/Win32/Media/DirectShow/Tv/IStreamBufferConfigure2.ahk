#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IStreamBufferConfigure.ahk" { IStreamBufferConfigure }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IStreamBufferConfigure2 interface is exposed by the StreamBufferConfig object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferConfigure2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambufferconfigure2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IStreamBufferConfigure2 extends IStreamBufferConfigure {
    /**
     * The interface identifier for IStreamBufferConfigure2
     * @type {Guid}
     */
    static IID := Guid("{53e037bf-3992-4282-ae34-2487b4dae06b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamBufferConfigure2 interfaces
    */
    struct Vtbl extends IStreamBufferConfigure.Vtbl {
        SetMultiplexedPacketSize : IntPtr
        GetMultiplexedPacketSize : IntPtr
        SetFFTransitionRates     : IntPtr
        GetFFTransitionRates     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamBufferConfigure2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetMultiplexedPacketSize method sets the size of the multiplexed packets in the backing files for the Stream Buffer Engine.
     * @remarks
     * For low-bit-rate streams, the default packet size may be unnecessarily large. You can use this method to reduce the packet size.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure2-setmultiplexedpacketsize
     */
    SetMultiplexedPacketSize(cbBytesPerPacket) {
        result := ComCall(9, this, "uint", cbBytesPerPacket, "HRESULT")
        return result
    }

    /**
     * The GetMultiplexedPacketSize method returns the size of the multiplexed packets in the backing files for the Stream Buffer Engine.
     * @returns {Integer} Receives the packet size, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure2-getmultiplexedpacketsize
     */
    GetMultiplexedPacketSize() {
        result := ComCall(10, this, "uint*", &pcbBytesPerPacket := 0, "HRESULT")
        return pcbBytesPerPacket
    }

    /**
     * The SetFFTransitionRates method sets the behavior of fast-forward play (&#0034;trick mode&#0034;) in the Stream Buffer Engine.
     * @remarks
     * At higher playback rates, the Stream Buffer Engine drops frames in order to maintain the desired rate. The following table shows how the values of <i>dwMaxFullFrameRate</i> and <i>dwMaxNonSkippingRate</i> affect playback.
     * 
     * <table>
     * <tr>
     * <th>Playback rate
     *             </th>
     * <th>Behavior
     *             </th>
     * </tr>
     * <tr>
     * <td>rate &lt;= <i>dwMaxFullFrameRate</i></td>
     * <td>Full-frame playback: All frames are sent.</td>
     * </tr>
     * <tr>
     * <td><i>dwMaxFullFrameRate</i> &lt; rate &lt;= <i>dwMaxNonSkippingRate</i></td>
     * <td>Key-frame playback: All key frames are sent. Delta frames are skipped.</td>
     * </tr>
     * <tr>
     * <td><i>dwMaxNonSkippingRate</i> &lt; rate</td>
     * <td>Key-frame playback with seeking: All delta frames are skipped, and some key frames are skipped. The number of skipped key frames is proportional to the rate.</td>
     * </tr>
     * </table>
     *  
     * 
     * The decoder may drop frames as well, depending on the data rate, the monitor refresh rate, and the CPU load.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure2-setfftransitionrates
     */
    SetFFTransitionRates(dwMaxFullFrameRate, dwMaxNonSkippingRate) {
        result := ComCall(11, this, "uint", dwMaxFullFrameRate, "uint", dwMaxNonSkippingRate, "HRESULT")
        return result
    }

    /**
     * The GetFFTransitionRates method returns the maximum full-frame and key-frame playback rates.
     * @remarks
     * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambufferconfigure2-setfftransitionrates">IStreamBufferConfigure2::SetFFTransitionRates</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure2-getfftransitionrates
     */
    GetFFTransitionRates(pdwMaxFullFrameRate, pdwMaxNonSkippingRate) {
        pdwMaxFullFrameRateMarshal := pdwMaxFullFrameRate is VarRef ? "uint*" : "ptr"
        pdwMaxNonSkippingRateMarshal := pdwMaxNonSkippingRate is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pdwMaxFullFrameRateMarshal, pdwMaxFullFrameRate, pdwMaxNonSkippingRateMarshal, pdwMaxNonSkippingRate, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamBufferConfigure2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMultiplexedPacketSize := CallbackCreate(GetMethod(implObj, "SetMultiplexedPacketSize"), flags, 2)
        this.vtbl.GetMultiplexedPacketSize := CallbackCreate(GetMethod(implObj, "GetMultiplexedPacketSize"), flags, 2)
        this.vtbl.SetFFTransitionRates := CallbackCreate(GetMethod(implObj, "SetFFTransitionRates"), flags, 3)
        this.vtbl.GetFFTransitionRates := CallbackCreate(GetMethod(implObj, "GetFFTransitionRates"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMultiplexedPacketSize)
        CallbackFree(this.vtbl.GetMultiplexedPacketSize)
        CallbackFree(this.vtbl.SetFFTransitionRates)
        CallbackFree(this.vtbl.GetFFTransitionRates)
    }
}
