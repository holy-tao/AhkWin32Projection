#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIDebug extends IUnknown {
    /**
     * The interface identifier for IRDPSRAPIDebug
     * @type {Guid}
     */
    static IID := Guid("{aa1e42b5-496d-4ca4-a690-348dcb2ec4ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIDebug interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_CLXCmdLine : IntPtr
        get_CLXCmdLine : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIDebug.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    CLXCmdLine {
        get => this.get_CLXCmdLine()
        set => this.put_CLXCmdLine(value)
    }

    /**
     * 
     * @param {BSTR} CLXCmdLine 
     * @returns {HRESULT} 
     */
    put_CLXCmdLine(CLXCmdLine) {
        CLXCmdLine := CLXCmdLine is String ? BSTR.Alloc(CLXCmdLine).Value : CLXCmdLine

        result := ComCall(3, this, BSTR, CLXCmdLine, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CLXCmdLine() {
        pCLXCmdLine := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pCLXCmdLine, "HRESULT")
        return pCLXCmdLine
    }

    Query(iid) {
        if (IRDPSRAPIDebug.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_CLXCmdLine := CallbackCreate(GetMethod(implObj, "put_CLXCmdLine"), flags, 2)
        this.vtbl.get_CLXCmdLine := CallbackCreate(GetMethod(implObj, "get_CLXCmdLine"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_CLXCmdLine)
        CallbackFree(this.vtbl.get_CLXCmdLine)
    }
}
