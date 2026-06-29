#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPTranscodePolicy interface provides a method implemented by DirectShow source filters to manage changing the format of digital media files.
 * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nn-wmpservices-iwmptranscodepolicy
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPTranscodePolicy extends IUnknown {
    /**
     * The interface identifier for IWMPTranscodePolicy
     * @type {Guid}
     */
    static IID := Guid("{b64cbac3-401c-4327-a3e8-b9feb3a8c25c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPTranscodePolicy interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        allowTranscode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPTranscodePolicy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The allowTranscode method retrieves a value specifying whether Windows Media Player is permitted to change the format of the digital media content to the Windows Media format.
     * @remarks
     * When you copy to a device a digital media file that is in a custom format, you must change the format of the content if the device does not support the custom format. This process is called transcoding.
     * 
     * If the format used by a digital media file is not supported, Windows Media Player first checks the registry for existing permission to transcode, as described in <a href="https://docs.microsoft.com/windows/desktop/WMP/file-name-extension-registry-settings">File Name Extension Registry Settings</a>. If the custom format type is registered for permission to transcode, Windows Media Player locates the DirectShow source filter for the custom format type and calls <b>QueryInterface</b> to retrieve a pointer to <b>IWMPTranscodePolicy</b>. If the interface pointer is retrieved, the Player calls <b>IWMPTranscodePolicy::allowTranscode</b>. If <b>allowTranscode</b> returns VARIANT_TRUE, Windows Media Player performs the necessary transcoding. Otherwise, Windows Media Player does not copy the digital media file to the device. If any filter in the DirectShow graph returns VARIANT_FALSE from <b>allowTranscode</b>, the transcoding operation will fail.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<VARIANT_BOOL>} pvbAllow Pointer to a <b>VARIANT_BOOL</b> that contains a value indicating whether transcoding is permitted.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmptranscodepolicy-allowtranscode
     */
    allowTranscode(pvbAllow) {
        pvbAllowMarshal := pvbAllow is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, pvbAllowMarshal, pvbAllow, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPTranscodePolicy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.allowTranscode := CallbackCreate(GetMethod(implObj, "allowTranscode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.allowTranscode)
    }
}
