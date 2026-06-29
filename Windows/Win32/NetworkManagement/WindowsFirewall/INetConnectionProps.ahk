#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\NETCON_MEDIATYPE.ahk" { NETCON_MEDIATYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NETCON_STATUS.ahk" { NETCON_STATUS }

/**
 * Use the INetConnectionProps interface to retrieve the properties for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/nn-netcon-inetconnectionprops
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetConnectionProps extends IDispatch {
    /**
     * The interface identifier for INetConnectionProps
     * @type {Guid}
     */
    static IID := Guid("{f4277c95-ce5b-463d-8167-5662d9bcaa72}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetConnectionProps interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Guid            : IntPtr
        get_Name            : IntPtr
        get_DeviceName      : IntPtr
        get_Status          : IntPtr
        get_MediaType       : IntPtr
        get_Characteristics : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetConnectionProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Guid {
        get => this.get_Guid()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    DeviceName {
        get => this.get_DeviceName()
    }

    /**
     * @type {NETCON_STATUS} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {NETCON_MEDIATYPE} 
     */
    MediaType {
        get => this.get_MediaType()
    }

    /**
     * @type {Integer} 
     */
    Characteristics {
        get => this.get_Characteristics()
    }

    /**
     * The get_Guid method retrieves the globally-unique identifier (GUID) for the connection.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that, on successful return, receives the GUID for the connection.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_guid
     */
    get_Guid() {
        pbstrGuid := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrGuid, "HRESULT")
        return pbstrGuid
    }

    /**
     * The get_Name method retrieves the name of the connection.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that, on successful return, receives the name of the connection.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The get_DeviceName method retrieves the name of the device associated with the connection.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that, on successful return, receives the name of the device associated with the connection.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * The get_Status method retrieves the status of the connection.
     * @returns {NETCON_STATUS} Pointer to a variable of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_status">NETCON_STATUS</a> that, on successful return, receives a code that specifies the status of the connection.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_status
     */
    get_Status() {
        result := ComCall(10, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The get_MediaType method retrieves the media type for the connection.
     * @returns {NETCON_MEDIATYPE} Pointer to a variable of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_mediatype">NETCON_MEDIATYPE</a> that, on successful return, receives a code that specifies the media type for the connection.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_mediatype
     */
    get_MediaType() {
        result := ComCall(11, this, "int*", &pMediaType := 0, "HRESULT")
        return pMediaType
    }

    /**
     * The get_Characteristics method retrieves the media type for the connection.
     * @returns {Integer} Media types as defined by <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_mediatype">NETCON_MEDIATYPE</a>.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_characteristics
     */
    get_Characteristics() {
        result := ComCall(12, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    Query(iid) {
        if (INetConnectionProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Guid := CallbackCreate(GetMethod(implObj, "get_Guid"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_DeviceName := CallbackCreate(GetMethod(implObj, "get_DeviceName"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_MediaType := CallbackCreate(GetMethod(implObj, "get_MediaType"), flags, 2)
        this.vtbl.get_Characteristics := CallbackCreate(GetMethod(implObj, "get_Characteristics"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Guid)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_DeviceName)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_MediaType)
        CallbackFree(this.vtbl.get_Characteristics)
    }
}
