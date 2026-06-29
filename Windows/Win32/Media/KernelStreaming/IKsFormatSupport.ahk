#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IKsFormatSupport interface provides information about the audio data formats that are supported by a software-configured I/O connection (typically a DMA channel) between an audio adapter device and system memory.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iksformatsupport
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsFormatSupport extends IUnknown {
    /**
     * The interface identifier for IKsFormatSupport
     * @type {Guid}
     */
    static IID := Guid("{3cb4a69d-bb6f-4d2b-95b7-452d2c155db5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsFormatSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsFormatSupported        : IntPtr
        GetDevicePreferredFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsFormatSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IsFormatSupported method indicates whether the audio endpoint device supports the specified audio stream format.
     * @param {Pointer<KSDATAFORMAT>} pKsFormat Pointer to an audio-stream format specifier. This parameter points to a caller-allocated buffer that contains a format specifier. The specifier begins with a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ks/ns-ks-ksdataformat">KSDATAFORMAT</a> structure that might be followed by additional format information. For more information about <b>KSDATAFORMAT</b> and format specifiers, see the Windows DDK documentation.
     * @param {Integer} cbFormat The size in bytes of the buffer that contains the format specifier.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable into which the method writes a value to indicate whether the format is supported. The method writes <b>TRUE</b> if the device supports the format and <b>FALSE</b> if the device does not support the format.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iksformatsupport-isformatsupported
     */
    IsFormatSupported(pKsFormat, cbFormat) {
        result := ComCall(3, this, KSDATAFORMAT.Ptr, pKsFormat, "uint", cbFormat, BOOL.Ptr, &pbSupported := 0, "HRESULT")
        return pbSupported
    }

    /**
     * The GetDevicePreferredFormat method gets the preferred audio stream format for the connection.
     * @returns {Pointer<KSDATAFORMAT>} Pointer to a pointer variable into which the method writes the address of a buffer that contains the format specifier for the preferred format. The specifier begins with a <b>KSDATAFORMAT</b> structure that might be followed by additional format information. The method allocates the storage for the format specifier. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the method fails,  <i>*ppKsFormat</i> is <b>NULL</b>. For more information about <b>KSDATAFORMAT</b>, format specifiers, and <b>CoTaskMemFree</b>, see the Windows DDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iksformatsupport-getdevicepreferredformat
     */
    GetDevicePreferredFormat() {
        result := ComCall(4, this, "ptr*", &ppKsFormat := 0, "HRESULT")
        return ppKsFormat
    }

    Query(iid) {
        if (IKsFormatSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsFormatSupported := CallbackCreate(GetMethod(implObj, "IsFormatSupported"), flags, 4)
        this.vtbl.GetDevicePreferredFormat := CallbackCreate(GetMethod(implObj, "GetDevicePreferredFormat"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsFormatSupported)
        CallbackFree(this.vtbl.GetDevicePreferredFormat)
    }
}
