#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains input data for the ID3D11VideoContext::QueryAuthenticatedChannel method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_QUERY_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A GUID that specifies the query. The following GUIDs are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_ATTRIBUTES"></a><a id="d3d11_authenticated_query_accessibility_attributes"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_ATTRIBUTES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the type of I/O bus that is used to send data to the GPU.
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_output">D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_CHANNEL_TYPE"></a><a id="d3d11_authenticated_query_channel_type"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_CHANNEL_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the type of authenticated channel.
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_channel_type_output">D3D11_AUTHENTICATED_QUERY_CHANNEL_TYPE_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_CRYPTO_SESSION"></a><a id="d3d11_authenticated_query_crypto_session"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_CRYPTO_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns handles to the cryptographic session and Direct3D device that are associated with a specified decoder device.
     * 
     * Input data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_crypto_session_input">D3D11_AUTHENTICATED_QUERY_CRYPTO_SESSION_INPUT</a>
     * 
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_crypto_session_output">D3D11_AUTHENTICATED_QUERY_CRYPTO_SESSION_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_CURRENT_ENCRYPTION_WHEN_ACCESSIBLE"></a><a id="d3d11_authenticated_query_current_encryption_when_accessible"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_CURRENT_ENCRYPTION_WHEN_ACCESSIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the encryption type that is applied before content becomes accessible to the CPU or bus.
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_encryption_guid_count_output">D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_ENCRYPTION_GUID_COUNT_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_DEVICE_HANDLE"></a><a id="d3d11_authenticated_query_device_handle"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_DEVICE_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns a handle to the device that is associated with this authenticated channel.
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_device_handle_output">D3D11_AUTHENTICATED_QUERY_DEVICE_HANDLE_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_ENCRYPTION_WHEN_ACCESSIBLE_GUID"></a><a id="d3d11_authenticated_query_encryption_when_accessible_guid"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_ENCRYPTION_WHEN_ACCESSIBLE_GUID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns one of the encryption types that can be used to encrypt content before it becomes accessible to the CPU or bus.
     * 
     * Input data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_encryption_guid_input">D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_ENCRYPTION_GUID_INPUT</a>
     * 
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_encryption_guid_output">D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_ENCRYPTION_GUID_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_ENCRYPTION_WHEN_ACCESSIBLE_GUID_COUNT"></a><a id="d3d11_authenticated_query_encryption_when_accessible_guid_count"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_ENCRYPTION_WHEN_ACCESSIBLE_GUID_COUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the number of encryption types that can be used to encrypt content before it becomes accessible to the CPU or bus.
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_encryption_guid_count_output">D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_ENCRYPTION_GUID_COUNT_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_OUTPUT_ID"></a><a id="d3d11_authenticated_query_output_id"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_OUTPUT_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns one of the output identifiers that is associated with a specified cryptographic session and Direct3D device.
     * 
     * Input data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_input">D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_INPUT</a>
     * 
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_output">D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_COUNT"></a><a id="d3d11_authenticated_query_output_id_count"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_COUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the number of output identifiers that are associated with a specified cryptographic session and Direct3D device.
     * 
     * Input data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_count_input">D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_COUNT_INPUT</a>
     * 
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_count_output">D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_COUNT_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_PROTECTION"></a><a id="d3d11_authenticated_query_protection"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_PROTECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the current protection level for the device.
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_protection_output">D3D11_AUTHENTICATED_QUERY_PROTECTION_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS"></a><a id="d3d11_authenticated_query_restricted_shared_resource_process"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns information about a process that is allowed to open shared resources with restricted access.
     * 
     * Input data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_input">D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_INPUT</a>
     * 
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_output">D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_COUNT"></a><a id="d3d11_authenticated_query_restricted_shared_resource_process_count"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_COUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the number of processes that are allowed to open shared resources with restricted access.
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_count_output">D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_COUNT_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_AUTHENTICATED_QUERY_UNRESTRICTED_PROTECTED_SHARED_RESOURCE_COUNT"></a><a id="d3d11_authenticated_query_unrestricted_protected_shared_resource_count"></a><dl>
     * <dt><b>D3D11_AUTHENTICATED_QUERY_UNRESTRICTED_PROTECTED_SHARED_RESOURCE_COUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the number of protected shared resources that can be opened by any process with no restrictions.
     * 
     * Output data structure: <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_unrestricted_protected_shared_resource_count_output">D3D11_AUTHENTICATED_QUERY_UNRESTRICTED_PROTECTED_SHARED_RESOURCE_COUNT_OUTPUT</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Guid>}
     */
    QueryType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A handle to the authenticated channel. To get the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11authenticatedchannel-getchannelhandle">ID3D11AuthenticatedChannel::GetChannelHandle</a> method.
     * @type {HANDLE}
     */
    hChannel{
        get {
            if(!this.HasProp("__hChannel"))
                this.__hChannel := HANDLE(8, this)
            return this.__hChannel
        }
    }

    /**
     * The query sequence number. At the start of the session, generate a cryptographically secure 32-bit random number to use as the starting sequence number. For each query, increment the sequence number by 1.
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
