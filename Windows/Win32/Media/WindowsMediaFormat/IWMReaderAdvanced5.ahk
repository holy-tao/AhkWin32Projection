#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMReaderAdvanced4.ahk" { IWMReaderAdvanced4 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPlayerHook.ahk" { IWMPlayerHook }

/**
 * The IWMReaderAdvanced5 interface enables you to associate a player-hook callback interface with the reader object.An IWMReaderAdvanced5 interface exists for every reader object.
 * @remarks
 * A player-hook callback can be assigned in the reader object to enable per-sample processing when using DirectX Video Acceleration.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreaderadvanced5
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMReaderAdvanced5 extends IWMReaderAdvanced4 {
    /**
     * The interface identifier for IWMReaderAdvanced5
     * @type {Guid}
     */
    static IID := Guid("{24c44db0-55d1-49ae-a5cc-f13815e36363}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMReaderAdvanced5 interfaces
    */
    struct Vtbl extends IWMReaderAdvanced4.Vtbl {
        SetPlayerHook : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMReaderAdvanced5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetPlayerHook method assigns a player-hook callback to the reader. The reader calls the callback method before sending each sample to the graphics processor for decompression.
     * @remarks
     * DirectX Video Acceleration enables supported graphics cards to decompress video samples.
     * @param {Integer} dwOutputNum The output number to which the player-hook callback applies.
     * @param {IWMPlayerHook} pHook Pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmplayerhook">IWMPlayerHook</a> interface that will be used in association with the specified output.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced5-setplayerhook
     */
    SetPlayerHook(dwOutputNum, pHook) {
        result := ComCall(49, this, "uint", dwOutputNum, "ptr", pHook, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMReaderAdvanced5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPlayerHook := CallbackCreate(GetMethod(implObj, "SetPlayerHook"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPlayerHook)
    }
}
