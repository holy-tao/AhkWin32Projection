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
     * 
     * @param {Integer} cbBytesPerPacket 
     * @returns {HRESULT} 
     */
    SetMultiplexedPacketSize(cbBytesPerPacket) {
        result := ComCall(9, this, "uint", cbBytesPerPacket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbBytesPerPacket 
     * @returns {HRESULT} 
     */
    GetMultiplexedPacketSize(pcbBytesPerPacket) {
        result := ComCall(10, this, "uint*", pcbBytesPerPacket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMaxFullFrameRate 
     * @param {Integer} dwMaxNonSkippingRate 
     * @returns {HRESULT} 
     */
    SetFFTransitionRates(dwMaxFullFrameRate, dwMaxNonSkippingRate) {
        result := ComCall(11, this, "uint", dwMaxFullFrameRate, "uint", dwMaxNonSkippingRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMaxFullFrameRate 
     * @param {Pointer<UInt32>} pdwMaxNonSkippingRate 
     * @returns {HRESULT} 
     */
    GetFFTransitionRates(pdwMaxFullFrameRate, pdwMaxNonSkippingRate) {
        result := ComCall(12, this, "uint*", pdwMaxFullFrameRate, "uint*", pdwMaxNonSkippingRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
