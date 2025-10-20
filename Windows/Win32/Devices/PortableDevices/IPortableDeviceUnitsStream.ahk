#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceUnitsStream interface provides a way to operate, or seek, on a stream by using alternate units, such as frames or milliseconds.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceunitsstream
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceUnitsStream extends IUnknown{
    /**
     * The interface identifier for IPortableDeviceUnitsStream
     * @type {Guid}
     */
    static IID => Guid("{5e98025f-bfc4-47a2-9a5f-bc900a507c67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dlibMove 
     * @param {Integer} units 
     * @param {Integer} dwOrigin 
     * @param {Pointer<UInt64>} plibNewPosition 
     * @returns {HRESULT} 
     */
    SeekInUnits(dlibMove, units, dwOrigin, plibNewPosition) {
        result := ComCall(3, this, "int64", dlibMove, "int", units, "uint", dwOrigin, "uint*", plibNewPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
