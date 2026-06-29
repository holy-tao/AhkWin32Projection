#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WPD_STREAM_UNITS.ahk" { WPD_STREAM_UNITS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPortableDeviceUnitsStream interface provides a way to operate, or seek, on a stream by using alternate units, such as frames or milliseconds.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceunitsstream
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceUnitsStream extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceUnitsStream
     * @type {Guid}
     */
    static IID := Guid("{5e98025f-bfc4-47a2-9a5f-bc900a507c67}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceUnitsStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SeekInUnits : IntPtr
        Cancel      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceUnitsStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SeekInUnits method performs a seek on a stream, based on alternate units.
     * @param {Integer} dlibMove The displacement to add to the location indicated by the <i>dwOrigin</i> parameter. The units for the displacement are specified by <i>units</i>. If <i>dwOrigin</i> is <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">STREAM_SEEK_SET</a>, this is interpreted as an unsigned value rather than a signed value.
     * @param {WPD_STREAM_UNITS} units The units of the <i>dlibMove</i> and <i>plibNewPosition</i> parameters.  See <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-stream-units">WPD_STREAM_UNITS</a> for more details.
     * @param {Integer} dwOrigin The origin for the displacement specified in <i>dlibMove</i>. The origin can be the beginning of the file (STREAM_SEEK_SET), the current seek pointer (STREAM_SEEK_CUR), or the end of the file (STREAM_SEEK_END). For more information about values, see the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">STREAM_SEEK</a> enumeration.
     * @returns {Integer} A pointer to the location where this method writes the value of the new seek pointer from the beginning of the stream. The units are given by units.
     * You can set this pointer to NULL. In this case, this method does not provide the new seek pointer.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceunitsstream-seekinunits
     */
    SeekInUnits(dlibMove, units, dwOrigin) {
        result := ComCall(3, this, "int64", dlibMove, WPD_STREAM_UNITS, units, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "HRESULT")
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

    Query(iid) {
        if (IPortableDeviceUnitsStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SeekInUnits := CallbackCreate(GetMethod(implObj, "SeekInUnits"), flags, 5)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SeekInUnits)
        CallbackFree(this.vtbl.Cancel)
    }
}
