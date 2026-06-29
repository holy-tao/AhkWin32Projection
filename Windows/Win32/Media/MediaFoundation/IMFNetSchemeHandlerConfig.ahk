#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MFNETSOURCE_PROTOCOL_TYPE.ahk" { MFNETSOURCE_PROTOCOL_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures a network scheme plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfnetschemehandlerconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFNetSchemeHandlerConfig extends IUnknown {
    /**
     * The interface identifier for IMFNetSchemeHandlerConfig
     * @type {Guid}
     */
    static IID := Guid("{7be19e73-c9bf-468a-ac5a-a5e8653bec87}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFNetSchemeHandlerConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNumberOfSupportedProtocols : IntPtr
        GetSupportedProtocolType      : IntPtr
        ResetProtocolRolloverSettings : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFNetSchemeHandlerConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of protocols supported by the network scheme plug-in.
     * @returns {Integer} Receives the number of protocols.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetschemehandlerconfig-getnumberofsupportedprotocols
     */
    GetNumberOfSupportedProtocols() {
        result := ComCall(3, this, "uint*", &pcProtocols := 0, "HRESULT")
        return pcProtocols
    }

    /**
     * Retrieves a supported protocol by index.
     * @param {Integer} nProtocolIndex Zero-based index of the protocol to retrieve. To get the number of supported protocols, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfnetschemehandlerconfig-getnumberofsupportedprotocols">IMFNetSchemeHandlerConfig::GetNumberOfSupportedProtocols</a>.
     * @returns {MFNETSOURCE_PROTOCOL_TYPE} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfnetsource_protocol_type">MFNETSOURCE_PROTOCOL_TYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetschemehandlerconfig-getsupportedprotocoltype
     */
    GetSupportedProtocolType(nProtocolIndex) {
        result := ComCall(4, this, "uint", nProtocolIndex, "int*", &pnProtocolType := 0, "HRESULT")
        return pnProtocolType
    }

    /**
     * Not implemented in this release. (IMFNetSchemeHandlerConfig.ResetProtocolRolloverSettings)
     * @returns {HRESULT} This method returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetschemehandlerconfig-resetprotocolrolloversettings
     */
    ResetProtocolRolloverSettings() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFNetSchemeHandlerConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNumberOfSupportedProtocols := CallbackCreate(GetMethod(implObj, "GetNumberOfSupportedProtocols"), flags, 2)
        this.vtbl.GetSupportedProtocolType := CallbackCreate(GetMethod(implObj, "GetSupportedProtocolType"), flags, 3)
        this.vtbl.ResetProtocolRolloverSettings := CallbackCreate(GetMethod(implObj, "ResetProtocolRolloverSettings"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNumberOfSupportedProtocols)
        CallbackFree(this.vtbl.GetSupportedProtocolType)
        CallbackFree(this.vtbl.ResetProtocolRolloverSettings)
    }
}
