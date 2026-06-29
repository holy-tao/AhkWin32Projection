#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidStreamBufferSink.ahk" { IMSVidStreamBufferSink }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IMSVidStreamBufferSink2 interface represents the Stream Buffer Sink filter within the Video Control.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSink2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersink2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSink2 extends IMSVidStreamBufferSink {
    /**
     * The interface identifier for IMSVidStreamBufferSink2
     * @type {Guid}
     */
    static IID := Guid("{2ca9fc63-c131-4e5a-955a-544a47c67146}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSink2 interfaces
    */
    struct Vtbl extends IMSVidStreamBufferSink.Vtbl {
        UnlockProfile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersink2-unlockprofile
     */
    UnlockProfile() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidStreamBufferSink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UnlockProfile := CallbackCreate(GetMethod(implObj, "UnlockProfile"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UnlockProfile)
    }
}
