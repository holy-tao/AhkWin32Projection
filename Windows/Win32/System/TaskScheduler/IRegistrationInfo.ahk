#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the administrative information that can be used to describe the task.
 * @remarks
 * 
 * Registration information can be used to identify a task through the Task Scheduler UI, or as search criteria when enumerating over the registered tasks.
 * 
 * When reading or writing XML for a task, registration information for the task is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-registrationinfo-tasktype-element">RegistrationInfo</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iregistrationinfo
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IRegistrationInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegistrationInfo
     * @type {Guid}
     */
    static IID => Guid("{416d8b73-cb41-4ea1-805c-9be9a5ac4a74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description", "put_Description", "get_Author", "put_Author", "get_Version", "put_Version", "get_Date", "put_Date", "get_Documentation", "put_Documentation", "get_XmlText", "put_XmlText", "get_URI", "put_URI", "get_SecurityDescriptor", "put_SecurityDescriptor", "get_Source", "put_Source"]

    /**
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     */
    Author {
        get => this.get_Author()
        set => this.put_Author(value)
    }

    /**
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     */
    Documentation {
        get => this.get_Documentation()
        set => this.put_Documentation(value)
    }

    /**
     */
    XmlText {
        get => this.get_XmlText()
        set => this.put_XmlText(value)
    }

    /**
     */
    URI {
        get => this.get_URI()
        set => this.put_URI(value)
    }

    /**
     */
    SecurityDescriptor {
        get => this.get_SecurityDescriptor()
        set => this.put_SecurityDescriptor(value)
    }

    /**
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets or sets the description of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the description of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-description-registrationinfotype-element">Description</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {Pointer<BSTR>} pDescription 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-get_description
     */
    get_Description(pDescription) {
        result := ComCall(7, this, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * Gets or sets the description of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the description of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-description-registrationinfotype-element">Description</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(8, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * Gets or sets the author of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the task author is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-author-registrationinfotype-element">Author</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {Pointer<BSTR>} pAuthor 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-get_author
     */
    get_Author(pAuthor) {
        result := ComCall(9, this, "ptr", pAuthor, "HRESULT")
        return result
    }

    /**
     * Gets or sets the author of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the task author is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-author-registrationinfotype-element">Author</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {BSTR} author 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-put_author
     */
    put_Author(author) {
        author := author is String ? BSTR.Alloc(author).Value : author

        result := ComCall(10, this, "ptr", author, "HRESULT")
        return result
    }

    /**
     * Gets or sets the version number of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the version number of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-version-registrationinfotype-element">Version</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-get_version
     */
    get_Version(pVersion) {
        result := ComCall(11, this, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * Gets or sets the version number of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the version number of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-version-registrationinfotype-element">Version</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} version 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-put_version
     */
    put_Version(version) {
        version := version is String ? BSTR.Alloc(version).Value : version

        result := ComCall(12, this, "ptr", version, "HRESULT")
        return result
    }

    /**
     * Gets or sets the date and time when the task is registered.
     * @remarks
     * 
     * When reading or writing XML for a task, the registration date is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-date-registrationinfotype-element">Date</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pDate 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-get_date
     */
    get_Date(pDate) {
        result := ComCall(13, this, "ptr", pDate, "HRESULT")
        return result
    }

    /**
     * Gets or sets the date and time when the task is registered.
     * @remarks
     * 
     * When reading or writing XML for a task, the registration date is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-date-registrationinfotype-element">Date</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} date 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-put_date
     */
    put_Date(date) {
        date := date is String ? BSTR.Alloc(date).Value : date

        result := ComCall(14, this, "ptr", date, "HRESULT")
        return result
    }

    /**
     * Gets or sets any additional documentation for the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the additional documentation for the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-documentation-registrationinfotype-element">Documentation</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {Pointer<BSTR>} pDocumentation 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-get_documentation
     */
    get_Documentation(pDocumentation) {
        result := ComCall(15, this, "ptr", pDocumentation, "HRESULT")
        return result
    }

    /**
     * Gets or sets any additional documentation for the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the additional documentation for the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-documentation-registrationinfotype-element">Documentation</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {BSTR} documentation 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-put_documentation
     */
    put_Documentation(documentation) {
        documentation := documentation is String ? BSTR.Alloc(documentation).Value : documentation

        result := ComCall(16, this, "ptr", documentation, "HRESULT")
        return result
    }

    /**
     * Gets or sets an XML-formatted version of the registration information for the task.
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-get_xmltext
     */
    get_XmlText(pText) {
        result := ComCall(17, this, "ptr", pText, "HRESULT")
        return result
    }

    /**
     * Gets or sets an XML-formatted version of the registration information for the task.
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-put_xmltext
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(18, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * Gets or sets the URI of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the task URI is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-uri-registrationinfotype-element">URI</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pUri 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-get_uri
     */
    get_URI(pUri) {
        result := ComCall(19, this, "ptr", pUri, "HRESULT")
        return result
    }

    /**
     * Gets or sets the URI of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the task URI is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-uri-registrationinfotype-element">URI</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} uri 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-put_uri
     */
    put_URI(uri) {
        uri := uri is String ? BSTR.Alloc(uri).Value : uri

        result := ComCall(20, this, "ptr", uri, "HRESULT")
        return result
    }

    /**
     * Gets or sets the security descriptor of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the security descriptor of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-securitydescriptor-registrationinfotype-element">SecurityDescriptor</a> element of the Task Scheduler schema.
     * 
     * If a different security descriptor is supplied when a task is  registered, then it will supersede the <i>sddl</i> parameter that is set through this property.
     * 
     * If you try to pass an invalid security descriptor into the <i>sddl</i> parameter, then this method will return <b>E_INVALIDARG</b>.
     * 
     * 
     * @param {Pointer<VARIANT>} pSddl 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-get_securitydescriptor
     */
    get_SecurityDescriptor(pSddl) {
        result := ComCall(21, this, "ptr", pSddl, "HRESULT")
        return result
    }

    /**
     * Gets or sets the security descriptor of the task.
     * @remarks
     * 
     * When reading or writing XML for a task, the security descriptor of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-securitydescriptor-registrationinfotype-element">SecurityDescriptor</a> element of the Task Scheduler schema.
     * 
     * If a different security descriptor is supplied when a task is  registered, then it will supersede the <i>sddl</i> parameter that is set through this property.
     * 
     * If you try to pass an invalid security descriptor into the <i>sddl</i> parameter, then this method will return <b>E_INVALIDARG</b>.
     * 
     * 
     * @param {VARIANT} sddl 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-put_securitydescriptor
     */
    put_SecurityDescriptor(sddl) {
        result := ComCall(22, this, "ptr", sddl, "HRESULT")
        return result
    }

    /**
     * Gets or sets where the task originated from. For example, a task may originate from a component, service, application, or user.
     * @remarks
     * 
     * The Task Scheduler UI uses the source to sort tasks. For example, tasks could be sorted by component, service, application, or user.
     * 
     * When reading or writing XML for a task, the task source information is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-source-registrationinfotype-element">Source</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {Pointer<BSTR>} pSource 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-get_source
     */
    get_Source(pSource) {
        result := ComCall(23, this, "ptr", pSource, "HRESULT")
        return result
    }

    /**
     * Gets or sets where the task originated from. For example, a task may originate from a component, service, application, or user.
     * @remarks
     * 
     * The Task Scheduler UI uses the source to sort tasks. For example, tasks could be sorted by component, service, application, or user.
     * 
     * When reading or writing XML for a task, the task source information is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-source-registrationinfotype-element">Source</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {BSTR} source 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregistrationinfo-put_source
     */
    put_Source(source) {
        source := source is String ? BSTR.Alloc(source).Value : source

        result := ComCall(24, this, "ptr", source, "HRESULT")
        return result
    }
}
