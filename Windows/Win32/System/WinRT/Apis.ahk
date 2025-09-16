#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class WinRT {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ERROR_MESSAGE_CHARS => 512

    /**
     * @type {String}
     */
    static CastingSourceInfo_Property_PreferredSourceUriScheme => "PreferredSourceUriScheme"

    /**
     * @type {String}
     */
    static CastingSourceInfo_Property_CastingTypes => "CastingTypes"

    /**
     * @type {String}
     */
    static CastingSourceInfo_Property_ProtectedMedia => "ProtectedMedia"
;@endregion Constants

;@region Methods
    /**
     * Locates the implementation of a Component Object Model (COM) interface in a server process given an interface to a proxied object.
     * @remarks
     * The <b>CoDecodeProxy</b> function is a COM API that enables native debuggers to locate the implementation of a COM interface in a server process given an interface on a proxy to the object.
     * 
     * 
     * Also, the <b>CoDecodeProxy</b> function enables the debugger to monitor cross-apartment function calls and fail such calls when appropriate.
     * 
     * You can call the <b>CoDecodeProxy</b> function from a 32-bit or 64-bit process. <i>ui64ProxyAddress</i> can be a 32-bit or 64-bit address. The <b>CoDecodeProxy</b> function returns a 32-bit or 64-bit address in the <i>pServerInformation</i> field. If it returns a 64-bit address, you should pass the address to the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-readprocessmemory">ReadProcessMemory</a> function only from a 64-bit process.
     * @param {Integer} dwClientPid The process ID of the process that contains the proxy.
     * @param {Integer} ui64ProxyAddress The address of an interface on a proxy to the object.  <i>ui64ProxyAddress</i> is considered a 64-bit value type, rather than a pointer  to a 64-bit value, and isn't a pointer to an object in the debugger process. Instead, this address is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-readprocessmemory">ReadProcessMemory</a> function.
     * @param {Pointer<ServerInformation>} pServerInformation A structure that contains the process ID, the thread ID, and the address of the server.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server information was successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is an app container, or the developer license is not installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_INVALID_IPID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ui64ProxyAddress</i> does not point to a proxy.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-codecodeproxy
     */
    static CoDecodeProxy(dwClientPid, ui64ProxyAddress, pServerInformation) {
        result := DllCall("OLE32.dll\CoDecodeProxy", "uint", dwClientPid, "uint", ui64ProxyAddress, "ptr", pServerInformation, "int")
        return result
    }

    /**
     * Creates an agile reference for an object specified by the given interface.
     * @remarks
     * Call the <b>RoGetAgileReference</b> function on an existing object to request an agile reference to the object. The object may or may not be agile, but the returned <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iagilereference">IAgileReference</a> is agile. The agile reference can be passed to another apartment within the same process, where the original object is retrieved by using the <b>IAgileReference</b> interface.
     * 
     * This is conceptually similar to the existing Global Interface Table (GIT). Rather than interacting with the GIT, an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iagilereference">IAgileReference</a> is obtained and used to retrieve the object directly. Just as the GIT is per-process only, agile references are per-process and can't be marshaled.
     * 
     * The agile reference feature provides a performance improvement over the GIT. The agile reference performs eager marshaling by default, which saves a cross-apartment call in cases where the object is retrieved from the agile reference in an apartment that's different from where the agile reference was created. For additional performance improvement, users of the <b>RoGetAgileReference</b> function can use the same interface to create an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iagilereference">IAgileReference</a> and resolve the original object. This saves an additional <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call to obtain the desired interface from the resolved object.
     * 
     * For example, you have a non-agile object named CDemoExample, which implements the IDemo and IExample interfaces. Call the <b>RoGetAgileReference</b> function and pass the object, with IID_IDemo. You get back an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iagilereference">IAgileReference</a> interface pointer, which is agile, so you can pass it to a different apartment. In the other apartment, call the <a href="https://docs.microsoft.com/windows/desktop/WinRT/iagilereference-resolve">Resolve</a> method, with IID_IExample. You get back an IExample pointer that you can use within this apartment. This IExample pointer is an IExample proxy that's connected to the original CDemoExample object. The agile reference handles the complexity of operations like manually marshaling to a stream and unmarshaling on the other side of the apartment boundary.
     * @param {Integer} options The registration options.
     * @param {Pointer<Guid>} riid The interface ID of the object for which an agile reference is being obtained.
     * @param {Pointer<IUnknown>} pUnk Pointer to the interface to be encapsulated in an agile reference. It must be the same type as <i>riid</i>. It may be a pointer to an in-process object or a pointer to a proxy of an object.
     * @param {Pointer<IAgileReference>} ppAgileReference The agile reference for the object. Call the <a href="https://docs.microsoft.com/windows/desktop/WinRT/iagilereference-resolve">Resolve</a> method to localize the object into the apartment in which <b>Resolve</b> is called.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_INVALIDARG</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>options</i> parameter in invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_OUTOFMEMORY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The agile reference couldn't be constructed due to an out-of-memory condition.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_NOINTERFACE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pUnk</i> parameter doesn't support the interface ID specified by the <i>riid</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>CO_E_NOT_SUPPORTED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object implements the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-inomarshal">INoMarshal</a> interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-rogetagilereference
     * @since windows8.1
     */
    static RoGetAgileReference(options, riid, pUnk, ppAgileReference) {
        result := DllCall("OLE32.dll\RoGetAgileReference", "int", options, "ptr", riid, "ptr", pUnk, "ptr", ppAgileReference, "int")
        return result
    }

    /**
     * The HSTRING_UserSize function calculates the wire size of the HSTRING object, and retrieves its handle and data. (HSTRING_UserSize)
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HSTRING>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/remotesystemadditionalinfo/nf-remotesystemadditionalinfo-hstring_usersize
     * @since windows8.0
     */
    static HSTRING_UserSize(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserSize", "ptr", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The HSTRING_UserMarshal function marshals an HSTRING object into the RPC buffer. (HSTRING_UserMarshal)
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HSTRING>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/remotesystemadditionalinfo/nf-remotesystemadditionalinfo-hstring_usermarshal
     * @since windows8.0
     */
    static HSTRING_UserMarshal(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserMarshal", "ptr", param0, "ptr", param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HSTRING_UserUnmarshal function unmarshals an HSTRING object from the RPC buffer. (HSTRING_UserUnmarshal)
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HSTRING>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for this function to perform.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/remotesystemadditionalinfo/nf-remotesystemadditionalinfo-hstring_userunmarshal
     * @since windows8.0
     */
    static HSTRING_UserUnmarshal(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserUnmarshal", "ptr", param0, "ptr", param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HSTRING_UserFree function frees resources on the server side when called by RPC stub files. (HSTRING_UserFree)
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HSTRING>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/remotesystemadditionalinfo/nf-remotesystemadditionalinfo-hstring_userfree
     * @since windows8.0
     */
    static HSTRING_UserFree(param0, param1) {
        DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserFree", "ptr", param0, "ptr", param1)
    }

    /**
     * The HSTRING_UserSize64 function calculates the wire size of the HSTRING object, and retrieves its handle and data. (HSTRING_UserSize64)
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<HSTRING>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/remotesystemadditionalinfo/nf-remotesystemadditionalinfo-hstring_usersize64
     * @since windows8.0
     */
    static HSTRING_UserSize64(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserSize64", "ptr", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * The HSTRING_UserMarshal64 function marshals an HSTRING object into the RPC buffer. (HSTRING_UserMarshal64)
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HSTRING>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/remotesystemadditionalinfo/nf-remotesystemadditionalinfo-hstring_usermarshal64
     * @since windows8.0
     */
    static HSTRING_UserMarshal64(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserMarshal64", "ptr", param0, "ptr", param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HSTRING_UserUnmarshal64 function unmarshals an HSTRING object from the RPC buffer. (HSTRING_UserUnmarshal64)
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<HSTRING>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for this function to perform.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/remotesystemadditionalinfo/nf-remotesystemadditionalinfo-hstring_userunmarshal64
     * @since windows8.0
     */
    static HSTRING_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserUnmarshal64", "ptr", param0, "ptr", param1, "ptr", param2, "ptr")
        return result
    }

    /**
     * The HSTRING_UserFree64 function frees resources on the server side when called by RPC stub files. (HSTRING_UserFree64)
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<HSTRING>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/remotesystemadditionalinfo/nf-remotesystemadditionalinfo-hstring_userfree64
     * @since windows8.0
     */
    static HSTRING_UserFree64(param0, param1) {
        DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserFree64", "ptr", param0, "ptr", param1)
    }

    /**
     * Creates a new HSTRING based on the specified source string.
     * @remarks
     * Use the <b>WindowsCreateString</b> function to allocate a new [**HSTRING**](/windows/win32/winrt/hstring). The Windows Runtime copies <i>string</i> to the backing buffer of the new <b>HSTRING</b> and   manages the buffer lifetime by using a reference count. Call the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowscreatestringreference">WindowsCreateStringReference</a> function to create a <i>fast-pass string</i>, which uses an existing string without copying it. 
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> function to de-allocate the [**HSTRING**](/windows/win32/winrt/hstring). Each call to the <b>WindowsCreateString</b> function must be matched by a call to  <b>WindowsDeleteString</b>. 
     * 
     * To create a new, empty, or <b>NULL</b> string, pass <b>NULL</b> for <i>sourceString</i> and 0 for <i>length</i>.
     * 
     * If <i>sourceString</i> has embedded null characters, the <b>WindowsCreateString</b> function copies all characters to the terminating null character.
     * @param {Pointer<PWSTR>} sourceString Type: [in, optional] <b>LPCWSTR</b>
     * 
     * A null-terminated string to use as the source for the new [**HSTRING**](/windows/win32/winrt/hstring). To create a new, empty, or <b>NULL</b> string, pass <b>NULL</b> for <i>sourceString</i> and 0 for <i>length</i>.
     * @param {Integer} length Type: [in] <b>UINT32</b>
     * 
     * The length of <i>sourceString</i>, in Unicode characters. Must be 0 if <i>sourceString</i> is <b>NULL</b>.
     * @param {Pointer<HSTRING>} string Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A pointer to the newly created [**HSTRING**](/windows/win32/winrt/hstring), or <b>NULL</b> if an error occurs. Any existing  content in <i>string</i> is overwritten. The <b>HSTRING</b> is a standard handle type.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  [**HSTRING**](/windows/win32/winrt/hstring) was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>string</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the new [**HSTRING**](/windows/win32/winrt/hstring).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>sourceString</i> is <b>NULL</b> and <i>length</i> is non-zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowscreatestring
     * @since windows8.0
     */
    static WindowsCreateString(sourceString, length, string) {
        sourceString := sourceString is String? StrPtr(sourceString) : sourceString

        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsCreateString", "ptr", sourceString, "uint", length, "ptr", string, "int")
        return result
    }

    /**
     * Creates a new string reference based on the specified string.
     * @remarks
     * Use the <b>WindowsCreateStringReference</b> function to create an [**HSTRING**](/windows/win32/winrt/hstring) from an existing string. This kind of <b>HSTRING</b> is named a <i>fast-pass string</i>. Unlike an <b>HSTRING</b> created by the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowscreatestring">WindowsCreateString</a> function, the lifetime of the backing buffer in the new <b>HSTRING</b> is  not managed by the Windows Runtime.  The caller allocates <i>sourceString</i> on the  stack frame, together with an uninitialized <a href="https://docs.microsoft.com/windows/desktop/api/hstring/ns-hstring-hstring_header">HSTRING_HEADER</a>, to avoid a heap allocation and eliminate the risk of a memory leak. The caller must ensure that <i>sourceString</i> and the contents of <i>hstringHeader</i> remain unchanged during the lifetime of the attached <b>HSTRING</b>.
     * 
     * You don't need to call the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> function to de-allocate a fast-pass [**HSTRING**](/windows/win32/winrt/hstring) created by the <b>WindowsCreateStringReference</b> function.
     * 
     * To create an empty [**HSTRING**](/windows/win32/winrt/hstring), pass <b>NULL</b> for <i>sourceString</i> and 0 for <i>length</i>. 
     * 
     * The Windows Runtime tracks a fast-pass string by using an <a href="https://docs.microsoft.com/windows/desktop/api/hstring/ns-hstring-hstring_header">HSTRING_HEADER</a> structure, which is returned in the <i>hstringHeader</i> out parameter. Do not change the contents of the <b>HSTRING_HEADER</b>.
     * @param {Pointer<PWSTR>} sourceString Type: [in] <b>PCWSTR</b>
     * 
     * A null-terminated string to use as the source for the new [**HSTRING**](/windows/win32/winrt/hstring).
     * 
     * A value of <b>NULL</b> represents the empty string, if the value of <i>length</i> is 0. Should be allocated on the stack frame.
     * @param {Integer} length Type: [in] <b>UINT32</b>
     * 
     * The length of <i>sourceString</i>, in Unicode characters. Must be 0 if <i>sourceString</i> is <b>NULL</b>. If greater than 0, <i>sourceString</i> must have a terminating null character.
     * @param {Pointer<HSTRING_HEADER>} hstringHeader Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/api/hstring/ns-hstring-hstring_header">HSTRING_HEADER</a>*</b>
     * 
     * A pointer to a structure that the Windows Runtime uses to identify <i>string</i> as a string reference, or fast-pass string.
     * @param {Pointer<HSTRING>} string Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A pointer to the newly created string, or <b>NULL</b> if an error occurs. Any existing  content in <i>string</i> is overwritten. The [**HSTRING**](/windows/win32/winrt/hstring) is a standard handle type.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  [**HSTRING**](/windows/win32/winrt/hstring) was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>string</i> or <i>hstringHeader</i>  is <b>NULL</b>, or <i>string</i> is not null-terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the new [**HSTRING**](/windows/win32/winrt/hstring).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>sourceString</i> is <b>NULL</b> and <i>length</i> is non-zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowscreatestringreference
     * @since windows8.0
     */
    static WindowsCreateStringReference(sourceString, length, hstringHeader, string) {
        sourceString := sourceString is String? StrPtr(sourceString) : sourceString

        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsCreateStringReference", "ptr", sourceString, "uint", length, "ptr", hstringHeader, "ptr", string, "int")
        return result
    }

    /**
     * Decrements the reference count of a string buffer.
     * @remarks
     * Use the <b>WindowsDeleteString</b> function to de-allocate an [**HSTRING**](/windows/win32/winrt/hstring). Calling <b>WindowsDeleteString</b> decrements the reference count of the backing buffer, and if the reference count reaches 0, the Windows Runtime de-allocates the buffer.
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be deleted. If <i>string</i> is a fast-pass string created by <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowscreatestringreference">WindowsCreateStringReference</a>, or if <i>string</i> is <b>NULL</b> or empty, no action is taken and <b>S_OK</b> is returned.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function always returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsdeletestring
     * @since windows8.0
     */
    static WindowsDeleteString(string) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsDeleteString", "ptr", string, "int")
        return result
    }

    /**
     * Creates a copy of the specified string.
     * @remarks
     * Use the <b>WindowsDuplicateString</b>  function to copy an [**HSTRING**](/windows/win32/winrt/hstring). If <i>string</i> was created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowscreatestring">WindowsCreateString</a> function, the reference count of the backing buffer is incremented. If <i>string</i> was created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowscreatestringreference">WindowsCreateStringReference</a> function,  the Windows Runtime copies its source string to a new buffer and starts a reference count, which means that  <i>newString</i> is not a fast-pass string. 
     * 
     * Each call to the <b>WindowsDuplicateString</b> function must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>.
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be copied.
     * @param {Pointer<HSTRING>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A copy of <i>string</i>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  [**HSTRING**](/windows/win32/winrt/hstring) was copied successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>newString</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the new [**HSTRING**](/windows/win32/winrt/hstring).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsduplicatestring
     * @since windows8.0
     */
    static WindowsDuplicateString(string, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsDuplicateString", "ptr", string, "ptr", newString, "int")
        return result
    }

    /**
     * Gets the length, in Unicode characters, of the specified string.
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string whose length is to be found.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of Unicode characters in <i>string</i>, including embedded null characters, but excluding the terminating null; or 0 if <i>string</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsgetstringlen
     * @since windows8.0
     */
    static WindowsGetStringLen(string) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsGetStringLen", "ptr", string, "uint")
        return result
    }

    /**
     * Retrieves the backing buffer for the specified string.
     * @remarks
     * Use the <b>WindowsGetStringRawBuffer</b> function to obtain a pointer to the backing buffer of an[**HSTRING**](/windows/win32/winrt/hstring).
     * 
     * Don't change the contents of the buffer&mdash;an [**HSTRING**](/windows/win32/winrt/hstring) is required to be immutable.
     * @param {Pointer<HSTRING>} string Type: [in, optional] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * An optional string for which the backing buffer is to be retrieved. Can be **NULL**.
     * @param {Pointer<UInt32>} length Type: [out, optional] **UINT32 \***
     * 
     * An optional pointer to a **UINT32**. If **NULL** is passed for *length*, then it is ignored. If *length* is a valid pointer to a **UINT32**, and *string* is a valid [**HSTRING**](/windows/win32/winrt/hstring), then on successful completion the function sets the value pointed to by *length* to the number of Unicode characters in the backing buffer for *string* (including embedded null characters, but excluding the terminating null). If *length* is a valid pointer to a **UINT32**, and *string* is **NULL**, then the value pointed to by *length* is set to 0.
     * @returns {Pointer<PWSTR>} Type: <b>PCWSTR</b>
     * 
     * A pointer to the buffer that provides the backing store for <i>string</i>, or the empty string if <i>string</i> is <b>NULL</b> or the empty string.
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsgetstringrawbuffer
     * @since windows8.0
     */
    static WindowsGetStringRawBuffer(string, length) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsGetStringRawBuffer", "ptr", string, "ptr", length, "ptr")
        return result
    }

    /**
     * Indicates whether the specified string is the empty string.
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be tested for content.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if <i>string</i> is <b>NULL</b> or the empty string; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsisstringempty
     * @since windows8.0
     */
    static WindowsIsStringEmpty(string) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsIsStringEmpty", "ptr", string, "int")
        return result
    }

    /**
     * Indicates whether the specified string has embedded null characters.
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to test for embedded null characters.
     * @param {Pointer<Int32>} hasEmbedNull Type: [out] <b>BOOL*</b>
     * 
     * <b>TRUE</b> if <i>string</i> has one or more embedded null characters; otherwise, <b>FALSE</b>. <b>FALSE</b> if  <i>string</i> is <b>NULL</b> or the empty string.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The test completed  successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hasEmbedNull</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsstringhasembeddednull
     * @since windows8.0
     */
    static WindowsStringHasEmbeddedNull(string, hasEmbedNull) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsStringHasEmbeddedNull", "ptr", string, "ptr", hasEmbedNull, "int")
        return result
    }

    /**
     * Compares two specified HSTRING objects and returns an integer that indicates their relative position in a sort order.
     * @remarks
     * Use the <b>WindowsCompareStringOrdinal</b> function to compare two [**HSTRING**](/windows/win32/winrt/hstring) objects. After the comparison completes, the  <i>result</i> out parameter contains one of three values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Condition</th>
     * </tr>
     * <tr>
     * <td>-1</td>
     * <td><i>string1</i> is less than <i>string2</i>.</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td><i>string1</i> equals <i>string2</i>.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td><i>string1</i> is greater than <i>string2</i>.</td>
     * </tr>
     * </table>
     * @param {Pointer<HSTRING>} string1 Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The first string to compare.
     * @param {Pointer<HSTRING>} string2 Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The second string to compare.
     * @param {Pointer<Int32>} result Type: [out] <b>INT32*</b>
     * 
     * A value that indicates the lexical relationship between <i>string1</i> and <i>string2</i>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  comparison was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>result</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowscomparestringordinal
     * @since windows8.0
     */
    static WindowsCompareStringOrdinal(string1, string2, result) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsCompareStringOrdinal", "ptr", string1, "ptr", string2, "ptr", result, "int")
        return result
    }

    /**
     * Retrieves a substring from the specified string. The substring starts at the specified character position.
     * @remarks
     * Each call to the <b>WindowsSubstring</b> function must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>.
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The original string.
     * @param {Integer} startIndex Type: [in] <b>UINT32</b>
     * 
     * The zero-based starting character position of a substring in this instance.
     * @param {Pointer<HSTRING>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A string that is equivalent to the substring that begins at <i>startIndex</i> in <i>string</i>, or <b>NULL</b> if <i>startIndex</i> is equal to the length of <i>string</i>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  substring was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>newString</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BOUNDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>startIndex</i> is greater than the length of <i>string</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the new substring.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowssubstring
     * @since windows8.0
     */
    static WindowsSubstring(string, startIndex, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsSubstring", "ptr", string, "uint", startIndex, "ptr", newString, "int")
        return result
    }

    /**
     * Retrieves a substring from the specified string. The substring starts at a specified character position and has a specified length.
     * @remarks
     * Each call to the <b>WindowsSubstringWithSpecifiedLength</b> function must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>.
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The original string.
     * @param {Integer} startIndex Type: [in] <b>UINT32</b>
     * 
     * The zero-based starting character position of a substring in this instance.
     * @param {Integer} length Type: [in] <b>UINT32</b>
     * 
     * The number of characters in the substring.
     * @param {Pointer<HSTRING>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A string that is equivalent to the substring that begins at <i>startIndex</i> in <i>string</i>, or <b>NULL</b> if <i>startIndex</i> is equal to the length of <i>string</i>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  substring was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>newString</i> is <b>NULL</b>, or <i>startIndex</i> plus <i>length</i> is greater than <b>MAXUINT32</b>, which is  4,294,967,295; that is, hexadecimal 0xFFFFFFFF.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_BOUNDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>startIndex</i> is greater than the length of <i>string</i>, or <i>startIndex</i> plus <i>length</i> indicates a position not within  <i>string</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the new substring.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowssubstringwithspecifiedlength
     * @since windows8.0
     */
    static WindowsSubstringWithSpecifiedLength(string, startIndex, length, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsSubstringWithSpecifiedLength", "ptr", string, "uint", startIndex, "uint", length, "ptr", newString, "int")
        return result
    }

    /**
     * Concatenates two specified strings.
     * @remarks
     * Each call to the <b>WindowsConcatString</b> function must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>.
     * @param {Pointer<HSTRING>} string1 Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The first string to be concatenated.
     * @param {Pointer<HSTRING>} string2 Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The second string to be concatenated.
     * @param {Pointer<HSTRING>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * The concatenation of <i>string1</i> and <i>string2</i>. If <i>string1</i> and <i>string2</i> are <b>NULL</b>, <i>newString</i> is <b>NULL</b>. If either <i>string1</i> or <i>string2</i> is <b>NULL</b>, <i>newString</i> is a copy of the non-null string.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  concatenated string was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>newString</i> is <b>NULL</b>, or the length of <i>string1</i> plus the length of <i>string2</i> is greater than <b>MAXUINT32</b>, which is  4,294,967,295; that is, hexadecimal 0xFFFFFFFF.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the concatenated string.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsconcatstring
     * @since windows8.0
     */
    static WindowsConcatString(string1, string2, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsConcatString", "ptr", string1, "ptr", string2, "ptr", newString, "int")
        return result
    }

    /**
     * Replaces all occurrences of a set of characters in the specified string with another set of characters to create a new string.
     * @remarks
     * Each call to the <b>WindowsReplaceString</b> function must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>.
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The original string.
     * @param {Pointer<HSTRING>} stringReplaced Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be replaced.
     * @param {Pointer<HSTRING>} stringReplaceWith Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to replace all occurrences of <i>stringReplaced</i>. 
     * If this parameter is <b>NULL</b>, all instances of <i>stringReplaced</i> are removed.
     * @param {Pointer<HSTRING>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A string that is equivalent to the original, except that all instances of <i>stringReplaced</i> are replaced with <i>stringReplaceWith</i>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  string replacement was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>newString</i> is <b>NULL</b>, <i>stringReplaced</i> is empty, or the length of <i>string1</i> plus the length of <i>string2</i> is greater than <b>MAXUINT32</b>, which is  4,294,967,295; that is, hexadecimal 0xFFFFFFFF. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the new string.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsreplacestring
     * @since windows8.0
     */
    static WindowsReplaceString(string, stringReplaced, stringReplaceWith, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsReplaceString", "ptr", string, "ptr", stringReplaced, "ptr", stringReplaceWith, "ptr", newString, "int")
        return result
    }

    /**
     * Removes all leading occurrences of a specified set of characters from the source string.
     * @remarks
     * Each call to the <b>WindowsTrimStringStart</b> function must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be trimmed.
     * @param {Pointer<HSTRING>} trimString Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The characters to remove from <i>string</i>.
     * @param {Pointer<HSTRING>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * The string that remains after all occurrences of characters in the <i>trimString</i> parameter are removed from the start of <i>string</i>, or <b>NULL</b> if <i>trimString</i> contains all of the characters in <i>string</i>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  trimmed string was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>newString</i> is <b>NULL</b>, or <i>trimString</i> is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the trimmed string.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowstrimstringstart
     * @since windows8.0
     */
    static WindowsTrimStringStart(string, trimString, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsTrimStringStart", "ptr", string, "ptr", trimString, "ptr", newString, "int")
        return result
    }

    /**
     * Removes all trailing occurrences of a specified set of characters from the source string.
     * @remarks
     * Each call to the <b>WindowsTrimStringEnd</b> function must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>.
     * @param {Pointer<HSTRING>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be trimmed.
     * @param {Pointer<HSTRING>} trimString Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The characters to remove from <i>string</i>.
     * @param {Pointer<HSTRING>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * The string that remains after all occurrences of characters in the <i>trimString</i> parameter are removed from the end of <i>string</i>, or <b>NULL</b> if <i>trimString</i> contains all of the characters in <i>string</i>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  trimmed string was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>newString</i> is <b>NULL</b>, or <i>trimString</i> is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the trimmed string.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowstrimstringend
     * @since windows8.0
     */
    static WindowsTrimStringEnd(string, trimString, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsTrimStringEnd", "ptr", string, "ptr", trimString, "ptr", newString, "int")
        return result
    }

    /**
     * Allocates a mutable character buffer for use in HSTRING creation.
     * @remarks
     * Use the <b>WindowsPreallocateStringBuffer</b> function to create a mutable character buffer that you can manipulate prior to committing it to  an immutable [**HSTRING**](/windows/win32/winrt/hstring). When you have finished populating the <i>mutableBuffer</i> with your string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspromotestringbuffer">WindowsPromoteStringBuffer</a>  function with the <i>bufferHandle</i> parameter  to create the <b>HSTRING</b>. You must write exactly <i>length</i> characters into the buffer.
     * <b>Windows 10 Version 1803, Windows Server Version 1803, and later</b>: You are permitted to write a null terminator after <i>length</i> characters.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestringbuffer">WindowsDeleteStringBuffer</a> function to discard the mutable buffer prior to promotion. If the buffer has already been promoted by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspromotestringbuffer">WindowsPromoteStringBuffer</a>, call the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> function to discard the string. If the <b>WindowsPromoteStringBuffer</b> call fails, you can call the <b>WindowsDeleteStringBuffer</b> function to discard the mutable buffer.
     * @param {Integer} length Type: [in] <b>UINT32</b>
     * 
     * The size of the buffer to allocate. A value of zero corresponds to the empty string.
     * @param {Pointer<UInt16>} charBuffer Type: [out] <b>WCHAR**</b>
     * 
     * The mutable buffer that holds the characters. Note that the buffer already contains a terminating <b>NULL</b> character.
     * @param {Pointer<HSTRING_BUFFER>} bufferHandle Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring-buffer">HSTRING_BUFFER</a>*</b>
     * 
     * The preallocated string buffer, or <b>NULL</b> if  <i>length</i> is 0.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  [**HSTRING**](/windows/win32/winrt/hstring) was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>mutableBuffer</i> or <i>bufferHandle</i>  is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MEM_E_INVALID_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested [**HSTRING**](/windows/win32/winrt/hstring) allocation size is too large.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the [**HSTRING**](/windows/win32/winrt/hstring) buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowspreallocatestringbuffer
     * @since windows8.0
     */
    static WindowsPreallocateStringBuffer(length, charBuffer, bufferHandle) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsPreallocateStringBuffer", "uint", length, "ptr", charBuffer, "ptr", bufferHandle, "int")
        return result
    }

    /**
     * Creates an HSTRING from the specified HSTRING_BUFFER.
     * @remarks
     * Use the <b>WindowsPromoteStringBuffer</b> function to create a new [**HSTRING**](/windows/win32/winrt/hstring) from an <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring-buffer">HSTRING_BUFFER</a>. Calling the <b>WindowsPromoteStringBuffer</b> function converts the mutable    buffer to an immutable <b>HSTRING</b>. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspreallocatestringbuffer">WindowsPreallocateStringBuffer</a> function to create the <b>HSTRING_BUFFER</b>.
     * 
     * If the <b>WindowsPromoteStringBuffer</b> call fails, you can call the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestringbuffer">WindowsDeleteStringBuffer</a> function to discard the mutable buffer.
     * 
     * Each call to the <b>WindowsPromoteStringBuffer</b> function must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>.
     * @param {Pointer<HSTRING_BUFFER>} bufferHandle Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring-buffer">HSTRING_BUFFER</a></b>
     * 
     * The buffer to use for the new [**HSTRING**](/windows/win32/winrt/hstring). You must use the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspreallocatestringbuffer">WindowsPreallocateStringBuffer</a> function to create the <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring-buffer">HSTRING_BUFFER</a>.
     * @param {Pointer<HSTRING>} string Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * The newly created [**HSTRING**](/windows/win32/winrt/hstring) that contains the contents of <i>bufferHandle</i>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  [**HSTRING**](/windows/win32/winrt/hstring) was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>string</i>  is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>bufferHandle</i> was not created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspreallocatestringbuffer">WindowsPreallocateStringBuffer</a> function, or the caller has overwritten the   terminating NUL character in  <i>bufferHandle</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowspromotestringbuffer
     * @since windows8.0
     */
    static WindowsPromoteStringBuffer(bufferHandle, string) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsPromoteStringBuffer", "ptr", bufferHandle, "ptr", string, "int")
        return result
    }

    /**
     * Discards a preallocated string buffer if it was not promoted to an HSTRING.
     * @remarks
     * Use the <b>WindowsDeleteStringBuffer</b> function to discard a string buffer that was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspreallocatestringbuffer">WindowsPreallocateStringBuffer</a> function but has not been promoted to an [**HSTRING**](/windows/win32/winrt/hstring) by the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspromotestringbuffer">WindowsPromoteStringBuffer</a> function.  
     * 
     * <div class="alert"><b>Note</b>  Calling <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspromotestringbuffer">WindowsPromoteStringBuffer</a> after calling <b>WindowsDeleteStringBuffer</b> with the same buffer handle is undefined.</div>
     * <div> </div>
     * @param {Pointer<HSTRING_BUFFER>} bufferHandle Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring-buffer">HSTRING_BUFFER</a></b>
     * 
     * The buffer to discard. The <b>WindowsDeleteStringBuffer</b> function raises an exception if <i>bufferHandle</i> was not allocated by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspreallocatestringbuffer">WindowsPreallocateStringBuffer</a> function.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  buffer was discarded successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>bufferHandle</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsdeletestringbuffer
     * @since windows8.0
     */
    static WindowsDeleteStringBuffer(bufferHandle) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsDeleteStringBuffer", "ptr", bufferHandle, "int")
        return result
    }

    /**
     * Provides a way to for debuggers to display the value of a Windows Runtime�HSTRING in another address space, remotely, or from a dump. (WindowsInspectString)
     * @param {Pointer} targetHString [in]
     * 
     * The [**HSTRING**](/windows/win32/winrt/hstring) to inspect.
     * @param {Integer} machine The format of the target address space. Valid values are <b>IMAGE_FILE_MACHINE_AMD64</b> for Win64,  <b>IMAGE_FILE_MACHINE_I386</b> for  Win32, or <b>IMAGE_FILE_MACHINE_ARM</b> for 32-bit ARM.
     * @param {Pointer<PINSPECT_HSTRING_CALLBACK>} callback [in]
     * 
     * A callback function to read the string buffer from the target address space. This function is called before the <i>length</i> and <i>targetStringAddress</i> parameters are computed by the <b>WindowsInspectString</b> function.
     * @param {Pointer<Void>} context [in, optional]
     * 
     * Custom context data passed to the callback.
     * @param {Pointer<UInt32>} length [out]
     * 
     * The length of the string in the target address space, if the call to <i>callback</i> is successful; otherwise, 0.
     * @param {Pointer<UIntPtr>} targetStringAddress [out]
     * 
     * The target address of the raw <b>PCWSTR</b>, if the call to <i>callback</i> is successful; otherwise, <b>NULL</b>.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <ul>
     * <li><b>IMAGE_FILE_MACHINE_AMD64</b> was specified for <i>machine</i>, but the current platform is not Win64, or</li>
     * <li><i>machine</i> is not <b>IMAGE_FILE_MACHINE_AMD64</b>,  <b>IMAGE_FILE_MACHINE_I386</b>, or <b>IMAGE_FILE_MACHINE_ARM</b>, or</li>
     * <li><i>targetHString</i> is not a correctly formed [**HSTRING**](/windows/win32/winrt/hstring). </li>
     * </ul>
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsinspectstring
     * @since windows8.0
     */
    static WindowsInspectString(targetHString, machine, callback, context, length, targetStringAddress) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsInspectString", "ptr", targetHString, "ushort", machine, "ptr", callback, "ptr", context, "ptr", length, "ptr", targetStringAddress, "int")
        return result
    }

    /**
     * Provides a way to for debuggers to display the value of a Windows Runtime�HSTRING in another address space, remotely, or from a dump. (WindowsInspectString2)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsinspectstring">WindowsInspectString</a> function passes the input and output pointers as native pointer-sized values. If  the current platform is Win32, that function returns an error for processes that are Win64. 
     * 
     * <b>WindowsInspectString2</b> enables cross-architecture debugging by allowing up to 64-bit values when called from both Win32 and Win64 applications.
     * @param {Integer} targetHString [in]
     * 
     * The [**HSTRING**](/windows/win32/winrt/hstring) to inspect.
     * @param {Integer} machine The format of the target address space. Valid values are <b>IMAGE_FILE_MACHINE_AMD64</b> for Win64,  <b>IMAGE_FILE_MACHINE_I386</b> for  Win32, or <b>IMAGE_FILE_MACHINE_ARM</b> for 32-bit ARM.
     * @param {Pointer<PINSPECT_HSTRING_CALLBACK2>} callback [in]
     * 
     * A callback function to read the string buffer from the target address space. This function is called before the <i>length</i> and <i>targetStringAddress</i> parameters are computed by the <b>WindowsInspectString2</b> function.
     * @param {Pointer<Void>} context [in, optional]
     * 
     * Custom context data passed to the callback.
     * @param {Pointer<UInt32>} length [out]
     * 
     * The length of the string in the target address space, if the call to <i>callback</i> is successful; otherwise, 0.
     * @param {Pointer<UInt64>} targetStringAddress [out]
     * 
     * The target address of the raw <b>PCWSTR</b>, if the call to <i>callback</i> is successful; otherwise, <b>NULL</b>.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <ul>
     * <li>The <i>machine</i> value is not <b>IMAGE_FILE_MACHINE_AMD64</b>,  <b>IMAGE_FILE_MACHINE_I386</b>, or <b>IMAGE_FILE_MACHINE_ARM</b> or</li>
     * <li><i>targetHString</i> is not a correctly formed [**HSTRING**](/windows/win32/winrt/hstring). </li>
     * </ul>
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winstring/nf-winstring-windowsinspectstring2
     * @since windows8.0
     */
    static WindowsInspectString2(targetHString, machine, callback, context, length, targetStringAddress) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-1.dll\WindowsInspectString2", "uint", targetHString, "ushort", machine, "ptr", callback, "ptr", context, "ptr", length, "ptr", targetStringAddress, "int")
        return result
    }

    /**
     * Creates a DispatcherQueueController on the caller's thread. Use the created DispatcherQueueController to create and manage the lifetime of a DispatcherQueue to run queued tasks in priority order on the Dispatcher queue's thread.
     * @remarks
     * Introduced in Windows 10, version 1709.
     * 
     *  If  <i>options.threadType</i> is <b>DQTYPE_THREAD_DEDICATED</b>, then this function  creates the dedicated thread and then creates the  <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> on that thread. The dispatcher queue event loop runs on the new dedicated thread.
     * 
     * An event loop runs asynchronously on a background thread to dispatch
     * queued task items to the new dedicated thread.
     * 
     *  If <i>options.threadType</i> is  <b>DQTYPE_THREAD_CURRENT</b>, then the <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> instance is created on the current thread. An error results if there is already 
     * a <b>IDispatcherQueueController</b> on the current thread. If you create a dispatcher queue on the current thread, ensure that there is a message pump running on the current thread so that the dispatcher queue can use it to dispatch tasks.
     * 
     * This call does not return until the new thread and <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> are created. The new thread will be initialized using the specified COM apartment.
     * 
     * <div class="alert"><b>Important</b>  The <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a>, and its associated <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueue">DispatcherQueue</a>, are WinRT objects. See their documentation for usage details.</div>
     * <div> </div>
     * @param {Pointer} options The threading affinity and type of COM apartment for the created <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a>. See remarks for details.
     * @param {Pointer<DispatcherQueueController>} dispatcherQueueController The created dispatcher queue controller. 
     * 
     * <div class="alert"><b>Important</b>  The <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> is a WinRT object.</div>
     * <div> </div>
     * @returns {Integer} <b>S_OK</b> for success; otherwise a failure code.
     * @see https://learn.microsoft.com/windows/win32/api/dispatcherqueue/nf-dispatcherqueue-createdispatcherqueuecontroller
     */
    static CreateDispatcherQueueController(options, dispatcherQueueController) {
        result := DllCall("CoreMessaging.dll\CreateDispatcherQueueController", "ptr", options, "ptr", dispatcherQueueController, "int")
        return result
    }

    /**
     * Initializes the Windows Runtime on the current thread with the specified concurrency model.
     * @remarks
     * Use the <b>RoInitialize</b> function to initialize a thread in the Windows Runtime. All threads that activate and interact with Windows Runtime objects must be initialized prior to calling into the Windows Runtime. 
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-rouninitialize">RoUninitialize</a> function to close the Windows Runtime on the current thread. Each successful call to <b>RoInitialize</b>, including those that return <b>S_FALSE</b>, must be balanced by a corresponding call to <b>RoUninitialize</b>.
     * @param {Integer} initType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a></b>
     * 
     * The concurrency model for the thread. The default is <b>RO_INIT_MULTITHREADED</b>.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return the standard return values <b>E_INVALIDARG</b>, <b>E_OUTOFMEMORY</b>, and <b>E_UNEXPECTED</b>, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Runtime was initialized successfully on this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Runtime is already initialized on this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CHANGED_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A previous call to <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roinitialize">RoInitialize</a> specified the concurrency model for this thread as multithread apartment (MTA). This could also indicate that a change from neutral-threaded apartment to single-threaded apartment has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-roinitialize
     * @since windows8.0
     */
    static RoInitialize(initType) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoInitialize", "int", initType, "int")
        return result
    }

    /**
     * Closes the Windows Runtime on the current thread.
     * @remarks
     * Call the <b>RoUninitialize</b> function to close the Windows Runtime on the current thread. This unloads all DLLs loaded by the thread, frees any other resources that the thread maintains, and forces all RPC connections on the thread to close.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roinitialize">RoInitialize</a> function to initialize a thread in the Windows Runtime.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-rouninitialize
     * @since windows8.0
     */
    static RoUninitialize() {
        DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoUninitialize")
    }

    /**
     * Activates the specified Windows Runtime class.
     * @remarks
     * Use the <b>RoActivateInstance</b> function to activate a Windows Runtime class. The <b>RoActivateInstance</b> function connects to the activation factory that is associated with the specified activatable class identifier, creates an instance by calling the zero-argument constructor on the class, and releases the activation factory.
     * @param {Pointer<HSTRING>} activatableClassId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * The class identifier that is associated with the activatable runtime class.
     * @param {Pointer<IInspectable>} instance Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>**</b>
     * 
     * A pointer to the activated instance of the runtime class.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class was activated successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>instance</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread has not been initialized in the Windows Runtime by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roinitialize">RoInitialize</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/ne-inspectable-trustlevel">TrustLevel</a> for the class requires a full-trust process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> interface is not implemented by the specified class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to create an instance of the class.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-roactivateinstance
     * @since windows8.0
     */
    static RoActivateInstance(activatableClassId, instance) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoActivateInstance", "ptr", activatableClassId, "ptr", instance, "int")
        return result
    }

    /**
     * Registers an array out-of-process activation factories for a Windows Runtime exe server.
     * @remarks
     * The <b>RoRegisterActivationFactories</b> function enables an exe server to register multiple activation factories without experiencing a race condition.
     * @param {Pointer<HSTRING>} activatableClassIds Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
     * 
     * An array of class identifiers that are associated with activatable runtime classes.
     * @param {Pointer<PFNGETACTIVATIONFACTORY>} activationFactoryCallbacks Type: <b><a href="https://docs.microsoft.com/previous-versions/br205771(v=vs.85)">PFNGETACTIVATIONFACTORY</a>*</b>
     * 
     * An array of callback functions that you can use to retrieve the activation factories that correspond with  <i>activatableClassIds</i>.
     * @param {Integer} count Type: <b>UINT32</b>
     * 
     * The number of items in the <i>activatableClassIds</i> and <i>activationFactoryCallbacks</i> arrays.
     * @param {Pointer<IntPtr>} cookie Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/ro-registration-cookie">RO_REGISTRATION_COOKIE</a>*</b>
     * 
     * A cookie that identifies the registered factories.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  activation factory was registered successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>cookie</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread is in a neutral apartment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread has not been initialized in the Windows Runtime by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roinitialize">RoInitialize</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_ALREADYINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The factory has been initialized already. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class is not registered as OutOfProc.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-roregisteractivationfactories
     * @since windows8.0
     */
    static RoRegisterActivationFactories(activatableClassIds, activationFactoryCallbacks, count, cookie) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoRegisterActivationFactories", "ptr", activatableClassIds, "ptr", activationFactoryCallbacks, "uint", count, "ptr", cookie, "int")
        return result
    }

    /**
     * Removes an array of registered activation factories from the Windows Runtime.
     * @remarks
     * Call the <b>RoRevokeActivationFactories</b> function remove the activation factories represented in the  <i>cookie</i> array from the Windows Runtime.
     * @param {Pointer} cookie Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/ro-registration-cookie">RO_REGISTRATION_COOKIE</a></b>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-rorevokeactivationfactories
     * @since windows8.0
     */
    static RoRevokeActivationFactories(cookie) {
        DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoRevokeActivationFactories", "ptr", cookie)
    }

    /**
     * Gets the activation factory for the specified runtime class. (RoGetActivationFactory)
     * @param {Pointer<HSTRING>} activatableClassId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * The ID of the activatable class.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The reference ID of the interface.
     * @param {Pointer<Void>} factory Type: <b>void**</b>
     * 
     * The activation factory.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-rogetactivationfactory
     * @since windows8.0
     */
    static RoGetActivationFactory(activatableClassId, iid, factory) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoGetActivationFactory", "ptr", activatableClassId, "ptr", iid, "ptr", factory, "int")
        return result
    }

    /**
     * Registers an IApartmentShutdown callback to be invoked when the current apartment shuts down.
     * @remarks
     * To receive apartment shutdown notifications, your app must register its apartment shutdown handler with the system by calling the <b>RoRegisterForApartmentShutdown</b> function.
     * 
     * <div class="alert"><b>Warning</b>  </div>
     * <div> </div>
     * Don't call the <b>RoRegisterForApartmentShutdown</b> function from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iapartmentshutdown-onuninitialize">OnUninitialize</a> callback.
     * @param {Pointer<IApartmentShutdown>} callbackObject The application-supplied <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iapartmentshutdown">IApartmentShutdown</a> interface.
     * @param {Pointer<UInt64>} apartmentIdentifier The identifier for the current apartment.
     * @param {Pointer<APARTMENT_SHUTDOWN_REGISTRATION_COOKIE>} regCookie A cookie that you can use to unregister the callback.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-roregisterforapartmentshutdown
     * @since windows8.0
     */
    static RoRegisterForApartmentShutdown(callbackObject, apartmentIdentifier, regCookie) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoRegisterForApartmentShutdown", "ptr", callbackObject, "ptr", apartmentIdentifier, "ptr", regCookie, "int")
        return result
    }

    /**
     * Unregisters a previously registered IApartmentShutdown interface.
     * @remarks
     * Call the <b>RoUnregisterForApartmentShutdown</b> to stop receiving apartment shutdown notifications and unregister a previously registered <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iapartmentshutdown">IApartmentShutdown</a> interface.
     * 
     * <div class="alert"><b>Warning</b>  </div>
     * <div> </div>
     * Don't call the <b>RoUnregisterForApartmentShutdown</b> function from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iapartmentshutdown-onuninitialize">OnUninitialize</a> callback.
     * @param {Pointer<APARTMENT_SHUTDOWN_REGISTRATION_COOKIE>} regCookie A registration cookie obtained from a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roregisterforapartmentshutdown">RoRegisterForApartmentShutdown</a> function.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-rounregisterforapartmentshutdown
     * @since windows8.0
     */
    static RoUnregisterForApartmentShutdown(regCookie) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoUnregisterForApartmentShutdown", "ptr", regCookie, "int")
        return result
    }

    /**
     * Gets a unique identifier for the current apartment.
     * @param {Pointer<UInt64>} apartmentIdentifier A process-unique identifier for the current apartment.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-rogetapartmentidentifier
     * @since windows8.0
     */
    static RoGetApartmentIdentifier(apartmentIdentifier) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoGetApartmentIdentifier", "ptr", apartmentIdentifier, "int")
        return result
    }

    /**
     * Provides a standard IBuffer marshaler to implement the semantics associated with the IBuffer interface when it is marshaled.
     * @remarks
     * Provided for Windows Runtime language projections.
     * 
     * Custom IBuffer implementations are expected to be marshaled so that the remote instance eventually copies its contents back to the original instance. The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> implementation provided by this method handles the copy by marshaling the current value of the IBuffer and specifying a platform-provided unmarshal COM class that creates an instance with identical IBuffer contents, length, and capacity.  
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> implementation clones its contents to the original instance when the caller sets the Length property.
     * @param {Pointer<IMarshal>} bufferMarshaler pointer to Windows Runtime IBuffer marshaler
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/robuffer/nf-robuffer-rogetbuffermarshaler
     * @since windows8.0
     */
    static RoGetBufferMarshaler(bufferMarshaler) {
        result := DllCall("api-ms-win-core-winrt-robuffer-l1-1-0.dll\RoGetBufferMarshaler", "ptr", bufferMarshaler, "int")
        return result
    }

    /**
     * Gets the current reporting behavior of Windows Runtime error functions.
     * @remarks
     * Set the reporting behavior of   Windows Runtime error functions by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roseterrorreportingflags">RoSetErrorReportingFlags</a>  function.
     * @param {Pointer<UInt32>} pflags Type: <b>UINT32*</b>
     * 
     * A pointer to the bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/ne-roerrorapi-roerrorreportingflags">RO_ERROR_REPORTING_FLAGS</a> values that represents the current error-reporting behavior.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  error-reporting behavior was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pflags</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-rogeterrorreportingflags
     * @since windows8.0
     */
    static RoGetErrorReportingFlags(pflags) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoGetErrorReportingFlags", "ptr", pflags, "int")
        return result
    }

    /**
     * Sets the reporting behavior of Windows Runtime error functions.
     * @remarks
     * Get the current reporting behavior of   Windows Runtime error functions by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rogeterrorreportingflags">RoGetErrorReportingFlags</a> function.
     * @param {Integer} flags Type: <b>UINT32</b>
     * 
     * A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/ne-roerrorapi-roerrorreportingflags">RO_ERROR_REPORTING_FLAGS</a> values.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  error-reporting behavior was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>flags</i> has invalid or undefined bits set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-roseterrorreportingflags
     * @since windows8.0
     */
    static RoSetErrorReportingFlags(flags) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoSetErrorReportingFlags", "uint", flags, "int")
        return result
    }

    /**
     * Returns the IRestrictedErrorInfo interface pointer based on the given reference.
     * @remarks
     * The <b>RoResolveRestrictedErrorInfoReference</b> function is useful primarily for debugger development. A debugger receives the reference  string and uses the reference to identify the associated <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> object, which allows the debugger to retrieve the detailed error message by calling the <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nf-restrictederrorinfo-irestrictederrorinfo-geterrordetails">GetErrorDetails</a> method.
     * @param {Pointer<PWSTR>} reference Type: <b>PCWSTR</b>
     * 
     * Identifies an error object which contains relevant information for the specific error.
     * @param {Pointer<IRestrictedErrorInfo>} ppRestrictedErrorInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a>**</b>
     * 
     * The output parameter for the object associated with the given reference.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLASS_E_NOAGGREGATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * object does not support aggregation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reference is invalid.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-roresolverestrictederrorinforeference
     * @since windows8.0
     */
    static RoResolveRestrictedErrorInfoReference(reference, ppRestrictedErrorInfo) {
        reference := reference is String? StrPtr(reference) : reference

        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoResolveRestrictedErrorInfoReference", "ptr", reference, "ptr", ppRestrictedErrorInfo, "int")
        return result
    }

    /**
     * Sets the restricted error information object for the current thread.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rocaptureerrorcontext">RoCaptureErrorContext</a> function to save error information for the current thread in a Windows Store app. Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rofailfastwitherrorcontext">RoFailFastWithErrorContext</a> function to raise an exception, terminate the current process, and report the error to the Windows Error Reporting service (WER).
     * 
     * The <b>SetRestrictedErrorInfo</b>  function calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to find the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a> object, and then it calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a>.   The call fails if <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> isn't the system implementation. To create an <b>IRestrictedErrorInfo</b> object, call  the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rooriginateerror">OriginateError</a>, <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rotransformerror">TransformError</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rocaptureerrorcontext">RoCaptureErrorContext</a> functions.
     * 
     * The <b>SetRestrictedErrorInfo</b>  function releases the existing restricted error information object, if one exists, and sets <i>pRestrictedErrorInfo</i>.  For more info, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a> function.
     * @param {Pointer<IRestrictedErrorInfo>} pRestrictedErrorInfo The restricted error information object associated with the current thread.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-setrestrictederrorinfo
     * @since windows8.0
     */
    static SetRestrictedErrorInfo(pRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\SetRestrictedErrorInfo", "ptr", pRestrictedErrorInfo, "int")
        return result
    }

    /**
     * Gets the restricted error information object set by a previous call to SetRestrictedErrorInfo in the current logical thread.
     * @remarks
     * Call the <b>GetRestrictedErrorInfo</b>  function to get the most recently set <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> object on the current thread in a Windows Store app.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rocaptureerrorcontext">RoCaptureErrorContext</a> function to save error information for the current thread. Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rofailfastwitherrorcontext">RoFailFastWithErrorContext</a> function to raise an exception, terminate the current process, and report the error to the Windows Error Reporting service (WER).
     * 
     * <b>GetRestrictedErrorInfo</b> transfers ownership of the error object to the caller and clears the error state for the thread. If the most recently set error object doesn't support the <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> interface, the error state for the thread is cleared, but no interface is returned to the caller.
     * 
     * The <b>GetRestrictedErrorInfo</b> retrieves the error object from the current thread and calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to find the <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> interface.  If <b>IRestrictedErrorInfo</b> isn't found, <b>GetRestrictedErrorInfo</b> returns <b>S_FALSE</b>.  In this case, the error object is removed from the thread. For more info, see <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * Calling the <b>GetRestrictedErrorInfo</b>  function fails if <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> isn't the system implementation. To create an <b>IRestrictedErrorInfo</b> object, call  the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rooriginateerror">OriginateError</a>, <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rotransformerror">TransformError</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rocaptureerrorcontext">RoCaptureErrorContext</a> functions.
     * @param {Pointer<IRestrictedErrorInfo>} ppRestrictedErrorInfo The restricted error info object associated with the current thread.
     * @returns {Integer} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  restricted error object was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no restricted error object associated with the current thread. Any other error object is removed from the thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-getrestrictederrorinfo
     * @since windows8.0
     */
    static GetRestrictedErrorInfo(ppRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\GetRestrictedErrorInfo", "ptr", ppRestrictedErrorInfo, "int")
        return result
    }

    /**
     * Reports an error and an informative string to an attached debugger. (RoOriginateErrorW)
     * @remarks
     * Use the <b>RoOriginateErrorW</b> function  to report an error condition and a corresponding message to a debugger. This function does not perform logging or event tracing.
     * 
     * The error is communicated to the debugger by raising a structured exception.  This exception is caught by the attached debugger, and the exception parameters contain both the error and the <i>message</i> string.  The debugger may display these parameters to the user.
     * 
     * Depending on the current configuration of the debugger, the <b>RoOriginateErrorW</b> function may cause execution to halt in the debugger at the site of the exception.
     * 
     *  If the <b>UseSetErrorInfo</b> flag is set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roseterrorreportingflags">RoSetErrorReportingFlags</a> function, and the calling thread has been initialized in COM, the function creates an appropriate error object that supports <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> and  associates it with the COM channel by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a>.  If the thread has not been initialized into COM, the call will still succeed with no  error, but the error will not be associated with the COM channel.
     * 
     * <div class="alert"><b>Note</b>  This is no ANSI version of the <b>RoOriginateErrorW</b> function. Message strings are required to be Unicode. </div>
     * <div> </div>
     * @param {Integer} error Type: <b>HRESULT</b>
     * 
     * The error code associated with the error condition. If <i>error</i> is a success code, such as <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>. This behavior enables calling the function when no error has occurred without causing an unwanted error message.
     * @param {Integer} cchMax Type: <b>UINT</b>
     * 
     * The maximum number of characters in <i>message</i>, excluding the terminating <b>NUL</b> character. If the value is 0, the string is read to the first <b>NUL</b> character or 512 characters, whichever is less. If <i>cchMax</i> is greater than 512, all characters after 512 are ignored.
     * @param {Pointer<PWSTR>} message Type: <b>PCWSTR</b>
     * 
     * An informative string to help developers to correct the reported error condition. The maximum length is 512 characters, including the trailing <b>NUL</b> character; longer strings are truncated.
     * 
     * If the string is empty, the function succeeds but no error information is reported. It is recommended that you always provide an informative string.
     * 
     * If <i>message</i> is <b>NULL</b>, the function succeeds and reports the generic string in Winerror.h if available or the generic string associated with <b>E_FAIL</b>.
     * 
     * This function does not support embedded <b>NUL</b> characters, so only the characters before the first <b>NUL</b> are reported.
     * 
     * The <i>message</i> string should be localized.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  error message was reported successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>message</i> is <b>NULL</b> or points to an empty string, or <i>error</i> is a success code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-rooriginateerrorw
     * @since windows8.0
     */
    static RoOriginateErrorW(error, cchMax, message) {
        message := message is String? StrPtr(message) : message

        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoOriginateErrorW", "int", error, "uint", cchMax, "ptr", message, "int")
        return result
    }

    /**
     * Reports an error and an informative string to an attached debugger. (RoOriginateError)
     * @remarks
     * Use the <b>RoOriginateError</b> function  to report an error condition and a corresponding message to a debugger. This function does not perform logging or event tracing.
     * 
     * The error is communicated to the debugger by raising a structured exception.  This exception is caught by the attached debugger, and the exception parameters contain both the error and the <i>message</i> string.  The debugger may display these parameters to the user.
     * 
     * Depending on the current configuration of the debugger, the <b>RoOriginateError</b> function may cause execution to halt in the debugger at the site of the exception.
     * 
     *  If the <b>UseSetErrorInfo</b> flag is set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roseterrorreportingflags">RoSetErrorReportingFlags</a> function, and the calling thread has been initialized in COM, the function creates an appropriate error object that supports <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> and  associates it with the COM channel by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a>.  If the thread has not been initialized into COM, the call will still succeed with no  error, but the error will not be associated with the COM channel.
     * @param {Integer} error Type: <b>HRESULT</b>
     * 
     * The error code associated with the error condition. If <i>error</i> is a success code, such as <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>. This behavior enables calling the function when no error has occurred without causing an unwanted error message.
     * @param {Pointer<HSTRING>} message Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * An informative string to help developers to correct the reported error condition. The maximum length is 512 characters, including the trailing <b>NUL</b> character; longer strings are truncated.
     * 
     * If the string is empty, the function succeeds but no error information is reported. It is recommended that you always provide an informative string.
     * 
     * If <i>message</i> is <b>NULL</b>, the function succeeds and reports the generic string in Winerror.h if available or the generic string associated with <b>E_FAIL</b>.
     * 
     * This function does not support embedded <b>NUL</b> characters, so only the characters before the first <b>NUL</b> are reported.
     * 
     * The <i>message</i> string should be localized.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  error message was reported successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>message</i> is <b>NULL</b> or points to an empty string, or <i>error</i> is a success code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-rooriginateerror
     * @since windows8.0
     */
    static RoOriginateError(error, message) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoOriginateError", "int", error, "ptr", message, "int")
        return result
    }

    /**
     * Reports a transformed error and an informative string to an attached debugger.
     * @remarks
     * Use the <b>RoTransformErrorW</b> function  to substitute a custom error code for an existing error condition. For example, if the current error condition is <b>E_FAIL</b>, you can substitute a more specific error code, such as  	<b>E_FILENOTFOUND</b> and report the transformed error to an attached debugger. 
     * 
     * The behavior of the  <b>RoTransformErrorW</b> function is otherwise the same as the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rooriginateerrorw">RoOriginateErrorW</a> function.
     * 
     *  If the <b>UseSetErrorInfo</b> flag is set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roseterrorreportingflags">RoSetErrorReportingFlags</a> function, and the calling thread has been initialized in COM, the function creates an appropriate error object that supports <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> and  associates it with the COM channel by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a>.  If the thread has not been initialized into COM, the call will still succeed with no  error, but the error will not be associated with the COM channel.
     * 
     * 
     * <div class="alert"><b>Note</b>  This is no ANSI version of the <b>RoTransformErrorW</b> function. Message strings are required to be Unicode.</div>
     * <div> </div>
     * @param {Integer} oldError Type: <b>HRESULT</b>
     * 
     * The original error code associated with the error condition.
     * @param {Integer} newError Type: <b>HRESULT</b>
     * 
     * The custom error code to associate with the error condition. If <i>oldError</i> and <i>newError</i>  are the same, or both are success codes, such as <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>.
     * @param {Integer} cchMax Type: <b>UINT</b>
     * 
     * The maximum number of characters in <i>message</i>, excluding the terminating null character. If the value is 0, the string is read to the first null character or 512 characters, whichever is less. If <i>cchMax</i> is greater than 512, all characters after 512 are ignored.
     * @param {Pointer<PWSTR>} message Type: <b>PCWSTR</b>
     * 
     * An informative string to help developers to correct the reported error condition. The maximum length is 512 characters, including the trailing null character; longer strings are truncated.
     * 
     * If the string is empty, the function succeeds but no error information is reported. It is recommended that you always provide an informative string.
     * 
     * If <i>message</i> is <b>NULL</b>, the function succeeds and reports the generic string in Winerror.h if available or the generic string associated with E_FAIL.
     * 
     * This function does not support embedded null characters, so only the characters before the first null are reported.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  error message was reported successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>message</i> is <b>NULL</b> or points to an empty string, or <i>oldError</i> and <i>newError</i> are the same, or both are success codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-rotransformerrorw
     * @since windows8.0
     */
    static RoTransformErrorW(oldError, newError, cchMax, message) {
        message := message is String? StrPtr(message) : message

        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoTransformErrorW", "int", oldError, "int", newError, "uint", cchMax, "ptr", message, "int")
        return result
    }

    /**
     * Reports a modified error and an informative string to an attached debugger.
     * @remarks
     * Use the <b>RoTransformError</b> function  to substitute a custom error code for an existing error condition. For example, if the current error condition is <b>E_FAIL</b>, you can substitute a more specific error code, such as  	<b>E_FILENOTFOUND</b>, and report the transformed error to an attached debugger. 
     * 
     * The behavior of the  <b>RoTransformError</b> function is otherwise the same as the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rotransformerrorw">RoTransformErrorW</a> function.
     * 
     *  If the <b>UseSetErrorInfo</b> flag is set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roseterrorreportingflags">RoSetErrorReportingFlags</a> function, and the calling thread has been initialized in COM, the function creates an appropriate error object that supports <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> and  associates it with the COM channel by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a>.  If the thread has not been initialized into COM, the call will still succeed with no  error, but the error will not be associated with the COM channel.
     * @param {Integer} oldError Type: <b>HRESULT</b>
     * 
     * The original error code associated with the error condition.
     * @param {Integer} newError Type: <b>HRESULT</b>
     * 
     * A different  error code to associate with the error condition. If <i>oldError</i> and <i>newError</i>  are the same, or both are success codes, such as <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>.
     * @param {Pointer<HSTRING>} message Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * An informative string to help developers to correct the reported error condition. The maximum length is 512 characters, including the trailing null character; longer strings are truncated.
     * 
     * If the string is empty, the function succeeds but no error information is reported. It is recommended that you always provide an informative string.
     * 
     * If <i>message</i> is <b>NULL</b>, the function succeeds and reports the generic string in Winerror.h if available or the generic string associated with E_FAIL.
     * 
     * Although the <i>message</i> string is an <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>, the <b>RoTransformError</b> function  does not support embedded null characters, so only the characters before the first null are reported.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  error message was reported successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>message</i> is <b>NULL</b> or points to an empty string, or <i>oldError</i> and <i>newError</i> are the same, or both are success codes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-rotransformerror
     * @since windows8.0
     */
    static RoTransformError(oldError, newError, message) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoTransformError", "int", oldError, "int", newError, "ptr", message, "int")
        return result
    }

    /**
     * Saves the current error context so that it's available for later calls to the RoFailFastWithErrorContext function.
     * @remarks
     * The <b>RoCaptureErrorContext</b> function captures the context associated with an error, including the stack-backtrace. This information is stored in the restricted error object and is available to the Windows Error Reporting (WER) service, if WER is  enabled, and if a subsequent call is made to the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rofailfastwitherrorcontext">RoFailFastWithErrorContext</a> function from the same thread.
     * 
     * To use <b>RoCaptureErrorContext</b> function with <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rooriginateerror">RoOriginateError</a>, call <b>RoOriginateError</b> first, and then call <b>RoCaptureErrorContext</b>.  Calling in the reverse order may cause the error context to be lost.
     * @param {Integer} hr The <b>HRESULT</b> associated with the error.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-rocaptureerrorcontext
     * @since windows8.0
     */
    static RoCaptureErrorContext(hr) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoCaptureErrorContext", "int", hr, "int")
        return result
    }

    /**
     * Raises a non-continuable exception in the current process.
     * @remarks
     * The <b>RoFailFastWithErrorContext</b> function raises a non-continuable exception in the current process when an unhandled failure is encountered, which  prevents the process from continuing execution in an undefined state.
     * 
     * Call the <b>RoFailFastWithErrorContext</b> function when a failure occurs in a completion delegate for a completed asynchronous operation, or  when a failure occurs in an event handler when an event is raised.
     * 
     * The process that calls <b>RoFailFastWithErrorContext</b> is terminated by a call to <a href="https://docs.microsoft.com/previous-versions/dd408166(v=vs.85)">RaiseFailFastException</a>.  The function does not validate the parameters and raises an exception for any value of the inputs.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rocaptureerrorcontext">RoCaptureErrorContext</a> function to save an <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> object that's associated with the current thread. The <b>RoFailFastWithErrorContext</b> function uses this contextual information to report the error call stack to the Windows Error Reporting service (WER), if it's enabled.
     * @param {Integer} hrError The <b>HRESULT</b> associated with the current error. The exception is raised for any value of <i>hrError</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-rofailfastwitherrorcontext
     * @since windows8.0
     */
    static RoFailFastWithErrorContext(hrError) {
        DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoFailFastWithErrorContext", "int", hrError)
    }

    /**
     * Reports an error, an informative string, and an error object to an attached debugger.
     * @remarks
     * The <b>RoOriginateLanguageException</b>  function behaves like <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rooriginateerror">RoOriginateError</a> but takes another parameter that stores extra information about the error. Language projections use this function to store exception information alongside the COM error information. Language projections need to create an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> object that contains all the information necessary recreate it the exception a later point.
     * 
     * The error object must be apartment-agile, in-proc, and marshal-by-value across processes. The reason for this restriction is that the thread from which the error object is originated may no longer exist, for example due to a <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> call, by the time the error information is retrieved.
     * @param {Integer} error The error code associated with the error condition. If <i>error</i> is a success code, like <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>. This behavior enables calling the function when no error has occurred without causing an unwanted error message.
     * @param {Pointer<HSTRING>} message An informative string to help developers to correct the reported error condition. The maximum length is 512 characters, including the trailing <b>NUL</b> character; longer strings are truncated.
     * 
     * If the string is empty, the function succeeds but no error information is reported. It is recommended that you always provide an informative string.
     * 
     * If <i>message</i> is <b>NULL</b>, the function succeeds and reports the generic string in Winerror.h if available or the generic string associated with <b>E_FAIL</b>.
     * 
     * This function does not support embedded <b>NUL</b> characters, so only the characters before the first <b>NUL</b> are reported.
     * 
     * The <i>message</i> string should be localized.
     * @param {Pointer<IUnknown>} languageException An error object that's apartment-agile, in-proc, and marshal-by-value across processes. This object should implement <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionstackbacktrace">ILanguageExceptionStackBackTrace</a> and <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptiontransform">ILanguageExceptionTransform</a> if necessary.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  error message was reported successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>message</i> is <b>NULL</b> or points to an empty string, or <i>error</i> is a success code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-rooriginatelanguageexception
     * @since windows8.1
     */
    static RoOriginateLanguageException(error, message, languageException) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoOriginateLanguageException", "int", error, "ptr", message, "ptr", languageException, "int")
        return result
    }

    /**
     * Removes existing error information from the current thread environment block (TEB).
     * @remarks
     * Call the <b>RoClearError</b> function to remove existing thread error information from the thread environment block (TEB). If COM is not initialized, this call does nothing to create the TEB slot for this information. Language projections call this function to ensure there's no stale error information on the thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-roclearerror
     * @since windows8.1
     */
    static RoClearError() {
        DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoClearError")
    }

    /**
     * Triggers the Global Error Handler when an unhandled exception occurs.
     * @remarks
     * The <b>RoReportUnhandledError</b> function enables language projections to trigger execution of the Global Error Handler when an exception reaches the top of the stack, which normally would terminate the application.
     * @param {Pointer<IRestrictedErrorInfo>} pRestrictedErrorInfo The error to report. Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-getrestrictederrorinfo">GetRestrictedErrorInfo</a> function to get the <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> that represents the error.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-roreportunhandlederror
     */
    static RoReportUnhandledError(pRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoReportUnhandledError", "ptr", pRestrictedErrorInfo, "int")
        return result
    }

    /**
     * Gets the error object that represents the call stack at the point where the error originated.
     * @remarks
     * When the call to <b>RoInspectThreadErrorInfo</b> is  successful, <i>targetErrorInfoAddress</i> contains the address of an error object that you can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roinspectcapturedstackbacktrace">RoInspectCapturedStackBackTrace</a> function to get the call stack at the point where the error was originated.
     * @param {Pointer} targetTebAddress The target thread environment block (TEB).
     * @param {Integer} machine The machine to debug.
     * @param {Pointer<PINSPECT_MEMORY_CALLBACK>} readMemoryCallback A callback function to read the buffer from the target TEB address space.
     * @param {Pointer<Void>} context Custom context data.
     * @param {Pointer<UIntPtr>} targetErrorInfoAddress The address of the error object.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-roinspectthreaderrorinfo
     * @since windows8.1
     */
    static RoInspectThreadErrorInfo(targetTebAddress, machine, readMemoryCallback, context, targetErrorInfoAddress) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoInspectThreadErrorInfo", "ptr", targetTebAddress, "ushort", machine, "ptr", readMemoryCallback, "ptr", context, "ptr", targetErrorInfoAddress, "int")
        return result
    }

    /**
     * Provides a way to for debuggers to inspect a call stack from a target process.
     * @remarks
     * The <b>RoInspectCapturedStackBackTrace</b> function takes a pointer to a system error object  and fills <i>frameCount</i> with the number of stack frames stored in the error object,  and it fills <i>targetBackTraceAddress</i> with the stack back trace address in the target process. The <b>RoInspectCapturedStackBackTrace</b> function tries to confirm that <i>targetErrorInfoAddress</i> points is to a system error object and fails if it can't match the version signature.
     * 
     * Get the <i>targetErrorInfoAddress</i> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roinspectthreaderrorinfo">RoInspectThreadErrorInfo</a> function.
     * @param {Pointer} targetErrorInfoAddress The address of the error info object in the target process. Get the <i>targetErrorInfoAddress</i> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roinspectthreaderrorinfo">RoInspectThreadErrorInfo</a> function.
     * @param {Integer} machine The machine to debug.
     * @param {Pointer<PINSPECT_MEMORY_CALLBACK>} readMemoryCallback A callback function to read the buffer from the target TEB address space.
     * @param {Pointer<Void>} context Custom context data.
     * @param {Pointer<UInt32>} frameCount The number of stack frames stored in the error object.
     * @param {Pointer<UIntPtr>} targetBackTraceAddress The stack back trace address in the target process.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-roinspectcapturedstackbacktrace
     * @since windows8.1
     */
    static RoInspectCapturedStackBackTrace(targetErrorInfoAddress, machine, readMemoryCallback, context, frameCount, targetBackTraceAddress) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoInspectCapturedStackBackTrace", "ptr", targetErrorInfoAddress, "ushort", machine, "ptr", readMemoryCallback, "ptr", context, "ptr", frameCount, "ptr", targetBackTraceAddress, "int")
        return result
    }

    /**
     * 
     * @remarks
     * The function checks to see if current error info matches the *hrIn* value passed in and, if not, it originates a matching error info.
     * @param {Integer} hrIn An HRESULT representing the error for which restricted error info is retrieved.
     * @param {Pointer<IRestrictedErrorInfo>} ppRestrictedErrorInfo Receives an instance of [IRestrictedErrorInfo](../restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo.md) representing the details of an error, including restricted error information.
     * @returns {Integer} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-rogetmatchingrestrictederrorinfo
     */
    static RoGetMatchingRestrictedErrorInfo(hrIn, ppRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoGetMatchingRestrictedErrorInfo", "int", hrIn, "ptr", ppRestrictedErrorInfo, "int")
        return result
    }

    /**
     * Triggers the Global Error Handler when a delegate failure occurs.
     * @param {Pointer<IUnknown>} punkDelegate The delegate to report.
     * @param {Pointer<IRestrictedErrorInfo>} pRestrictedErrorInfo The error to report. Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-getrestrictederrorinfo">GetRestrictedErrorInfo</a> function to get the <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> that represents the error.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-roreportfaileddelegate
     */
    static RoReportFailedDelegate(punkDelegate, pRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoReportFailedDelegate", "ptr", punkDelegate, "ptr", pRestrictedErrorInfo, "int")
        return result
    }

    /**
     * Indicates whether the CoreApplication.UnhandledErrorDetected event occurs for the errors that are returned by the delegate registered as a callback function for a Windows Runtime API event or the completion of an asynchronous method.
     * @remarks
     * For Windows 8 apps, this value is <b>FALSE</b>, and errors returned by a delegate registered as a callback function    for the asynchronous completion of a Windows Runtime API or for a Windows Runtime API event are ignored. For Windows 8.1 and Windows 10 apps, this value is <b>TRUE</b>, and errors from callback functions that return control to operating system code are propagated to the global error handler.
     * 
     * Use this function only when your code needs to interoperate with both Windows 8 and newer applications by using the same binary.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the <a href="https://msdn.microsoft.com/863a06ac-b8ec-440a-8445-1dbbf1b04263">CoreApplication.UnhandledErrorDetected</a> event occurs for the errors that are returned by the delegate registered as a callback function for a Windows Runtime API event or the completion of an asynchronous method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates  that the <a href="https://msdn.microsoft.com/863a06ac-b8ec-440a-8445-1dbbf1b04263">CoreApplication.UnhandledErrorDetected</a> event does not occur for the errors that are returned by the delegate registered as a callback function for a Windows Runtime API event or the completion of an asynchronous method.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nf-roerrorapi-iserrorpropagationenabled
     * @since windows8.0
     */
    static IsErrorPropagationEnabled() {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\IsErrorPropagationEnabled", "int")
        return result
    }

    /**
     * Retrieves the activatable classes that are registered for a given executable (EXE) server, which was registered under the package ID of the calling process.
     * @remarks
     * Use the <b>RoGetServerActivatableClasses</b> function to retrieve the class names that the server is expected to serve. Get the details on the individual classes by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roregistrationapi/nf-roregistrationapi-rogetactivatableclassregistration">RoGetActivatableClassRegistration</a> function on each class name individually.
     * @param {Pointer<HSTRING>} serverName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * The name of the server to retrieve class registrations for. This server name is passed on the command line when the server is activated.
     * @param {Pointer<HSTRING>} activatableClassIds Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>**</b>
     * 
     * A callee-allocated array of activatable class ID strings which the server is registered to serve. The strings must be released by the caller using the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> function. The buffer must then be released using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. The server (caller) is responsible for registering the activation factories for these classes.
     * @param {Pointer<UInt32>} count Type: <b>DWORD*</b>
     * 
     * The count of activatable class IDs returned in the <i>activatableClassIds</i> array.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * The method returns <b>S_OK</b> on success, otherwise an error code, including the following. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An empty server name is provided, the server is not registered, or no classes are registered for this server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process does not have sufficient permissions to read this server’s registration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/roregistrationapi/nf-roregistrationapi-rogetserveractivatableclasses
     * @since windows8.0
     */
    static RoGetServerActivatableClasses(serverName, activatableClassIds, count) {
        result := DllCall("api-ms-win-core-winrt-registration-l1-1-0.dll\RoGetServerActivatableClasses", "ptr", serverName, "ptr", activatableClassIds, "ptr", count, "int")
        return result
    }

    /**
     * Creates a Windows Runtime random access stream for a file.
     * @remarks
     * Use the <b>CreateRandomAccessStreamOnFile</b> function to create a <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream">RandomAccessStream</a> that encapsulates a file.
     * 
     * We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iid_ppv_args">IID_PPV_ARGS</a> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error in <i>riid</i> that could lead to unexpected results.
     * @param {Pointer<PWSTR>} filePath The fully qualified path of the file to encapsulate.
     * @param {Integer} accessMode An <a href="https://docs.microsoft.com/uwp/api/Windows.Storage.FileAccessMode">AccessMode</a> value that specifies the behavior of the <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream">RandomAccessStream</a> that encapsulates the file.
     * @param {Pointer<Guid>} riid A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_RandomAccessStream.
     * @param {Pointer<Void>} ppv When this method returns successfully, contains the interface pointer requested in <i>riid</i>, typically the <a href="https://docs.microsoft.com/previous-versions/hh438400(v=vs.85)">IRandomAccessStream</a> that encapsulates the file.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shcore/nf-shcore-createrandomaccessstreamonfile
     * @since windows8.0
     */
    static CreateRandomAccessStreamOnFile(filePath, accessMode, riid, ppv) {
        filePath := filePath is String? StrPtr(filePath) : filePath

        result := DllCall("api-ms-win-shcore-stream-winrt-l1-1-0.dll\CreateRandomAccessStreamOnFile", "ptr", filePath, "uint", accessMode, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * Creates a Windows Runtime random access stream around an IStream base implementation.
     * @remarks
     * Use the <b>CreateRandomAccessStreamOverStream</b> function to create a <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream">RandomAccessStream</a> that encapsulates a COM <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * 
     * For info on utility classes that help with interoperation between Windows Runtime and COM streams, see the Remarks at <b>RandomAccessStreamOverStream</b>.
     * 
     * We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iid_ppv_args">IID_PPV_ARGS</a> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error in <i>riid</i> that could lead to unexpected results.
     * @param {Pointer<IStream>} stream The COM stream to encapsulate.
     * @param {Integer} options One of the <a href="https://docs.microsoft.com/windows/desktop/api/shcore/ne-shcore-bsos_options">BSOS_OPTIONS</a> options that specify the behavior of the <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream">RandomAccessStream</a> that encapsulates <i>stream</i>.
     * @param {Pointer<Guid>} riid A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_RandomAccessStream.
     * @param {Pointer<Void>} ppv When this method returns successfully, contains the interface pointer to the <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream">RandomAccessStream</a> that encapsulates <i>stream</i> requested in <i>riid</i>.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shcore/nf-shcore-createrandomaccessstreamoverstream
     * @since windows8.0
     */
    static CreateRandomAccessStreamOverStream(stream, options, riid, ppv) {
        result := DllCall("api-ms-win-shcore-stream-winrt-l1-1-0.dll\CreateRandomAccessStreamOverStream", "ptr", stream, "int", options, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * Creates an IStream around a Windows Runtime IRandomAccessStream object.
     * @remarks
     * We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iid_ppv_args">IID_PPV_ARGS</a> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error in <i>riid</i> that could lead to unexpected results.
     * @param {Pointer<IUnknown>} randomAccessStream The source <a href="https://docs.microsoft.com/previous-versions/hh438400(v=vs.85)">IRandomAccessStream</a>.
     * @param {Pointer<Guid>} riid A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_IStream. This object encapsulates <i>randomAccessStream</i>.
     * @param {Pointer<Void>} ppv When this method returns successfully, contains the interface pointer requested in <i>riid</i>, typically <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shcore/nf-shcore-createstreamoverrandomaccessstream
     * @since windows8.0
     */
    static CreateStreamOverRandomAccessStream(randomAccessStream, riid, ppv) {
        result := DllCall("api-ms-win-shcore-stream-winrt-l1-1-0.dll\CreateStreamOverRandomAccessStream", "ptr", randomAccessStream, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * Creates a ICoreInputSourceBase object in the caller’s UI thread.
     * @remarks
     * This API must be called from the UI thread to create <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object. The object created using this API can be used only in that thread in which it was created. 
     * 
     * If the call is successful, the  caller can call <b>QueryInterface</b> on the returned <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object to obtain the <a href="https://docs.microsoft.com/windows/desktop/api/corewindow/nn-corewindow-icoreinputinterop">ICoreInputInterop</a> object that created it.
     * @param {Pointer<Guid>} riid Interface ID of the object. Must to be set to the UUID for  <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a>, which is 9F488807-4580-4BE8-BE68-92A9311713BB.
     * @param {Pointer<Void>} ppv Pointer to receive the <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/corewindow/nf-corewindow-createcontrolinput
     */
    static CreateControlInput(riid, ppv) {
        result := DllCall("Windows.UI.dll\CreateControlInput", "ptr", riid, "ptr", ppv, "CDecl int")
        return result
    }

    /**
     * Creates a ICoreInputSourceBase object in a worker thread or the UI thread.
     * @remarks
     * This API must be called from the UI thread or worker thread to create <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object. The object created using this API can be used only in that thread in which it was created. 
     * 
     * If the call is successful, the  caller can call <b>QueryInterface</b> on the returned <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object to obtain the <a href="https://docs.microsoft.com/windows/desktop/api/corewindow/nn-corewindow-icoreinputinterop">ICoreInputInterop</a> object that created it.
     * 
     * This API will fail if the following scenarios occur:
     * 
     * <ul>
     * <li>The <i>pCoreWindow</i> parameter is <b>NULL</b>.</li>
     * <li>If the <a href="https://msdn.microsoft.com/60b1c8c6-c136-4c4c-8e46-69a792d58ed0">CoreWindow</a> passed is not same as the <b>CoreWindow</b> present in the calling thread. </li>
     * </ul>
     * @param {Pointer<IUnknown>} pCoreWindow Pointer to the parent <a href="https://msdn.microsoft.com/60b1c8c6-c136-4c4c-8e46-69a792d58ed0">CoreWindow</a> to which the <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object will be attached. This parameter can’t be NULL.
     * @param {Pointer<Guid>} riid Interface ID of the object. Must to be set to the UUID for  <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a>, which is 9F488807-4580-4BE8-BE68-92A9311713BB.
     * @param {Pointer<Void>} ppv Pointer to receive the <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/corewindow/nf-corewindow-createcontrolinputex
     */
    static CreateControlInputEx(pCoreWindow, riid, ppv) {
        result := DllCall("Windows.UI.dll\CreateControlInputEx", "ptr", pCoreWindow, "ptr", riid, "ptr", ppv, "CDecl int")
        return result
    }

;@endregion Methods
}
