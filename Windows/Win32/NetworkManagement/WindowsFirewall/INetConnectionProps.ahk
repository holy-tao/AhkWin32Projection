#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the INetConnectionProps interface to retrieve the properties for a connection.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetconnectionprops
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetConnectionProps extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetConnectionProps
     * @type {Guid}
     */
    static IID => Guid("{f4277c95-ce5b-463d-8167-5662d9bcaa72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Guid", "get_Name", "get_DeviceName", "get_Status", "get_MediaType", "get_Characteristics"]

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
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetconnectionprops-get_guid
     */
    get_Guid() {
        pbstrGuid := BSTR()
        result := ComCall(7, this, "ptr", pbstrGuid, "HRESULT")
        return pbstrGuid
    }

    /**
     * The get_Name method retrieves the name of the connection.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that, on successful return, receives the name of the connection.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetconnectionprops-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(8, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The get_DeviceName method retrieves the name of the device associated with the connection.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that, on successful return, receives the name of the device associated with the connection.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetconnectionprops-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR()
        result := ComCall(9, this, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * The get_Status method retrieves the status of the connection.
     * @returns {Integer} Pointer to a variable of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_status">NETCON_STATUS</a> that, on successful return, receives a code that specifies the status of the connection.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetconnectionprops-get_status
     */
    get_Status() {
        result := ComCall(10, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The get_MediaType method retrieves the media type for the connection.
     * @returns {Integer} Pointer to a variable of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_mediatype">NETCON_MEDIATYPE</a> that, on successful return, receives a code that specifies the media type for the connection.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetconnectionprops-get_mediatype
     */
    get_MediaType() {
        result := ComCall(11, this, "int*", &pMediaType := 0, "HRESULT")
        return pMediaType
    }

    /**
     * The get_Characteristics method retrieves the media type for the connection.
     * @returns {Integer} Media types as defined by <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_mediatype">NETCON_MEDIATYPE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetconnectionprops-get_characteristics
     */
    get_Characteristics() {
        result := ComCall(12, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
