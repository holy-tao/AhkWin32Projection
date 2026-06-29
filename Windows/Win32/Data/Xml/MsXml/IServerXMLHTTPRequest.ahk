#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLHTTPRequest.ahk" { IXMLHTTPRequest }
#Import ".\SERVERXMLHTTP_OPTION.ahk" { SERVERXMLHTTP_OPTION }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IServerXMLHTTPRequest extends IXMLHTTPRequest {
    /**
     * The interface identifier for IServerXMLHTTPRequest
     * @type {Guid}
     */
    static IID := Guid("{2e9196bf-13ba-4dd4-91ca-6c571f281495}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServerXMLHTTPRequest interfaces
    */
    struct Vtbl extends IXMLHTTPRequest.Vtbl {
        setTimeouts     : IntPtr
        waitForResponse : IntPtr
        getOption       : IntPtr
        setOption       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServerXMLHTTPRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} resolveTimeout 
     * @param {Integer} connectTimeout 
     * @param {Integer} sendTimeout 
     * @param {Integer} receiveTimeout 
     * @returns {HRESULT} 
     */
    setTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout) {
        result := ComCall(21, this, "int", resolveTimeout, "int", connectTimeout, "int", sendTimeout, "int", receiveTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} timeoutInSeconds 
     * @returns {VARIANT_BOOL} 
     */
    waitForResponse(timeoutInSeconds) {
        result := ComCall(22, this, VARIANT, timeoutInSeconds, VARIANT_BOOL.Ptr, &isSuccessful := 0, "HRESULT")
        return isSuccessful
    }

    /**
     * 
     * @param {SERVERXMLHTTP_OPTION} option 
     * @returns {VARIANT} 
     */
    getOption(option) {
        value := VARIANT()
        result := ComCall(23, this, SERVERXMLHTTP_OPTION, option, VARIANT.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {SERVERXMLHTTP_OPTION} option 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setOption(option, value) {
        result := ComCall(24, this, SERVERXMLHTTP_OPTION, option, VARIANT, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServerXMLHTTPRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.setTimeouts := CallbackCreate(GetMethod(implObj, "setTimeouts"), flags, 5)
        this.vtbl.waitForResponse := CallbackCreate(GetMethod(implObj, "waitForResponse"), flags, 3)
        this.vtbl.getOption := CallbackCreate(GetMethod(implObj, "getOption"), flags, 3)
        this.vtbl.setOption := CallbackCreate(GetMethod(implObj, "setOption"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.setTimeouts)
        CallbackFree(this.vtbl.waitForResponse)
        CallbackFree(this.vtbl.getOption)
        CallbackFree(this.vtbl.setOption)
    }
}
