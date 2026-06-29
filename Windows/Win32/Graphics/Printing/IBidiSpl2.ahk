#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IBidiSpl2 extends IUnknown {
    /**
     * The interface identifier for IBidiSpl2
     * @type {Guid}
     */
    static IID := Guid("{0e8f51b8-8273-4906-8e7b-be453ffd2e2b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBidiSpl2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BindDevice        : IntPtr
        UnbindDevice      : IntPtr
        SendRecvXMLString : IntPtr
        SendRecvXMLStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBidiSpl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszDeviceName 
     * @param {Integer} dwAccess 
     * @returns {HRESULT} 
     */
    BindDevice(pszDeviceName, dwAccess) {
        pszDeviceName := pszDeviceName is String ? StrPtr(pszDeviceName) : pszDeviceName

        result := ComCall(3, this, "ptr", pszDeviceName, "uint", dwAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnbindDevice() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRequest 
     * @returns {BSTR} 
     */
    SendRecvXMLString(bstrRequest) {
        bstrRequest := bstrRequest is String ? BSTR.Alloc(bstrRequest).Value : bstrRequest

        pbstrResponse := BSTR.Owned()
        result := ComCall(5, this, BSTR, bstrRequest, BSTR.Ptr, pbstrResponse, "HRESULT")
        return pbstrResponse
    }

    /**
     * 
     * @param {IStream} pSRequest 
     * @returns {IStream} 
     */
    SendRecvXMLStream(pSRequest) {
        result := ComCall(6, this, "ptr", pSRequest, "ptr*", &ppSResponse := 0, "HRESULT")
        return IStream(ppSResponse)
    }

    Query(iid) {
        if (IBidiSpl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BindDevice := CallbackCreate(GetMethod(implObj, "BindDevice"), flags, 3)
        this.vtbl.UnbindDevice := CallbackCreate(GetMethod(implObj, "UnbindDevice"), flags, 1)
        this.vtbl.SendRecvXMLString := CallbackCreate(GetMethod(implObj, "SendRecvXMLString"), flags, 3)
        this.vtbl.SendRecvXMLStream := CallbackCreate(GetMethod(implObj, "SendRecvXMLStream"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BindDevice)
        CallbackFree(this.vtbl.UnbindDevice)
        CallbackFree(this.vtbl.SendRecvXMLString)
        CallbackFree(this.vtbl.SendRecvXMLStream)
    }
}
