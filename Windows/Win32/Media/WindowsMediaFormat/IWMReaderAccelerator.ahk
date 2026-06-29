#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WM_MEDIA_TYPE.ahk" { WM_MEDIA_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMReaderAccelerator interface is implemented on the reader object only when it is in decoding mode. It is called by a player or a player source filter to obtain interfaces from the decoder DMO.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreaderaccelerator
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMReaderAccelerator extends IUnknown {
    /**
     * The interface identifier for IWMReaderAccelerator
     * @type {Guid}
     */
    static IID := Guid("{bddc4d08-944d-4d52-a612-46c3fda07dd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMReaderAccelerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCodecInterface : IntPtr
        Notify            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMReaderAccelerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetCodecInterface method is used to retrieve a pointer to the IWMCodecAMVideoAccelerator interface exposed on the decoder DMO.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {Pointer<Guid>} riid Reference to the IID of the interface to obtain. The value must be IID_IWMCodecAMVideoAccelerator.
     * @returns {Pointer<Void>} Address of a pointer that receives the interface specified by <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderaccelerator-getcodecinterface
     */
    GetCodecInterface(dwOutputNum, riid) {
        result := ComCall(3, this, "uint", dwOutputNum, Guid.Ptr, riid, "ptr*", &ppvCodecInterface := 0, "HRESULT")
        return ppvCodecInterface
    }

    /**
     * The Notify method is called by the source filter to pass in the negotiated media type.
     * @remarks
     * This method enables the reader to update its internal variables and commit to the DirectX VA connection. This is the last place the decoder or reader can fail.
     * @param {Integer} dwOutputNum <b>DWORD</b> that specifies the stream associated with the notification.
     * @param {Pointer<WM_MEDIA_TYPE>} pSubtype Pointer to a media type that describes the current connection parameters for the stream.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code .
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderaccelerator-notify
     */
    Notify(dwOutputNum, pSubtype) {
        result := ComCall(4, this, "uint", dwOutputNum, WM_MEDIA_TYPE.Ptr, pSubtype, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMReaderAccelerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCodecInterface := CallbackCreate(GetMethod(implObj, "GetCodecInterface"), flags, 4)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCodecInterface)
        CallbackFree(this.vtbl.Notify)
    }
}
