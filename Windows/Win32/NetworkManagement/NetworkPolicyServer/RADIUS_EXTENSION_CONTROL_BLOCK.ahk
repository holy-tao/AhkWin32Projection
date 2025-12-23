#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RADIUS_EXTENSION_CONTROL_BLOCK structure provides information about the current RADIUS request. It also provides functions for obtaining the attributes associated with the request, and for setting the disposition of the request.
 * @remarks
 * The Extension DLL must not modify this structure. Changes to the array of attributes should be made by calling the functions provided as members of this structure.
 * 
 * NPS passes this structure to the Extension DLL when it calls the Extension DLL's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_2">RadiusExtensionProcess2</a>.
 * @see https://learn.microsoft.com/windows/win32/api/authif/ns-authif-radius_extension_control_block
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_EXTENSION_CONTROL_BLOCK extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies the size of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the version of the structure.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies a value of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_extension_point">RADIUS_EXTENSION_POINT</a> that indicates at what point in the request process 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_2">RadiusExtensionProcess2</a> was called.
     * @type {Integer}
     */
    repPoint {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies a value of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_code">RADIUS_CODE</a> that specifies the type of RADIUS request received by the Internet Authentication Service server.
     * @type {Integer}
     */
    rcRequestType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies a value of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ne-authif-radius_code">RADIUS_CODE</a> that indicates the disposition of the RADIUS request.
     * @type {Integer}
     */
    rcResponseType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/ms688263(v=vs.85)">GetRequest</a> function provided by NPS. NPS sets the value of this member.
     * 
     * The 
     * <a href="https://docs.microsoft.com/previous-versions/ms688263(v=vs.85)">GetRequest</a> function returns the attributes received in the RADIUS request process and any internal attributes describing the request state.
     * 
     * The Extension DLL can modify the attributes in the RADIUS request. For example, if NPS is acting as a RADIUS proxy, an Extension DLL could filter which attributes are forwarded to the remote RADIUS server.
     * 
     * To modify the attributes, the Extension DLL uses the functions provided as members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute_array">RADIUS_ATTRIBUTE_ARRAY</a> structure.
     * @type {Pointer}
     */
    GetRequest {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/ms688270(v=vs.85)">GetResponse</a> function provided by NPS. NPS sets the value of this member.
     * 
     * The 
     * <a href="https://docs.microsoft.com/previous-versions/ms688263(v=vs.85)">GetRequest</a> function returns the attributes received in the RADIUS request process and any internal attributes describing the request state.
     * 
     * An Extension DLL can use 
     * <a href="https://docs.microsoft.com/previous-versions/ms688270(v=vs.85)">GetResponse</a> to retrieve and modify the attributes for any valid response type regardless of the request's current disposition. For example, an Extension DLL could 
     * <a href="https://docs.microsoft.com/previous-versions/ms688462(v=vs.85)">set the response type</a> to rcAccessAccept, but still add attributes to those returned in the case of an rcAccessReject. The response specified by the Extension DLL (rcAccessAccept in this example) could be overridden during further processing.
     * 
     * To modify the attributes, the Extension DLL uses the functions provided as members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_attribute_array">RADIUS_ATTRIBUTE_ARRAY</a> structure.
     * @type {Pointer}
     */
    GetResponse {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/ms688462(v=vs.85)">SetResponseType</a> function provided by NPS. NPS sets the value of this member.
     * 
     * The 
     * <a href="https://docs.microsoft.com/previous-versions/ms688462(v=vs.85)">SetResponseType</a> function sets the final disposition of the request.
     * 
     * Note that the disposition set by the Extension DLL can be overridden during further processing. For example, the Extension DLL may set the response type to <b>rcAccessAccept</b>, but during further processing, the response can be changed to <b>rcAccessReject</b>.
     * @type {Pointer}
     */
    SetResponseType {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 48
    }
}
