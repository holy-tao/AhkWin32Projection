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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SeekInUnits", "Cancel"]

    /**
     * The SeekInUnits method performs a seek on a stream, based on alternate units.
     * @param {Integer} dlibMove The displacement to add to the location indicated by the <i>dwOrigin</i> parameter. The units for the displacement are specified by <i>units</i>. If <i>dwOrigin</i> is <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">STREAM_SEEK_SET</a>, this is interpreted as an unsigned value rather than a signed value.
     * @param {Integer} units The units of the <i>dlibMove</i> and <i>plibNewPosition</i> parameters.  See <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-stream-units">WPD_STREAM_UNITS</a> for more details.
     * @param {Integer} dwOrigin The origin for the displacement specified in <i>dlibMove</i>. The origin can be the beginning of the file (STREAM_SEEK_SET), the current seek pointer (STREAM_SEEK_CUR), or the end of the file (STREAM_SEEK_END). For more information about values, see the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">STREAM_SEEK</a> enumeration.
     * @returns {Integer} A pointer to the location where this method writes the value of the new seek pointer from the beginning of the stream. The units are given by units.
     * You can set this pointer to NULL. In this case, this method does not provide the new seek pointer.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceunitsstream-seekinunits
     */
    SeekInUnits(dlibMove, units, dwOrigin) {
        result := ComCall(3, this, "int64", dlibMove, "int", units, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "HRESULT")
        return plibNewPosition
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
