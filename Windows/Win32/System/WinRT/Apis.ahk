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
     * @param {Integer} dwClientPid The process ID of the process that contains the proxy.
     * @param {Integer} ui64ProxyAddress The address of an interface on a proxy to the object.  <i>ui64ProxyAddress</i> is considered a 64-bit value type, rather than a pointer  to a 64-bit value, and isn't a pointer to an object in the debugger process. Instead, this address is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-readprocessmemory">ReadProcessMemory</a> function.
     * @param {Pointer<ServerInformation>} pServerInformation A structure that contains the process ID, the thread ID, and the address of the server.
     * @returns {HRESULT} This function can return one of these values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-codecodeproxy
     */
    static CoDecodeProxy(dwClientPid, ui64ProxyAddress, pServerInformation) {
        result := DllCall("OLE32.dll\CoDecodeProxy", "uint", dwClientPid, "uint", ui64ProxyAddress, "ptr", pServerInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an agile reference for an object specified by the given interface.
     * @param {Integer} options The registration options.
     * @param {Pointer<Guid>} riid The interface ID of the object for which an agile reference is being obtained.
     * @param {Pointer<IUnknown>} pUnk Pointer to the interface to be encapsulated in an agile reference. It must be the same type as <i>riid</i>. It may be a pointer to an in-process object or a pointer to a proxy of an object.
     * @param {Pointer<IAgileReference>} ppAgileReference The agile reference for the object. Call the <a href="https://docs.microsoft.com/windows/desktop/WinRT/iagilereference-resolve">Resolve</a> method to localize the object into the apartment in which <b>Resolve</b> is called.
     * @returns {HRESULT} This function can return one of these values.
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
     * The object implements the <a href="/windows/desktop/api/objidl/nn-objidl-inomarshal">INoMarshal</a> interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-rogetagilereference
     * @since windows8.1
     */
    static RoGetAgileReference(options, riid, pUnk, ppAgileReference) {
        result := DllCall("OLE32.dll\RoGetAgileReference", "int", options, "ptr", riid, "ptr", pUnk, "ptr", ppAgileReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Calculates the wire size of the HSTRING object, and gets its handle and data.
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-hstring_usersize
     * @since windows8.0
     */
    static HSTRING_UserSize(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserSize", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals an HSTRING object into the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-hstring_usermarshal
     * @since windows8.0
     */
    static HSTRING_UserMarshal(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserMarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Unmarshals an HSTRING object from the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<Void>} param2 
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
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-hstring_userunmarshal
     * @since windows8.0
     */
    static HSTRING_UserUnmarshal(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserUnmarshal", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-hstring_userfree
     * @since windows8.0
     */
    static HSTRING_UserFree(param0, param1) {
        DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserFree", "uint*", param0, "ptr", param1)
    }

    /**
     * Calculates the wire size of the HSTRING object, and gets its handle and data.
     * @param {Pointer<UInt32>} param0 
     * @param {Integer} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Integer} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-hstring_usersize64
     * @since windows8.0
     */
    static HSTRING_UserSize64(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserSize64", "uint*", param0, "uint", param1, "ptr", param2, "uint")
        return result
    }

    /**
     * Marshals an HSTRING object into the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Pointer<Byte>} The value obtained from the returned <b>HRESULT</b> value is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-hstring_usermarshal64
     * @since windows8.0
     */
    static HSTRING_UserMarshal64(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserMarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Unmarshals an HSTRING object from the RPC buffer.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Pointer<Void>} param2 
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
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-hstring_userunmarshal64
     * @since windows8.0
     */
    static HSTRING_UserUnmarshal64(param0, param1, param2) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserUnmarshal64", "uint*", param0, "char*", param1, "ptr", param2, "char*")
        return result
    }

    /**
     * Frees resources on the server side when called by RPC stub files.
     * @param {Pointer<UInt32>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-hstring_userfree64
     * @since windows8.0
     */
    static HSTRING_UserFree64(param0, param1) {
        DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\HSTRING_UserFree64", "uint*", param0, "ptr", param1)
    }

    /**
     * Creates a new HSTRING based on the specified source string.
     * @param {Pointer<Char>} sourceString Type: [in, optional] <b>LPCWSTR</b>
     * 
     * A null-terminated string to use as the source for the new [**HSTRING**](/windows/win32/winrt/hstring). To create a new, empty, or <b>NULL</b> string, pass <b>NULL</b> for <i>sourceString</i> and 0 for <i>length</i>.
     * @param {Integer} length Type: [in] <b>UINT32</b>
     * 
     * The length of <i>sourceString</i>, in Unicode characters. Must be 0 if <i>sourceString</i> is <b>NULL</b>.
     * @param {Pointer<Void>} string Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A pointer to the newly created [**HSTRING**](/windows/win32/winrt/hstring), or <b>NULL</b> if an error occurs. Any existing  content in <i>string</i> is overwritten. The <b>HSTRING</b> is a standard handle type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowscreatestring
     * @since windows8.0
     */
    static WindowsCreateString(sourceString, length, string) {
        sourceString := sourceString is String? StrPtr(sourceString) : sourceString

        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsCreateString", "ptr", sourceString, "uint", length, "ptr", string, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new string reference based on the specified string.
     * @param {Pointer<Char>} sourceString Type: [in] <b>PCWSTR</b>
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
     * @param {Pointer<Void>} string Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A pointer to the newly created string, or <b>NULL</b> if an error occurs. Any existing  content in <i>string</i> is overwritten. The [**HSTRING**](/windows/win32/winrt/hstring) is a standard handle type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowscreatestringreference
     * @since windows8.0
     */
    static WindowsCreateStringReference(sourceString, length, hstringHeader, string) {
        sourceString := sourceString is String? StrPtr(sourceString) : sourceString

        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsCreateStringReference", "ptr", sourceString, "uint", length, "ptr", hstringHeader, "ptr", string, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decrements the reference count of a string buffer.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be deleted. If <i>string</i> is a fast-pass string created by <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowscreatestringreference">WindowsCreateStringReference</a>, or if <i>string</i> is <b>NULL</b> or empty, no action is taken and <b>S_OK</b> is returned.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsdeletestring
     * @since windows8.0
     */
    static WindowsDeleteString(string) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsDeleteString", "ptr", string, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a copy of the specified string.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be copied.
     * @param {Pointer<Void>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A copy of <i>string</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsduplicatestring
     * @since windows8.0
     */
    static WindowsDuplicateString(string, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsDuplicateString", "ptr", string, "ptr", newString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the length, in Unicode characters, of the specified string.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string whose length is to be found.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of Unicode characters in <i>string</i>, including embedded null characters, but excluding the terminating null; or 0 if <i>string</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsgetstringlen
     * @since windows8.0
     */
    static WindowsGetStringLen(string) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsGetStringLen", "ptr", string, "uint")
        return result
    }

    /**
     * Retrieves the backing buffer for the specified string.
     * @param {Pointer<Void>} string Type: [in, optional] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * An optional string for which the backing buffer is to be retrieved. Can be **NULL**.
     * @param {Pointer<UInt32>} length Type: [out, optional] **UINT32 \***
     * 
     * An optional pointer to a **UINT32**. If **NULL** is passed for *length*, then it is ignored. If *length* is a valid pointer to a **UINT32**, and *string* is a valid [**HSTRING**](/windows/win32/winrt/hstring), then on successful completion the function sets the value pointed to by *length* to the number of Unicode characters in the backing buffer for *string* (including embedded null characters, but excluding the terminating null). If *length* is a valid pointer to a **UINT32**, and *string* is **NULL**, then the value pointed to by *length* is set to 0.
     * @returns {Pointer<Char>} Type: <b>PCWSTR</b>
     * 
     * A pointer to the buffer that provides the backing store for <i>string</i>, or the empty string if <i>string</i> is <b>NULL</b> or the empty string.
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsgetstringrawbuffer
     * @since windows8.0
     */
    static WindowsGetStringRawBuffer(string, length) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsGetStringRawBuffer", "ptr", string, "uint*", length, "char*")
        return result
    }

    /**
     * Indicates whether the specified string is the empty string.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be tested for content.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if <i>string</i> is <b>NULL</b> or the empty string; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsisstringempty
     * @since windows8.0
     */
    static WindowsIsStringEmpty(string) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsIsStringEmpty", "ptr", string, "int")
        return result
    }

    /**
     * Indicates whether the specified string has embedded null characters.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to test for embedded null characters.
     * @param {Pointer<Int32>} hasEmbedNull Type: [out] <b>BOOL*</b>
     * 
     * <b>TRUE</b> if <i>string</i> has one or more embedded null characters; otherwise, <b>FALSE</b>. <b>FALSE</b> if  <i>string</i> is <b>NULL</b> or the empty string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsstringhasembeddednull
     * @since windows8.0
     */
    static WindowsStringHasEmbeddedNull(string, hasEmbedNull) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsStringHasEmbeddedNull", "ptr", string, "int*", hasEmbedNull, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compares two specified HSTRING objects and returns an integer that indicates their relative position in a sort order.
     * @param {Pointer<Void>} string1 Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The first string to compare.
     * @param {Pointer<Void>} string2 Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The second string to compare.
     * @param {Pointer<Int32>} result Type: [out] <b>INT32*</b>
     * 
     * A value that indicates the lexical relationship between <i>string1</i> and <i>string2</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowscomparestringordinal
     * @since windows8.0
     */
    static WindowsCompareStringOrdinal(string1, string2, result) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsCompareStringOrdinal", "ptr", string1, "ptr", string2, "int*", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a substring from the specified string. The substring starts at the specified character position.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The original string.
     * @param {Integer} startIndex Type: [in] <b>UINT32</b>
     * 
     * The zero-based starting character position of a substring in this instance.
     * @param {Pointer<Void>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A string that is equivalent to the substring that begins at <i>startIndex</i> in <i>string</i>, or <b>NULL</b> if <i>startIndex</i> is equal to the length of <i>string</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowssubstring
     * @since windows8.0
     */
    static WindowsSubstring(string, startIndex, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsSubstring", "ptr", string, "uint", startIndex, "ptr", newString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a substring from the specified string. The substring starts at a specified character position and has a specified length.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The original string.
     * @param {Integer} startIndex Type: [in] <b>UINT32</b>
     * 
     * The zero-based starting character position of a substring in this instance.
     * @param {Integer} length Type: [in] <b>UINT32</b>
     * 
     * The number of characters in the substring.
     * @param {Pointer<Void>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A string that is equivalent to the substring that begins at <i>startIndex</i> in <i>string</i>, or <b>NULL</b> if <i>startIndex</i> is equal to the length of <i>string</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowssubstringwithspecifiedlength
     * @since windows8.0
     */
    static WindowsSubstringWithSpecifiedLength(string, startIndex, length, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsSubstringWithSpecifiedLength", "ptr", string, "uint", startIndex, "uint", length, "ptr", newString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Concatenates two specified strings.
     * @param {Pointer<Void>} string1 Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The first string to be concatenated.
     * @param {Pointer<Void>} string2 Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The second string to be concatenated.
     * @param {Pointer<Void>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * The concatenation of <i>string1</i> and <i>string2</i>. If <i>string1</i> and <i>string2</i> are <b>NULL</b>, <i>newString</i> is <b>NULL</b>. If either <i>string1</i> or <i>string2</i> is <b>NULL</b>, <i>newString</i> is a copy of the non-null string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsconcatstring
     * @since windows8.0
     */
    static WindowsConcatString(string1, string2, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsConcatString", "ptr", string1, "ptr", string2, "ptr", newString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Replaces all occurrences of a set of characters in the specified string with another set of characters to create a new string.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The original string.
     * @param {Pointer<Void>} stringReplaced Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be replaced.
     * @param {Pointer<Void>} stringReplaceWith Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to replace all occurrences of <i>stringReplaced</i>. 
     * If this parameter is <b>NULL</b>, all instances of <i>stringReplaced</i> are removed.
     * @param {Pointer<Void>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * A string that is equivalent to the original, except that all instances of <i>stringReplaced</i> are replaced with <i>stringReplaceWith</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsreplacestring
     * @since windows8.0
     */
    static WindowsReplaceString(string, stringReplaced, stringReplaceWith, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsReplaceString", "ptr", string, "ptr", stringReplaced, "ptr", stringReplaceWith, "ptr", newString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes all leading occurrences of a specified set of characters from the source string.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be trimmed.
     * @param {Pointer<Void>} trimString Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The characters to remove from <i>string</i>.
     * @param {Pointer<Void>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * The string that remains after all occurrences of characters in the <i>trimString</i> parameter are removed from the start of <i>string</i>, or <b>NULL</b> if <i>trimString</i> contains all of the characters in <i>string</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowstrimstringstart
     * @since windows8.0
     */
    static WindowsTrimStringStart(string, trimString, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsTrimStringStart", "ptr", string, "ptr", trimString, "ptr", newString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes all trailing occurrences of a specified set of characters from the source string.
     * @param {Pointer<Void>} string Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The string to be trimmed.
     * @param {Pointer<Void>} trimString Type: [in] **[HSTRING](/windows/win32/winrt/hstring)**
     * 
     * The characters to remove from <i>string</i>.
     * @param {Pointer<Void>} newString Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * The string that remains after all occurrences of characters in the <i>trimString</i> parameter are removed from the end of <i>string</i>, or <b>NULL</b> if <i>trimString</i> contains all of the characters in <i>string</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowstrimstringend
     * @since windows8.0
     */
    static WindowsTrimStringEnd(string, trimString, newString) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsTrimStringEnd", "ptr", string, "ptr", trimString, "ptr", newString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allocates a mutable character buffer for use in HSTRING creation.
     * @param {Integer} length Type: [in] <b>UINT32</b>
     * 
     * The size of the buffer to allocate. A value of zero corresponds to the empty string.
     * @param {Pointer<UInt16>} charBuffer Type: [out] <b>WCHAR**</b>
     * 
     * The mutable buffer that holds the characters. Note that the buffer already contains a terminating <b>NULL</b> character.
     * @param {Pointer<Void>} bufferHandle Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring-buffer">HSTRING_BUFFER</a>*</b>
     * 
     * The preallocated string buffer, or <b>NULL</b> if  <i>length</i> is 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowspreallocatestringbuffer
     * @since windows8.0
     */
    static WindowsPreallocateStringBuffer(length, charBuffer, bufferHandle) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsPreallocateStringBuffer", "uint", length, "ptr", charBuffer, "ptr", bufferHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an HSTRING from the specified HSTRING_BUFFER.
     * @param {Pointer<Void>} bufferHandle Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring-buffer">HSTRING_BUFFER</a></b>
     * 
     * The buffer to use for the new [**HSTRING**](/windows/win32/winrt/hstring). You must use the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspreallocatestringbuffer">WindowsPreallocateStringBuffer</a> function to create the <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring-buffer">HSTRING_BUFFER</a>.
     * @param {Pointer<Void>} string Type: [out] <b>[**HSTRING**](/windows/win32/winrt/hstring)*</b>
     * 
     * The newly created [**HSTRING**](/windows/win32/winrt/hstring) that contains the contents of <i>bufferHandle</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * <i>bufferHandle</i> was not created by calling the <a href="/windows/desktop/api/winstring/nf-winstring-windowspreallocatestringbuffer">WindowsPreallocateStringBuffer</a> function, or the caller has overwritten the   terminating NUL character in  <i>bufferHandle</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowspromotestringbuffer
     * @since windows8.0
     */
    static WindowsPromoteStringBuffer(bufferHandle, string) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsPromoteStringBuffer", "ptr", bufferHandle, "ptr", string, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Discards a preallocated string buffer if it was not promoted to an HSTRING.
     * @param {Pointer<Void>} bufferHandle Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring-buffer">HSTRING_BUFFER</a></b>
     * 
     * The buffer to discard. The <b>WindowsDeleteStringBuffer</b> function raises an exception if <i>bufferHandle</i> was not allocated by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowspreallocatestringbuffer">WindowsPreallocateStringBuffer</a> function.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsdeletestringbuffer
     * @since windows8.0
     */
    static WindowsDeleteStringBuffer(bufferHandle) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsDeleteStringBuffer", "ptr", bufferHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides a way to for debuggers to display the value of an Windows Runtime�HSTRING in another address space, remotely, or from a dump.
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
     * @returns {HRESULT} This function can return one of these values.
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsinspectstring
     * @since windows8.0
     */
    static WindowsInspectString(targetHString, machine, callback, context, length, targetStringAddress) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-0.dll\WindowsInspectString", "ptr", targetHString, "ushort", machine, "ptr", callback, "ptr", context, "uint*", length, "ptr*", targetStringAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides a way to for debuggers to display the value of an Windows Runtime�HSTRING in another address space, remotely, or from a dump.
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
     * @returns {HRESULT} This function can return one of these values.
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
     * @see https://docs.microsoft.com/windows/win32/api//winstring/nf-winstring-windowsinspectstring2
     * @since windows8.0
     */
    static WindowsInspectString2(targetHString, machine, callback, context, length, targetStringAddress) {
        result := DllCall("api-ms-win-core-winrt-string-l1-1-1.dll\WindowsInspectString2", "uint", targetHString, "ushort", machine, "ptr", callback, "ptr", context, "uint*", length, "uint*", targetStringAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a DispatcherQueueController on the caller's thread. Use the created DispatcherQueueController to create and manage the lifetime of a DispatcherQueue to run queued tasks in priority order on the Dispatcher queue's thread.
     * @param {Pointer} options The threading affinity and type of COM apartment for the created <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a>. See remarks for details.
     * @param {Pointer<DispatcherQueueController>} dispatcherQueueController The created dispatcher queue controller. 
     * 
     * <div class="alert"><b>Important</b>  The <a href="https://docs.microsoft.com/uwp/api/windows.system.dispatcherqueuecontroller">DispatcherQueueController</a> is a WinRT object.</div>
     * <div> </div>
     * @returns {HRESULT} <b>S_OK</b> for success; otherwise a failure code.
     * @see https://docs.microsoft.com/windows/win32/api//dispatcherqueue/nf-dispatcherqueue-createdispatcherqueuecontroller
     */
    static CreateDispatcherQueueController(options, dispatcherQueueController) {
        result := DllCall("CoreMessaging.dll\CreateDispatcherQueueController", "ptr", options, "ptr", dispatcherQueueController, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes the Windows Runtime on the current thread with the specified concurrency model.
     * @param {Integer} initType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a></b>
     * 
     * The concurrency model for the thread. The default is <b>RO_INIT_MULTITHREADED</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * A previous call to <a href="/windows/desktop/api/roapi/nf-roapi-roinitialize">RoInitialize</a> specified the concurrency model for this thread as multithread apartment (MTA). This could also indicate that a change from neutral-threaded apartment to single-threaded apartment has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-roinitialize
     * @since windows8.0
     */
    static RoInitialize(initType) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoInitialize", "int", initType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes the Windows Runtime on the current thread.
     * @remarks
     * 
     * Call the <b>RoUninitialize</b> function to close the Windows Runtime on the current thread. This unloads all DLLs loaded by the thread, frees any other resources that the thread maintains, and forces all RPC connections on the thread to close.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roinitialize">RoInitialize</a> function to initialize a thread in the Windows Runtime.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-rouninitialize
     * @since windows8.0
     */
    static RoUninitialize() {
        DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoUninitialize")
    }

    /**
     * Activates the specified Windows Runtime class.
     * @param {Pointer<Void>} activatableClassId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * The class identifier that is associated with the activatable runtime class.
     * @param {Pointer<IInspectable>} instance Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>**</b>
     * 
     * A pointer to the activated instance of the runtime class.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * The thread has not been initialized in the Windows Runtime by calling the <a href="/windows/desktop/api/roapi/nf-roapi-roinitialize">RoInitialize</a> function.
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
     * The <a href="/windows/desktop/api/inspectable/ne-inspectable-trustlevel">TrustLevel</a> for the class requires a full-trust process.
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
     * The <a href="/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> interface is not implemented by the specified class.
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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-roactivateinstance
     * @since windows8.0
     */
    static RoActivateInstance(activatableClassId, instance) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoActivateInstance", "ptr", activatableClassId, "ptr", instance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers an array out-of-process activation factories for a Windows Runtime exe server.
     * @param {Pointer<Void>} activatableClassIds Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
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
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * The thread has not been initialized in the Windows Runtime by calling the <a href="/windows/desktop/api/roapi/nf-roapi-roinitialize">RoInitialize</a> function.
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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-roregisteractivationfactories
     * @since windows8.0
     */
    static RoRegisterActivationFactories(activatableClassIds, activationFactoryCallbacks, count, cookie) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoRegisterActivationFactories", "ptr", activatableClassIds, "ptr", activationFactoryCallbacks, "uint", count, "ptr*", cookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes an array of registered activation factories from the Windows Runtime.
     * @remarks
     * 
     * Call the <b>RoRevokeActivationFactories</b> function remove the activation factories represented in the  <i>cookie</i> array from the Windows Runtime.
     * 
     * 
     * @param {Pointer} cookie Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/ro-registration-cookie">RO_REGISTRATION_COOKIE</a></b>
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-rorevokeactivationfactories
     * @since windows8.0
     */
    static RoRevokeActivationFactories(cookie) {
        DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoRevokeActivationFactories", "ptr", cookie)
    }

    /**
     * Gets the activation factory for the specified runtime class.
     * @param {Pointer<Void>} activatableClassId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * The ID of the activatable class.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The reference ID of the interface.
     * @param {Pointer<Void>} factory Type: <b>void**</b>
     * 
     * The activation factory.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-rogetactivationfactory
     * @since windows8.0
     */
    static RoGetActivationFactory(activatableClassId, iid, factory) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoGetActivationFactory", "ptr", activatableClassId, "ptr", iid, "ptr", factory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers an IApartmentShutdown callback to be invoked when the current apartment shuts down.
     * @param {Pointer<IApartmentShutdown>} callbackObject The application-supplied <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iapartmentshutdown">IApartmentShutdown</a> interface.
     * @param {Pointer<UInt64>} apartmentIdentifier The identifier for the current apartment.
     * @param {Pointer<Void>} regCookie A cookie that you can use to unregister the callback.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-roregisterforapartmentshutdown
     * @since windows8.0
     */
    static RoRegisterForApartmentShutdown(callbackObject, apartmentIdentifier, regCookie) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoRegisterForApartmentShutdown", "ptr", callbackObject, "uint*", apartmentIdentifier, "ptr", regCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters a previously registered IApartmentShutdown interface.
     * @param {Pointer<Void>} regCookie A registration cookie obtained from a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roregisterforapartmentshutdown">RoRegisterForApartmentShutdown</a> function.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-rounregisterforapartmentshutdown
     * @since windows8.0
     */
    static RoUnregisterForApartmentShutdown(regCookie) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoUnregisterForApartmentShutdown", "ptr", regCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a unique identifier for the current apartment.
     * @param {Pointer<UInt64>} apartmentIdentifier A process-unique identifier for the current apartment.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-rogetapartmentidentifier
     * @since windows8.0
     */
    static RoGetApartmentIdentifier(apartmentIdentifier) {
        result := DllCall("api-ms-win-core-winrt-l1-1-0.dll\RoGetApartmentIdentifier", "uint*", apartmentIdentifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides a standard IBuffer marshaler to implement the semantics associated with the IBuffer interface when it is marshaled.
     * @param {Pointer<IMarshal>} bufferMarshaler pointer to Windows Runtime IBuffer marshaler
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//robuffer/nf-robuffer-rogetbuffermarshaler
     * @since windows8.0
     */
    static RoGetBufferMarshaler(bufferMarshaler) {
        result := DllCall("api-ms-win-core-winrt-robuffer-l1-1-0.dll\RoGetBufferMarshaler", "ptr", bufferMarshaler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the current reporting behavior of Windows Runtime error functions.
     * @param {Pointer<UInt32>} pflags Type: <b>UINT32*</b>
     * 
     * A pointer to the bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/ne-roerrorapi-roerrorreportingflags">RO_ERROR_REPORTING_FLAGS</a> values that represents the current error-reporting behavior.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-rogeterrorreportingflags
     * @since windows8.0
     */
    static RoGetErrorReportingFlags(pflags) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoGetErrorReportingFlags", "uint*", pflags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the reporting behavior of Windows Runtime error functions.
     * @param {Integer} flags Type: <b>UINT32</b>
     * 
     * A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/ne-roerrorapi-roerrorreportingflags">RO_ERROR_REPORTING_FLAGS</a> values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-roseterrorreportingflags
     * @since windows8.0
     */
    static RoSetErrorReportingFlags(flags) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoSetErrorReportingFlags", "uint", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the IRestrictedErrorInfo interface pointer based on the given reference.
     * @param {Pointer<Char>} reference Type: <b>PCWSTR</b>
     * 
     * Identifies an error object which contains relevant information for the specific error.
     * @param {Pointer<IRestrictedErrorInfo>} ppRestrictedErrorInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a>**</b>
     * 
     * The output parameter for the object associated with the given reference.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-roresolverestrictederrorinforeference
     * @since windows8.0
     */
    static RoResolveRestrictedErrorInfoReference(reference, ppRestrictedErrorInfo) {
        reference := reference is String? StrPtr(reference) : reference

        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoResolveRestrictedErrorInfoReference", "ptr", reference, "ptr", ppRestrictedErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the restricted error information object for the current thread.
     * @param {Pointer<IRestrictedErrorInfo>} pRestrictedErrorInfo The restricted error information object associated with the current thread.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-setrestrictederrorinfo
     * @since windows8.0
     */
    static SetRestrictedErrorInfo(pRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\SetRestrictedErrorInfo", "ptr", pRestrictedErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the restricted error information object set by a previous call to SetRestrictedErrorInfo in the current logical thread.
     * @param {Pointer<IRestrictedErrorInfo>} ppRestrictedErrorInfo The restricted error info object associated with the current thread.
     * @returns {HRESULT} This function can return one of these values.
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-getrestrictederrorinfo
     * @since windows8.0
     */
    static GetRestrictedErrorInfo(ppRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\GetRestrictedErrorInfo", "ptr", ppRestrictedErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reports an error and an informative string to an attached debugger.
     * @param {HRESULT} error Type: <b>HRESULT</b>
     * 
     * The error code associated with the error condition. If <i>error</i> is a success code, such as <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>. This behavior enables calling the function when no error has occurred without causing an unwanted error message.
     * @param {Integer} cchMax Type: <b>UINT</b>
     * 
     * The maximum number of characters in <i>message</i>, excluding the terminating <b>NUL</b> character. If the value is 0, the string is read to the first <b>NUL</b> character or 512 characters, whichever is less. If <i>cchMax</i> is greater than 512, all characters after 512 are ignored.
     * @param {Pointer<Char>} message Type: <b>PCWSTR</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-rooriginateerrorw
     * @since windows8.0
     */
    static RoOriginateErrorW(error, cchMax, message) {
        message := message is String? StrPtr(message) : message

        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoOriginateErrorW", "int", error, "uint", cchMax, "ptr", message, "int")
        return result
    }

    /**
     * Reports an error and an informative string to an attached debugger.
     * @param {HRESULT} error Type: <b>HRESULT</b>
     * 
     * The error code associated with the error condition. If <i>error</i> is a success code, such as <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>. This behavior enables calling the function when no error has occurred without causing an unwanted error message.
     * @param {Pointer<Void>} message Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-rooriginateerror
     * @since windows8.0
     */
    static RoOriginateError(error, message) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoOriginateError", "int", error, "ptr", message, "int")
        return result
    }

    /**
     * Reports a transformed error and an informative string to an attached debugger.
     * @param {HRESULT} oldError Type: <b>HRESULT</b>
     * 
     * The original error code associated with the error condition.
     * @param {HRESULT} newError Type: <b>HRESULT</b>
     * 
     * The custom error code to associate with the error condition. If <i>oldError</i> and <i>newError</i>  are the same, or both are success codes, such as <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>.
     * @param {Integer} cchMax Type: <b>UINT</b>
     * 
     * The maximum number of characters in <i>message</i>, excluding the terminating null character. If the value is 0, the string is read to the first null character or 512 characters, whichever is less. If <i>cchMax</i> is greater than 512, all characters after 512 are ignored.
     * @param {Pointer<Char>} message Type: <b>PCWSTR</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-rotransformerrorw
     * @since windows8.0
     */
    static RoTransformErrorW(oldError, newError, cchMax, message) {
        message := message is String? StrPtr(message) : message

        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoTransformErrorW", "int", oldError, "int", newError, "uint", cchMax, "ptr", message, "int")
        return result
    }

    /**
     * Reports a modified error and an informative string to an attached debugger.
     * @param {HRESULT} oldError Type: <b>HRESULT</b>
     * 
     * The original error code associated with the error condition.
     * @param {HRESULT} newError Type: <b>HRESULT</b>
     * 
     * A different  error code to associate with the error condition. If <i>oldError</i> and <i>newError</i>  are the same, or both are success codes, such as <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>.
     * @param {Pointer<Void>} message Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-rotransformerror
     * @since windows8.0
     */
    static RoTransformError(oldError, newError, message) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoTransformError", "int", oldError, "int", newError, "ptr", message, "int")
        return result
    }

    /**
     * Saves the current error context so that it's available for later calls to the RoFailFastWithErrorContext function.
     * @param {HRESULT} hr The <b>HRESULT</b> associated with the error.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-rocaptureerrorcontext
     * @since windows8.0
     */
    static RoCaptureErrorContext(hr) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoCaptureErrorContext", "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Raises a non-continuable exception in the current process.
     * @remarks
     * 
     * The <b>RoFailFastWithErrorContext</b> function raises a non-continuable exception in the current process when an unhandled failure is encountered, which  prevents the process from continuing execution in an undefined state.
     * 
     * Call the <b>RoFailFastWithErrorContext</b> function when a failure occurs in a completion delegate for a completed asynchronous operation, or  when a failure occurs in an event handler when an event is raised.
     * 
     * The process that calls <b>RoFailFastWithErrorContext</b> is terminated by a call to <a href="https://docs.microsoft.com/previous-versions/dd408166(v=vs.85)">RaiseFailFastException</a>.  The function does not validate the parameters and raises an exception for any value of the inputs.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rocaptureerrorcontext">RoCaptureErrorContext</a> function to save an <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> object that's associated with the current thread. The <b>RoFailFastWithErrorContext</b> function uses this contextual information to report the error call stack to the Windows Error Reporting service (WER), if it's enabled.
     * 
     * 
     * @param {HRESULT} hrError The <b>HRESULT</b> associated with the current error. The exception is raised for any value of <i>hrError</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-rofailfastwitherrorcontext
     * @since windows8.0
     */
    static RoFailFastWithErrorContext(hrError) {
        DllCall("api-ms-win-core-winrt-error-l1-1-0.dll\RoFailFastWithErrorContext", "int", hrError)
    }

    /**
     * Reports an error, an informative string, and an error object to an attached debugger.
     * @param {HRESULT} error The error code associated with the error condition. If <i>error</i> is a success code, like <b>S_OK</b>, the function has no effect and returns <b>FALSE</b>. This behavior enables calling the function when no error has occurred without causing an unwanted error message.
     * @param {Pointer<Void>} message An informative string to help developers to correct the reported error condition. The maximum length is 512 characters, including the trailing <b>NUL</b> character; longer strings are truncated.
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-rooriginatelanguageexception
     * @since windows8.1
     */
    static RoOriginateLanguageException(error, message, languageException) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoOriginateLanguageException", "int", error, "ptr", message, "ptr", languageException, "int")
        return result
    }

    /**
     * Removes existing error information from the current thread environment block (TEB).
     * @remarks
     * 
     * Call the <b>RoClearError</b> function to remove existing thread error information from the thread environment block (TEB). If COM is not initialized, this call does nothing to create the TEB slot for this information. Language projections call this function to ensure there's no stale error information on the thread.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-roclearerror
     * @since windows8.1
     */
    static RoClearError() {
        DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoClearError")
    }

    /**
     * Triggers the Global Error Handler when an unhandled exception occurs.
     * @param {Pointer<IRestrictedErrorInfo>} pRestrictedErrorInfo The error to report. Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-getrestrictederrorinfo">GetRestrictedErrorInfo</a> function to get the <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> that represents the error.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-roreportunhandlederror
     */
    static RoReportUnhandledError(pRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoReportUnhandledError", "ptr", pRestrictedErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the error object that represents the call stack at the point where the error originated.
     * @param {Pointer} targetTebAddress The target thread environment block (TEB).
     * @param {Integer} machine The machine to debug.
     * @param {Pointer<PINSPECT_MEMORY_CALLBACK>} readMemoryCallback A callback function to read the buffer from the target TEB address space.
     * @param {Pointer<Void>} context Custom context data.
     * @param {Pointer<UIntPtr>} targetErrorInfoAddress The address of the error object.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-roinspectthreaderrorinfo
     * @since windows8.1
     */
    static RoInspectThreadErrorInfo(targetTebAddress, machine, readMemoryCallback, context, targetErrorInfoAddress) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoInspectThreadErrorInfo", "ptr", targetTebAddress, "ushort", machine, "ptr", readMemoryCallback, "ptr", context, "ptr*", targetErrorInfoAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides a way to for debuggers to inspect a call stack from a target process.
     * @param {Pointer} targetErrorInfoAddress The address of the error info object in the target process. Get the <i>targetErrorInfoAddress</i> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roinspectthreaderrorinfo">RoInspectThreadErrorInfo</a> function.
     * @param {Integer} machine The machine to debug.
     * @param {Pointer<PINSPECT_MEMORY_CALLBACK>} readMemoryCallback A callback function to read the buffer from the target TEB address space.
     * @param {Pointer<Void>} context Custom context data.
     * @param {Pointer<UInt32>} frameCount The number of stack frames stored in the error object.
     * @param {Pointer<UIntPtr>} targetBackTraceAddress The stack back trace address in the target process.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-roinspectcapturedstackbacktrace
     * @since windows8.1
     */
    static RoInspectCapturedStackBackTrace(targetErrorInfoAddress, machine, readMemoryCallback, context, frameCount, targetBackTraceAddress) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoInspectCapturedStackBackTrace", "ptr", targetErrorInfoAddress, "ushort", machine, "ptr", readMemoryCallback, "ptr", context, "uint*", frameCount, "ptr*", targetBackTraceAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrIn 
     * @param {Pointer<IRestrictedErrorInfo>} ppRestrictedErrorInfo 
     * @returns {HRESULT} 
     */
    static RoGetMatchingRestrictedErrorInfo(hrIn, ppRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoGetMatchingRestrictedErrorInfo", "int", hrIn, "ptr", ppRestrictedErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Triggers the Global Error Handler when a delegate failure occurs.
     * @param {Pointer<IUnknown>} punkDelegate The delegate to report.
     * @param {Pointer<IRestrictedErrorInfo>} pRestrictedErrorInfo The error to report. Call the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-getrestrictederrorinfo">GetRestrictedErrorInfo</a> function to get the <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> that represents the error.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-roreportfaileddelegate
     */
    static RoReportFailedDelegate(punkDelegate, pRestrictedErrorInfo) {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\RoReportFailedDelegate", "ptr", punkDelegate, "ptr", pRestrictedErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates whether the CoreApplication.UnhandledErrorDetected event occurs for the errors that are returned by the delegate registered as a callback function for a Windows Runtime API event or the completion of an asynchronous method.
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
     * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/nf-roerrorapi-iserrorpropagationenabled
     * @since windows8.0
     */
    static IsErrorPropagationEnabled() {
        result := DllCall("api-ms-win-core-winrt-error-l1-1-1.dll\IsErrorPropagationEnabled", "int")
        return result
    }

    /**
     * Retrieves the activatable classes that are registered for a given executable (EXE) server, which was registered under the package ID of the calling process.
     * @param {Pointer<Void>} serverName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * The name of the server to retrieve class registrations for. This server name is passed on the command line when the server is activated.
     * @param {Pointer<Void>} activatableClassIds Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>**</b>
     * 
     * A callee-allocated array of activatable class ID strings which the server is registered to serve. The strings must be released by the caller using the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> function. The buffer must then be released using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. The server (caller) is responsible for registering the activation factories for these classes.
     * @param {Pointer<UInt32>} count Type: <b>DWORD*</b>
     * 
     * The count of activatable class IDs returned in the <i>activatableClassIds</i> array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//roregistrationapi/nf-roregistrationapi-rogetserveractivatableclasses
     * @since windows8.0
     */
    static RoGetServerActivatableClasses(serverName, activatableClassIds, count) {
        result := DllCall("api-ms-win-core-winrt-registration-l1-1-0.dll\RoGetServerActivatableClasses", "ptr", serverName, "ptr", activatableClassIds, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a Windows Runtime random access stream for a file.
     * @param {Pointer<Char>} filePath The fully qualified path of the file to encapsulate.
     * @param {Integer} accessMode An <a href="https://docs.microsoft.com/uwp/api/Windows.Storage.FileAccessMode">AccessMode</a> value that specifies the behavior of the <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream">RandomAccessStream</a> that encapsulates the file.
     * @param {Pointer<Guid>} riid A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_RandomAccessStream.
     * @param {Pointer<Void>} ppv When this method returns successfully, contains the interface pointer requested in <i>riid</i>, typically the <a href="https://docs.microsoft.com/previous-versions/hh438400(v=vs.85)">IRandomAccessStream</a> that encapsulates the file.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shcore/nf-shcore-createrandomaccessstreamonfile
     * @since windows8.0
     */
    static CreateRandomAccessStreamOnFile(filePath, accessMode, riid, ppv) {
        filePath := filePath is String? StrPtr(filePath) : filePath

        result := DllCall("api-ms-win-shcore-stream-winrt-l1-1-0.dll\CreateRandomAccessStreamOnFile", "ptr", filePath, "uint", accessMode, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a Windows Runtime random access stream around an IStream base implementation.
     * @param {Pointer<IStream>} stream The COM stream to encapsulate.
     * @param {Integer} options One of the <a href="https://docs.microsoft.com/windows/desktop/api/shcore/ne-shcore-bsos_options">BSOS_OPTIONS</a> options that specify the behavior of the <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream">RandomAccessStream</a> that encapsulates <i>stream</i>.
     * @param {Pointer<Guid>} riid A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_RandomAccessStream.
     * @param {Pointer<Void>} ppv When this method returns successfully, contains the interface pointer to the <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream">RandomAccessStream</a> that encapsulates <i>stream</i> requested in <i>riid</i>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shcore/nf-shcore-createrandomaccessstreamoverstream
     * @since windows8.0
     */
    static CreateRandomAccessStreamOverStream(stream, options, riid, ppv) {
        result := DllCall("api-ms-win-shcore-stream-winrt-l1-1-0.dll\CreateRandomAccessStreamOverStream", "ptr", stream, "int", options, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IStream around a Windows Runtime IRandomAccessStream object.
     * @param {Pointer<IUnknown>} randomAccessStream The source <a href="https://docs.microsoft.com/previous-versions/hh438400(v=vs.85)">IRandomAccessStream</a>.
     * @param {Pointer<Guid>} riid A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_IStream. This object encapsulates <i>randomAccessStream</i>.
     * @param {Pointer<Void>} ppv When this method returns successfully, contains the interface pointer requested in <i>riid</i>, typically <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shcore/nf-shcore-createstreamoverrandomaccessstream
     * @since windows8.0
     */
    static CreateStreamOverRandomAccessStream(randomAccessStream, riid, ppv) {
        result := DllCall("api-ms-win-shcore-stream-winrt-l1-1-0.dll\CreateStreamOverRandomAccessStream", "ptr", randomAccessStream, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a ICoreInputSourceBase object in the caller’s UI thread.
     * @param {Pointer<Guid>} riid Interface ID of the object. Must to be set to the UUID for  <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a>, which is 9F488807-4580-4BE8-BE68-92A9311713BB.
     * @param {Pointer<Void>} ppv Pointer to receive the <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//corewindow/nf-corewindow-createcontrolinput
     */
    static CreateControlInput(riid, ppv) {
        result := DllCall("Windows.UI.dll\CreateControlInput", "ptr", riid, "ptr", ppv, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a ICoreInputSourceBase object in a worker thread or the UI thread.
     * @param {Pointer<IUnknown>} pCoreWindow Pointer to the parent <a href="https://msdn.microsoft.com/60b1c8c6-c136-4c4c-8e46-69a792d58ed0">CoreWindow</a> to which the <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object will be attached. This parameter can’t be NULL.
     * @param {Pointer<Guid>} riid Interface ID of the object. Must to be set to the UUID for  <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a>, which is 9F488807-4580-4BE8-BE68-92A9311713BB.
     * @param {Pointer<Void>} ppv Pointer to receive the <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icoreinputsourcebase">ICoreInputSourceBase</a> object.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//corewindow/nf-corewindow-createcontrolinputex
     */
    static CreateControlInputEx(pCoreWindow, riid, ppv) {
        result := DllCall("Windows.UI.dll\CreateControlInputEx", "ptr", pCoreWindow, "ptr", riid, "ptr", ppv, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
