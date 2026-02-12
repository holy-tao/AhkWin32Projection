#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Defines operations and session settings.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nn-wsmandisp-iwsmansession
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManSession extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManSession
     * @type {Guid}
     */
    static IID => Guid("{fc84fc58-1286-40c4-9da0-c8ef6ec241e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Get", "Put", "Create", "Delete", "Invoke", "Enumerate", "Identify", "get_Error", "get_BatchItems", "put_BatchItems", "get_Timeout", "put_Timeout"]

    /**
     * @type {BSTR} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * @type {Integer} 
     */
    BatchItems {
        get => this.get_BatchItems()
        set => this.put_BatchItems(value)
    }

    /**
     * @type {Integer} 
     */
    Timeout {
        get => this.get_Timeout()
        set => this.put_Timeout(value)
    }

    /**
     * Retrieves the resource specified by the URI and returns an XML representation of the current instance of the resource.
     * @param {VARIANT} resourceUri The identifier of the resource to be retrieved.
     * 
     * This parameter can contain one of the following:
     * 
     * <ul>
     * <li>URI with or without  <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">selectors</a>. When calling the <a href="https://docs.microsoft.com/windows/desktop/WinRM/session-get">Get</a> method to obtain a WMI resource, use the key property or properties of the object.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a> object which may contain selectors,  <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">fragments</a>, or <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">options</a>.</li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">WS-Addressing</a> endpoint reference as described in the WS-Management protocol  standard.  For more information about the public specification for the WS-Management protocol, see <a href="https://docs.microsoft.com/previous-versions/dotnet/articles/ms951267(v=msdn.10)">Management Specifications Index Page</a>.</li>
     * </ul>
     * @param {Integer} flags Reserved for future use. Must be set to 0.
     * @returns {BSTR} A value that, upon success, is an XML representation of the resource.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-get
     */
    Get(resourceUri, flags) {
        resource := BSTR()
        result := ComCall(7, this, "ptr", resourceUri, "int", flags, "ptr", resource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return resource
    }

    /**
     * Updates a resource.
     * @param {VARIANT} resourceUri The identifier of the resource to be updated.
     * 
     * This parameter can contain one of the following:
     * 
     * <ul>
     * <li>URI with or without <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">selectors</a>. When calling the <b>Put</b> method to obtain a WMI resource, use the key property or properties of the object.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a> object which may contain selectors,  <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">fragments</a>, or <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">options</a>.</li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">WS-Addressing</a> endpoint reference as described in the WS-Management protocol  standard.  For more information about the public specification for the WS-Management protocol, see <a href="https://docs.microsoft.com/previous-versions/dotnet/articles/ms951267(v=msdn.10)">Management Specifications Index Page</a>.</li>
     * </ul>
     * @param {BSTR} resource The updated resource content.
     * @param {Integer} flags Reserved for future use. Must be set to 0.
     * @returns {BSTR} The XML stream that contains the updated resource content.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-put
     */
    Put(resourceUri, resource, flags) {
        if(resource is String) {
            pin := BSTR.Alloc(resource)
            resource := pin.Value
        }

        resultResource := BSTR()
        result := ComCall(8, this, "ptr", resourceUri, "ptr", resource, "int", flags, "ptr", resultResource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return resultResource
    }

    /**
     * Creates a new instance of a resource and returns the endpoint reference (EPR) of the new object.
     * @remarks
     * <b>IWSManSession::Create</b> is only used for creating new 
     *     instances of a resource. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmansession-put">IWSManSession::Put</a> method to 
     *     update existing instances of a resource. After you obtain the new resource URI, you can call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmansession-get">IWSManSession::Get</a> to retrieve the new object. The new object 
     *     contains any properties that the resource provider assigns when creating the new object. For example, if you 
     *     create a new WS-Management protocol<a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">listener</a> and retrieve the listener object using <a href="https://docs.microsoft.com/windows/desktop/WinRM/session-get">Session.Get</a>, then you also obtain the <b>Port</b>, <b>Enabled</b>, and <b>ListeningOn</b> properties.
     * @param {VARIANT} resourceUri The identifier of the resource to create.
     * 
     * This parameter can contain one of the following:
     * 
     * <ul>
     * <li>URI with one or more  <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">selectors</a>. Be aware that the <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">WMI plug-in</a> does not support creating any resource other than a WS-Management protocol listener.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a> object which may contain selectors,  <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">fragments</a>, or <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">options</a>.</li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">WS-Addressing</a> endpoint reference as described in the WS-Management protocol  standard.  For more information about the public specification for the WS-Management protocol, see  <a href="https://docs.microsoft.com/previous-versions/dotnet/articles/ms951267(v=msdn.10)">Management Specifications Index Page</a>.</li>
     * </ul>
     * @param {BSTR} resource An XML string that contains resource content.
     * @param {Integer} flags Reserved. Must be set to 0.
     * @returns {BSTR} The EPR of the new resource.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-create
     */
    Create(resourceUri, resource, flags) {
        if(resource is String) {
            pin := BSTR.Alloc(resource)
            resource := pin.Value
        }

        newUri := BSTR()
        result := ComCall(9, this, "ptr", resourceUri, "ptr", resource, "int", flags, "ptr", newUri, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return newUri
    }

    /**
     * Deletes the resource specified in the resource URI.
     * @param {VARIANT} resourceUri The URI of the resource to be deleted. You can also use an <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a> object to specify the resource.
     * @param {Integer} flags Reserved for future use. Must be set to 0.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-delete
     */
    Delete(resourceUri, flags) {
        result := ComCall(10, this, "ptr", resourceUri, "int", flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Invokes a method and returns the results of the method call.
     * @param {BSTR} actionUri The URI of the method to invoke.
     * @param {VARIANT} resourceUri The identifier of the resource to invoke a method.
     * 
     * This parameter can contain one of the following:
     * 
     * <ul>
     * <li>URI with or without <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">selectors</a>.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/WinRM/resourcelocator">ResourceLocator</a> object which may contain selectors,  <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">fragments</a>, or <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">options</a>.</li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">WS-Addressing</a> endpoint reference as described in the WS-Management protocol  standard.  For more information about the public specification for the WS-Management protocol, see <a href="https://docs.microsoft.com/previous-versions/dotnet/articles/ms951267(v=msdn.10)">Management Specifications Index Page</a>.</li>
     * </ul>
     * @param {BSTR} parameters An XML representation of the input for the method. This string must be supplied or this method will fail.
     * @param {Integer} flags Reserved for future use. Must be set to 0.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-invoke
     */
    Invoke(actionUri, resourceUri, parameters, flags) {
        if(actionUri is String) {
            pin := BSTR.Alloc(actionUri)
            actionUri := pin.Value
        }
        if(parameters is String) {
            pin := BSTR.Alloc(parameters)
            parameters := pin.Value
        }

        result_ := BSTR()
        result := ComCall(11, this, "ptr", actionUri, "ptr", resourceUri, "ptr", parameters, "int", flags, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Enumerates a table, data collection, or log resource.
     * @remarks
     * Call <b>IWSManSession::Enumerate</b> to start an enumeration operation. Thereafter, call <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmanenumerator-readitem">IWSManEnumerator::ReadItem</a> using the returned <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanenumerator">IWSManEnumerator</a> object until the end of items is indicated by the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmanenumerator-get_atendofstream">AtEndOfStream</a> property.
     * 
     * Be aware that if the flags include the <a href="https://docs.microsoft.com/windows/desktop/WinRM/enumeration-constants">Enumeration Constants</a> <b>WSManFlagHierarchyDeepBasePropsOnly</b> or <b>WSManFlagHierarchyShallow</b> then Windows Remote Management service returns the error code <b>ERROR_WSMAN_POLYMORPHISM_MODE_UNSUPPORTED</b>.
     * 
     * For more information about limiting network calls during an enumeration, see the <a href="https://docs.microsoft.com/windows/desktop/WinRM/session-batchitems">BatchItems</a> property.
     * 
     * If a filter is specified, it must be a valid document with respect to the schema of the resource. The dialect parameter is optional. However, if the filter string begins with &lt;, but is not an XML fragment, then  either  include the <i>dialect</i> parameter or set the <b>WSManFlagNonXmlText</b> flag in the <i>flags</i> parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinRM/enumeration-constants">Enumeration Constants</a>.
     * 
     * The corresponding scripting method is <a href="https://docs.microsoft.com/windows/desktop/WinRM/session-enumerate">Session.Enumerate</a>.
     * @param {VARIANT} resourceUri The identifier of the resource to be retrieved.
     * 
     * The following list contains identifiers that this parameter can contain:
     * 
     * <ul>
     * <li>URI with one or more  <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">selectors</a>. When calling the <b>Enumerate</b> method to obtain a WMI resource, use the key property or properties of the object.</li>
     * <li>You can use <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">selectors</a>,  <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">fragments</a>, or <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">options</a>. For  more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a>.</li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">WS-Addressing</a> endpoint reference as described in the WS-Management protocol  standard.  For more information about the public specification for the WS-Management protocol, see the <a href="https://docs.microsoft.com/previous-versions/dotnet/articles/ms951267(v=msdn.10)">Management Specifications Index Page</a>.</li>
     * </ul>
     * @param {BSTR} filter A filter that defines what items in the resource are returned by the enumeration. When the resource is enumerated,  only those items that match the filter criteria are returned. Including a <i>filter</i> parameter and a  <i>dialect</i> parameter in an enumeration converts the enumeration into a query.
     * 
     * If you have an <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a> object for the <i>resourceURI</i> parameter, then this parameter should not be used. Instead, use the selector and fragment functionality of  <b>IWSManResourceLocator</b>.
     * @param {BSTR} dialect The language used by the filter. <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/wql-sql-for-wmi">WQL</a>, a subset of SQL used by WMI,  is the only language supported.
     * 
     * If you have a <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a> object for the <i>resourceURI</i> parameter, then this parameter should not be used. Instead, use the selector and fragment functionality of  <b>IWSManResourceLocator</b>.
     * @param {Integer} flags This parameter must contain a flag in the <b>__WSManEnumFlags</b> enumeration. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinRM/enumeration-constants">Enumeration Constants</a>.
     * @returns {IDispatch} An <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanenumerator">IWSManEnumerator</a> object that contains the results of the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-enumerate
     */
    Enumerate(resourceUri, filter, dialect, flags) {
        if(filter is String) {
            pin := BSTR.Alloc(filter)
            filter := pin.Value
        }
        if(dialect is String) {
            pin := BSTR.Alloc(dialect)
            dialect := pin.Value
        }

        result := ComCall(12, this, "ptr", resourceUri, "ptr", filter, "ptr", dialect, "int", flags, "ptr*", &resultSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(resultSet)
    }

    /**
     * Queries a remote computer to determine if it supports the WS-Management protocol.
     * @param {Integer} flags The only flag that is accepted is <b>WSManFlagUseNoAuthentication</b>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-identify
     */
    Identify(flags) {
        result_ := BSTR()
        result := ComCall(13, this, "int", flags, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Gets additional error information in an XML stream for the preceding call to an IWSManSession object method.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-get_error
     */
    get_Error() {
        value := BSTR()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets and gets the number of items in each enumeration batch. (Get)
     * @remarks
     * This is an optimization feature that controls how often network calls are made between the client and the server. Currently, it is used only for enumerations. For more information about enumerating resources, see  <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanenumerator">IWSManEnumerator</a>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-get_batchitems
     */
    get_BatchItems() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets and gets the number of items in each enumeration batch. (Put)
     * @remarks
     * This is an optimization feature that controls how often network calls are made between the client and the server. Currently, it is used only for enumerations. For more information about enumerating resources, see  <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanenumerator">IWSManEnumerator</a>.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-put_batchitems
     */
    put_BatchItems(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets and gets the maximum amount of time, in milliseconds, that the client application waits for Windows Remote Management to complete its operations. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-get_timeout
     */
    get_Timeout() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets and gets the maximum amount of time, in milliseconds, that the client application waits for Windows Remote Management to complete its operations. (Put)
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wsmandisp/nf-wsmandisp-iwsmansession-put_timeout
     */
    put_Timeout(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
