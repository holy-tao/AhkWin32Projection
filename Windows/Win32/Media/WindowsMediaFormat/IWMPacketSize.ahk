#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPacketSize interface controls the maximum size of packets in an ASF file.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmpacketsize
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMPacketSize extends IUnknown {
    /**
     * The interface identifier for IWMPacketSize
     * @type {Guid}
     */
    static IID := Guid("{cdfb97ab-188f-40b3-b643-5b7903975c59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPacketSize interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMaxPacketSize : IntPtr
        SetMaxPacketSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPacketSize.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetMaxPacketSize method retrieves the maximum size of a packet in an ASF file.
     * @remarks
     * For more information, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmpacketsize-setmaxpacketsize">SetMaxPacketSize</a>.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the maximum packet size, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpacketsize-getmaxpacketsize
     */
    GetMaxPacketSize() {
        result := ComCall(3, this, "uint*", &pdwMaxPacketSize := 0, "HRESULT")
        return pdwMaxPacketSize
    }

    /**
     * The SetMaxPacketSize method specifies the maximum size of a packet in an ASF file.
     * @remarks
     * By default, the maximum packet size is 1400 bytes (chosen because it is below the 1500-byte Ethernet maximum transition unit (MTU) plus the generic routing encapsulation (GRE) tunneling header size). The writer attempts to send 10 packets per second up to but not exceeding the value of the defined maximum packet size.
     * 
     * This method is designed for use with only single bit rate video; it should not be applied to a multiple bit rate stream. Note also that the maximum value applies only to the data; a small amount will be added for the header. For this reason there will be a small variance between the setting specified by this method and the actual maximum packet size reported by other tools for the stream.
     * @param {Integer} dwMaxPacketSize <b>DWORD</b> containing the maximum packet size, in bytes. Set this to zero if the writer is to generate packets of various sizes. Otherwise, it must be a value between 100 bytes and 64 kilobytes.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwMaxPacketSize</i> parameter contains an invalid value for the maximum packet size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpacketsize-setmaxpacketsize
     */
    SetMaxPacketSize(dwMaxPacketSize) {
        result := ComCall(4, this, "uint", dwMaxPacketSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPacketSize.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMaxPacketSize := CallbackCreate(GetMethod(implObj, "GetMaxPacketSize"), flags, 2)
        this.vtbl.SetMaxPacketSize := CallbackCreate(GetMethod(implObj, "SetMaxPacketSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMaxPacketSize)
        CallbackFree(this.vtbl.SetMaxPacketSize)
    }
}
