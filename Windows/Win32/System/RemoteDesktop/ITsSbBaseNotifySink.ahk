#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\CLIENT_MESSAGE_TYPE.ahk" { CLIENT_MESSAGE_TYPE }

/**
 * Exposes methods that report status and error messages to Remote Desktop Connection Broker (RD Connection Broker).
 * @remarks
 * Plug-ins can use this interface to report status and error messages to RD Connection Broker.
 * 
 * The RD Connection Broker server and the Remote Desktop Session Host (RD Session Host) server (the redirector) must 
 *     be running Windows Server 2008 R2, and clients must use RDC 7.0.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbbasenotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbBaseNotifySink extends IUnknown {
    /**
     * The interface identifier for ITsSbBaseNotifySink
     * @type {Guid}
     */
    static IID := Guid("{808a6537-1282-4989-9e09-f43938b71722}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbBaseNotifySink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnError        : IntPtr
        OnReportStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbBaseNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports an error condition to Remote Desktop Connection Broker (RD Connection Broker).
     * @remarks
     * Calling this  method stops further processing on the client connection and causes the connection to fail.
     * @param {HRESULT} hrError The error condition.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbbasenotifysink-onerror
     */
    OnError(hrError) {
        result := ComCall(3, this, "int", hrError, "HRESULT")
        return result
    }

    /**
     * Sends status messages to the Remote Desktop Connection (RDC) client regarding the processing of a client connection.
     * @remarks
     * This method allows plug-ins to send more specific status and error messages to the RDC client, overriding the 
     *     default status and error messages that Remote Desktop Connection Broker (RD Connection Broker) sends to the client.
     * 
     * The following error codes are defined by RD Connection Broker for use by plug-ins.
     * @param {CLIENT_MESSAGE_TYPE} messageType 
     * @param {Integer} messageID 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbbasenotifysink-onreportstatus
     */
    OnReportStatus(messageType, messageID) {
        result := ComCall(4, this, CLIENT_MESSAGE_TYPE, messageType, "uint", messageID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbBaseNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnError := CallbackCreate(GetMethod(implObj, "OnError"), flags, 2)
        this.vtbl.OnReportStatus := CallbackCreate(GetMethod(implObj, "OnReportStatus"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnError)
        CallbackFree(this.vtbl.OnReportStatus)
    }
}
