#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides the methods needed to configure the connection settings for the Remote Desktop Protocol (RDP) app container client control.
 * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclientsettings
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IRemoteDesktopClientSettings extends IDispatch {
    /**
     * The interface identifier for IRemoteDesktopClientSettings
     * @type {Guid}
     */
    static IID := Guid("{48a0f2a7-2713-431f-bbac-6f4558e7d64d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDesktopClientSettings interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ApplySettings    : IntPtr
        RetrieveSettings : IntPtr
        GetRdpProperty   : IntPtr
        SetRdpProperty   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDesktopClientSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Stores the specified contents in the RDP file.
     * @param {BSTR} rdpFileContents Specifies the entire contents of the RDP file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-applysettings
     */
    ApplySettings(rdpFileContents) {
        rdpFileContents := rdpFileContents is String ? BSTR.Alloc(rdpFileContents).Value : rdpFileContents

        result := ComCall(7, this, BSTR, rdpFileContents, "HRESULT")
        return result
    }

    /**
     * Retrieves the entire RDP file as a string.
     * @returns {BSTR} The entire contents of the RDP file.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-retrievesettings
     */
    RetrieveSettings() {
        rdpFileContents := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, rdpFileContents, "HRESULT")
        return rdpFileContents
    }

    /**
     * Retrieves a single named RDP property value.
     * @param {BSTR} propertyName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-getrdpproperty
     */
    GetRdpProperty(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        value := VARIANT()
        result := ComCall(9, this, BSTR, propertyName, VARIANT.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Sets the value of a single named RDP property.
     * @param {BSTR} propertyName A string that specifies the name of the property.
     * 
     * <div class="alert"><b>Note</b>  These string values are not case-sensitive.</div>
     * <div> </div>
     * 
     * The possible values are.
     * @param {VARIANT} value The new property value.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientsettings-setrdpproperty
     */
    SetRdpProperty(propertyName, value) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(10, this, BSTR, propertyName, VARIANT, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRemoteDesktopClientSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ApplySettings := CallbackCreate(GetMethod(implObj, "ApplySettings"), flags, 2)
        this.vtbl.RetrieveSettings := CallbackCreate(GetMethod(implObj, "RetrieveSettings"), flags, 2)
        this.vtbl.GetRdpProperty := CallbackCreate(GetMethod(implObj, "GetRdpProperty"), flags, 3)
        this.vtbl.SetRdpProperty := CallbackCreate(GetMethod(implObj, "SetRdpProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ApplySettings)
        CallbackFree(this.vtbl.RetrieveSettings)
        CallbackFree(this.vtbl.GetRdpProperty)
        CallbackFree(this.vtbl.SetRdpProperty)
    }
}
