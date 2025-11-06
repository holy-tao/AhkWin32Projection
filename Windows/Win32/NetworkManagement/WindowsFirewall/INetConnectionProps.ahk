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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_guid
     */
    get_Guid() {
        pbstrGuid := BSTR()
        result := ComCall(7, this, "ptr", pbstrGuid, "HRESULT")
        return pbstrGuid
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(8, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR()
        result := ComCall(9, this, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_status
     */
    get_Status() {
        result := ComCall(10, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_mediatype
     */
    get_MediaType() {
        result := ComCall(11, this, "int*", &pMediaType := 0, "HRESULT")
        return pMediaType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnectionprops-get_characteristics
     */
    get_Characteristics() {
        result := ComCall(12, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
