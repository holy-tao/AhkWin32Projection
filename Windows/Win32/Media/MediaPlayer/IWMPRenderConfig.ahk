#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPRenderConfig interface provides methods to specify or retrieve a value indicating whether Media Foundation&#8211;based playback is restricted to the current process.Note  Using this interface with protected content is not supported. .
 * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nn-wmprealestate-iwmprenderconfig
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPRenderConfig extends IUnknown {
    /**
     * The interface identifier for IWMPRenderConfig
     * @type {Guid}
     */
    static IID := Guid("{959506c1-0314-4ec5-9e61-8528db5e5478}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPRenderConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_inProcOnly : IntPtr
        get_inProcOnly : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPRenderConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    inProcOnly {
        get => this.get_inProcOnly()
        set => this.put_inProcOnly(value)
    }

    /**
     * The put_inProcOnly method specifies a value indicating whether playback is restricted to the current process.
     * @remarks
     * Using this method with protected content is not supported.
     * 
     * This method can be helpful when debugging. If your program works with the Media Foundation topology directly (for example, specifying an EVR presenter by using the <a href="https://docs.microsoft.com/windows/desktop/api/wmprealestate/nn-wmprealestate-iwmpvideorenderconfig">IWMPVideoRenderConfig</a> interface), it might be easier to debug your code when the presenter is in the same process.
     * 
     * This method might also be useful if your Media Foundation components are designed to run in the main program's process.
     * 
     * Note that DirectShow graphs in Windows Media Player always run in the main process.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {BOOL} fInProc <b>BOOL</b>, <b>TRUE</b> specifying that playback is restricted to the current process.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nf-wmprealestate-iwmprenderconfig-put_inproconly
     */
    put_inProcOnly(fInProc) {
        result := ComCall(3, this, BOOL, fInProc, "HRESULT")
        return result
    }

    /**
     * The get_inProcOnly method retrieves a value indicating whether playback is restricted to the current process.
     * @remarks
     * Using this method with protected content is not supported.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<BOOL>} pfInProc Pointer to a <b>BOOL</b> that receives the result. <b>TRUE</b> specifies that playback is restricted to the current process.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmprealestate/nf-wmprealestate-iwmprenderconfig-get_inproconly
     */
    get_inProcOnly(pfInProc) {
        pfInProcMarshal := pfInProc is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pfInProcMarshal, pfInProc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPRenderConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_inProcOnly := CallbackCreate(GetMethod(implObj, "put_inProcOnly"), flags, 2)
        this.vtbl.get_inProcOnly := CallbackCreate(GetMethod(implObj, "get_inProcOnly"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_inProcOnly)
        CallbackFree(this.vtbl.get_inProcOnly)
    }
}
