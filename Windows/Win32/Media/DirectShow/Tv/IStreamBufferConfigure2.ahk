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
     * 
     * @param {Integer} cbBytesPerPacket 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure2-setmultiplexedpacketsize
     */
    SetMultiplexedPacketSize(cbBytesPerPacket) {
        result := ComCall(9, this, "uint", cbBytesPerPacket, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure2-getmultiplexedpacketsize
     */
    GetMultiplexedPacketSize() {
        result := ComCall(10, this, "uint*", &pcbBytesPerPacket := 0, "HRESULT")
        return pcbBytesPerPacket
    }

    /**
     * 
     * @param {Integer} dwMaxFullFrameRate 
     * @param {Integer} dwMaxNonSkippingRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure2-setfftransitionrates
     */
    SetFFTransitionRates(dwMaxFullFrameRate, dwMaxNonSkippingRate) {
        result := ComCall(11, this, "uint", dwMaxFullFrameRate, "uint", dwMaxNonSkippingRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMaxFullFrameRate 
     * @param {Pointer<Integer>} pdwMaxNonSkippingRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure2-getfftransitionrates
     */
    GetFFTransitionRates(pdwMaxFullFrameRate, pdwMaxNonSkippingRate) {
        pdwMaxFullFrameRateMarshal := pdwMaxFullFrameRate is VarRef ? "uint*" : "ptr"
        pdwMaxNonSkippingRateMarshal := pdwMaxNonSkippingRate is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pdwMaxFullFrameRateMarshal, pdwMaxFullFrameRate, pdwMaxNonSkippingRateMarshal, pdwMaxNonSkippingRate, "HRESULT")
        return result
    }
}
