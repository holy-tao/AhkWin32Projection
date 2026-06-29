#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DDVIDEOPORTCONNECT.ahk" { DDVIDEOPORTCONNECT }
#Import ".\IDirectDrawVideoPort.ahk" { IDirectDrawVideoPort }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDVIDEOPORTSTATUS.ahk" { DDVIDEOPORTSTATUS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DDVIDEOPORTCAPS.ahk" { DDVIDEOPORTCAPS }
#Import ".\DDVIDEOPORTDESC.ahk" { DDVIDEOPORTDESC }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IDDVideoPortContainer extends IUnknown {
    /**
     * The interface identifier for IDDVideoPortContainer
     * @type {Guid}
     */
    static IID := Guid("{6c142760-a733-11ce-a521-0020af0be560}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDDVideoPortContainer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateVideoPort         : IntPtr
        EnumVideoPorts          : IntPtr
        GetVideoPortConnectInfo : IntPtr
        QueryVideoPortStatus    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDDVideoPortContainer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDVIDEOPORTDESC>} param1 
     * @param {IUnknown} param3 
     * @returns {IDirectDrawVideoPort} 
     */
    CreateVideoPort(param0, param1, param3) {
        result := ComCall(3, this, "uint", param0, DDVIDEOPORTDESC.Ptr, param1, "ptr*", &param2 := 0, "ptr", param3, "HRESULT")
        return IDirectDrawVideoPort(param2)
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDVIDEOPORTCAPS>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<LPDDENUMVIDEOCALLBACK>} param3 
     * @returns {HRESULT} 
     */
    EnumVideoPorts(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", param0, DDVIDEOPORTCAPS.Ptr, param1, param2Marshal, param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Integer>} pcInfo 
     * @returns {DDVIDEOPORTCONNECT} 
     */
    GetVideoPortConnectInfo(param0, pcInfo) {
        pcInfoMarshal := pcInfo is VarRef ? "uint*" : "ptr"

        param2 := DDVIDEOPORTCONNECT()
        result := ComCall(5, this, "uint", param0, pcInfoMarshal, pcInfo, DDVIDEOPORTCONNECT.Ptr, param2, "HRESULT")
        return param2
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDVIDEOPORTSTATUS>} param1 
     * @returns {HRESULT} 
     */
    QueryVideoPortStatus(param0, param1) {
        result := ComCall(6, this, "uint", param0, DDVIDEOPORTSTATUS.Ptr, param1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDDVideoPortContainer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateVideoPort := CallbackCreate(GetMethod(implObj, "CreateVideoPort"), flags, 5)
        this.vtbl.EnumVideoPorts := CallbackCreate(GetMethod(implObj, "EnumVideoPorts"), flags, 5)
        this.vtbl.GetVideoPortConnectInfo := CallbackCreate(GetMethod(implObj, "GetVideoPortConnectInfo"), flags, 4)
        this.vtbl.QueryVideoPortStatus := CallbackCreate(GetMethod(implObj, "QueryVideoPortStatus"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateVideoPort)
        CallbackFree(this.vtbl.EnumVideoPorts)
        CallbackFree(this.vtbl.GetVideoPortConnectInfo)
        CallbackFree(this.vtbl.QueryVideoPortStatus)
    }
}
