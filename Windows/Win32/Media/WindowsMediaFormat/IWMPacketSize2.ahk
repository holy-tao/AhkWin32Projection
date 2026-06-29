#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPacketSize.ahk" { IWMPacketSize }

/**
 * The IWMPacketSize2 interface provides methods to set and retrieve the minimum packet size for a profile.An IWMPacketSize2 interface can be obtained for either a profile object, a reader object, or a synchronous reader object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmpacketsize2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMPacketSize2 extends IWMPacketSize {
    /**
     * The interface identifier for IWMPacketSize2
     * @type {Guid}
     */
    static IID := Guid("{8bfc2b9e-b646-4233-a877-1c6a079669dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPacketSize2 interfaces
    */
    struct Vtbl extends IWMPacketSize.Vtbl {
        GetMinPacketSize : IntPtr
        SetMinPacketSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPacketSize2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetMinPacketSize method retrieves the minimum packet size for files created with the profile. If you use this method from an interface belonging to a reader or synchronous reader object, the retrieved minimum packet size will always be zero.
     * @returns {Integer} Pointer to a <b>DWORD</b> that will receive the minimum packet size.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpacketsize2-getminpacketsize
     */
    GetMinPacketSize() {
        result := ComCall(5, this, "uint*", &pdwMinPacketSize := 0, "HRESULT")
        return pdwMinPacketSize
    }

    /**
     * The SetMinPacketSize method sets the minimum packet size for files created with the profile. This method cannot be called from an interface belonging to a reader or synchronous reader object.
     * @remarks
     * This method is used to force the writer to create packet sizes that are larger than the default size. The writer object, by default, selects an optimal packet size based on the bit rate. At bit rates below 350 kbps, it is approximately 1440 bytes. Below 100 kbps, the default packet size is calculated to provide approximately 10 packets per second, or ((bit_rate / 8) / 10).
     * 
     * Although larger packets result in a smaller file, they can also make the file more difficult to stream over a network. Use this method with caution if you are creating files that will be streamed. It is recommended that the packet size never be set to a value greater than 8000 bytes, which is the default packet size above 350 kbps.
     * @param {Integer} dwMinPacketSize <b>DWORD</b> specifying the new minimum packet size for files created with the profile.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpacketsize2-setminpacketsize
     */
    SetMinPacketSize(dwMinPacketSize) {
        result := ComCall(6, this, "uint", dwMinPacketSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPacketSize2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMinPacketSize := CallbackCreate(GetMethod(implObj, "GetMinPacketSize"), flags, 2)
        this.vtbl.SetMinPacketSize := CallbackCreate(GetMethod(implObj, "SetMinPacketSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMinPacketSize)
        CallbackFree(this.vtbl.SetMinPacketSize)
    }
}
