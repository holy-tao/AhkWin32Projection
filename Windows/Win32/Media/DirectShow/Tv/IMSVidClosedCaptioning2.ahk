#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidClosedCaptioning.ahk" { IMSVidClosedCaptioning }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MSVidCCService.ahk" { MSVidCCService }

/**
 * The IMSVidClosedCaptioning2 interface sets the closed captioning service, such as CC1 or CC2. The MSVidClosedCaptioning feature exposes this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidClosedCaptioning2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidclosedcaptioning2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidClosedCaptioning2 extends IMSVidClosedCaptioning {
    /**
     * The interface identifier for IMSVidClosedCaptioning2
     * @type {Guid}
     */
    static IID := Guid("{e00cb864-a029-4310-9987-a873f5887d97}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidClosedCaptioning2 interfaces
    */
    struct Vtbl extends IMSVidClosedCaptioning.Vtbl {
        get_Service : IntPtr
        put_Service : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidClosedCaptioning2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {MSVidCCService} 
     */
    Service {
        get => this.get_Service()
        set => this.put_Service(value)
    }

    /**
     * The get_Service method retrieves the current closed captioning service.
     * @returns {MSVidCCService} Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/segment/ne-segment-msvidccservice">MSVidCCService</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidclosedcaptioning2-get_service
     */
    get_Service() {
        result := ComCall(18, this, "int*", &On := 0, "HRESULT")
        return On
    }

    /**
     * The get_Service method sets the closed captioning service.
     * @param {MSVidCCService} On Specifies the closed captioning service, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/segment/ne-segment-msvidccservice">MSVidCCService</a> enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidclosedcaptioning2-put_service
     */
    put_Service(On) {
        result := ComCall(19, this, MSVidCCService, On, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidClosedCaptioning2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Service := CallbackCreate(GetMethod(implObj, "get_Service"), flags, 2)
        this.vtbl.put_Service := CallbackCreate(GetMethod(implObj, "put_Service"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Service)
        CallbackFree(this.vtbl.put_Service)
    }
}
