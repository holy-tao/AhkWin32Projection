#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides the administrative information that can be used to describe the task.
 * @remarks
 * Registration information can be used to identify a task through the Task Scheduler UI, or as search criteria when enumerating over the registered tasks.
 * 
 * When reading or writing XML for a task, registration information for the task is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-registrationinfo-tasktype-element">RegistrationInfo</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iregistrationinfo
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IRegistrationInfo extends IDispatch {
    /**
     * The interface identifier for IRegistrationInfo
     * @type {Guid}
     */
    static IID := Guid("{416d8b73-cb41-4ea1-805c-9be9a5ac4a74}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRegistrationInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Description        : IntPtr
        put_Description        : IntPtr
        get_Author             : IntPtr
        put_Author             : IntPtr
        get_Version            : IntPtr
        put_Version            : IntPtr
        get_Date               : IntPtr
        put_Date               : IntPtr
        get_Documentation      : IntPtr
        put_Documentation      : IntPtr
        get_XmlText            : IntPtr
        put_XmlText            : IntPtr
        get_URI                : IntPtr
        put_URI                : IntPtr
        get_SecurityDescriptor : IntPtr
        put_SecurityDescriptor : IntPtr
        get_Source             : IntPtr
        put_Source             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRegistrationInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    Author {
        get => this.get_Author()
        set => this.put_Author(value)
    }

    /**
     * @type {BSTR} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * @type {BSTR} 
     */
    Date {
        get => this.get_Date()
        set => this.put_Date(value)
    }

    /**
     * @type {BSTR} 
     */
    Documentation {
        get => this.get_Documentation()
        set => this.put_Documentation(value)
    }

    /**
     * @type {BSTR} 
     */
    XmlText {
        get => this.get_XmlText()
        set => this.put_XmlText(value)
    }

    /**
     * @type {BSTR} 
     */
    URI {
        get => this.get_URI()
        set => this.put_URI(value)
    }

    /**
     * @type {VARIANT} 
     */
    SecurityDescriptor {
        get => this.get_SecurityDescriptor()
        set => this.put_SecurityDescriptor(value)
    }

    /**
     * @type {BSTR} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets or sets the description of the task. (Get)
     * @remarks
     * When reading or writing XML for a task, the description of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-description-registrationinfotype-element">Description</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {Pointer<BSTR>} pDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_description
     */
    get_Description(pDescription) {
        result := ComCall(7, this, BSTR.Ptr, pDescription, "HRESULT")
        return result
    }

    /**
     * Gets or sets the description of the task. (Put)
     * @remarks
     * When reading or writing XML for a task, the description of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-description-registrationinfotype-element">Description</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(8, this, BSTR, description, "HRESULT")
        return result
    }

    /**
     * Gets or sets the author of the task. (Get)
     * @remarks
     * When reading or writing XML for a task, the task author is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-author-registrationinfotype-element">Author</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {Pointer<BSTR>} pAuthor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_author
     */
    get_Author(pAuthor) {
        result := ComCall(9, this, BSTR.Ptr, pAuthor, "HRESULT")
        return result
    }

    /**
     * Gets or sets the author of the task. (Put)
     * @remarks
     * When reading or writing XML for a task, the task author is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-author-registrationinfotype-element">Author</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {BSTR} author 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_author
     */
    put_Author(author) {
        author := author is String ? BSTR.Alloc(author).Value : author

        result := ComCall(10, this, BSTR, author, "HRESULT")
        return result
    }

    /**
     * Gets or sets the version number of the task. (Get)
     * @remarks
     * When reading or writing XML for a task, the version number of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-version-registrationinfotype-element">Version</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_version
     */
    get_Version(pVersion) {
        result := ComCall(11, this, BSTR.Ptr, pVersion, "HRESULT")
        return result
    }

    /**
     * Gets or sets the version number of the task. (Put)
     * @remarks
     * When reading or writing XML for a task, the version number of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-version-registrationinfotype-element">Version</a> element of the Task Scheduler schema.
     * @param {BSTR} _version 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_version
     */
    put_Version(_version) {
        _version := _version is String ? BSTR.Alloc(_version).Value : _version

        result := ComCall(12, this, BSTR, _version, "HRESULT")
        return result
    }

    /**
     * Gets or sets the date and time when the task is registered. (Get)
     * @remarks
     * When reading or writing XML for a task, the registration date is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-date-registrationinfotype-element">Date</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_date
     */
    get_Date(pDate) {
        result := ComCall(13, this, BSTR.Ptr, pDate, "HRESULT")
        return result
    }

    /**
     * Gets or sets the date and time when the task is registered. (Put)
     * @remarks
     * When reading or writing XML for a task, the registration date is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-date-registrationinfotype-element">Date</a> element of the Task Scheduler schema.
     * @param {BSTR} date 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_date
     */
    put_Date(date) {
        date := date is String ? BSTR.Alloc(date).Value : date

        result := ComCall(14, this, BSTR, date, "HRESULT")
        return result
    }

    /**
     * Gets or sets any additional documentation for the task. (Get)
     * @remarks
     * When reading or writing XML for a task, the additional documentation for the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-documentation-registrationinfotype-element">Documentation</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {Pointer<BSTR>} pDocumentation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_documentation
     */
    get_Documentation(pDocumentation) {
        result := ComCall(15, this, BSTR.Ptr, pDocumentation, "HRESULT")
        return result
    }

    /**
     * Gets or sets any additional documentation for the task. (Put)
     * @remarks
     * When reading or writing XML for a task, the additional documentation for the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-documentation-registrationinfotype-element">Documentation</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {BSTR} documentation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_documentation
     */
    put_Documentation(documentation) {
        documentation := documentation is String ? BSTR.Alloc(documentation).Value : documentation

        result := ComCall(16, this, BSTR, documentation, "HRESULT")
        return result
    }

    /**
     * Gets or sets an XML-formatted version of the registration information for the task. (Get)
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_xmltext
     */
    get_XmlText(pText) {
        result := ComCall(17, this, BSTR.Ptr, pText, "HRESULT")
        return result
    }

    /**
     * Gets or sets an XML-formatted version of the registration information for the task. (Put)
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_xmltext
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(18, this, BSTR, text, "HRESULT")
        return result
    }

    /**
     * Gets or sets the URI of the task. (Get)
     * @remarks
     * When reading or writing XML for a task, the task URI is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-uri-registrationinfotype-element">URI</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pUri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_uri
     */
    get_URI(pUri) {
        result := ComCall(19, this, BSTR.Ptr, pUri, "HRESULT")
        return result
    }

    /**
     * Gets or sets the URI of the task. (Put)
     * @remarks
     * When reading or writing XML for a task, the task URI is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-uri-registrationinfotype-element">URI</a> element of the Task Scheduler schema.
     * @param {BSTR} uri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_uri
     */
    put_URI(uri) {
        uri := uri is String ? BSTR.Alloc(uri).Value : uri

        result := ComCall(20, this, BSTR, uri, "HRESULT")
        return result
    }

    /**
     * Gets or sets the security descriptor of the task. (Get)
     * @remarks
     * When reading or writing XML for a task, the security descriptor of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-securitydescriptor-registrationinfotype-element">SecurityDescriptor</a> element of the Task Scheduler schema.
     * 
     * If a different security descriptor is supplied when a task is  registered, then it will supersede the <i>sddl</i> parameter that is set through this property.
     * 
     * If you try to pass an invalid security descriptor into the <i>sddl</i> parameter, then this method will return <b>E_INVALIDARG</b>.
     * @param {Pointer<VARIANT>} pSddl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_securitydescriptor
     */
    get_SecurityDescriptor(pSddl) {
        result := ComCall(21, this, VARIANT.Ptr, pSddl, "HRESULT")
        return result
    }

    /**
     * Gets or sets the security descriptor of the task. (Put)
     * @remarks
     * When reading or writing XML for a task, the security descriptor of the task is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-securitydescriptor-registrationinfotype-element">SecurityDescriptor</a> element of the Task Scheduler schema.
     * 
     * If a different security descriptor is supplied when a task is  registered, then it will supersede the <i>sddl</i> parameter that is set through this property.
     * 
     * If you try to pass an invalid security descriptor into the <i>sddl</i> parameter, then this method will return <b>E_INVALIDARG</b>.
     * @param {VARIANT} sddl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_securitydescriptor
     */
    put_SecurityDescriptor(sddl) {
        result := ComCall(22, this, VARIANT, sddl, "HRESULT")
        return result
    }

    /**
     * Gets or sets where the task originated from. For example, a task may originate from a component, service, application, or user. (Get)
     * @remarks
     * The Task Scheduler UI uses the source to sort tasks. For example, tasks could be sorted by component, service, application, or user.
     * 
     * When reading or writing XML for a task, the task source information is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-source-registrationinfotype-element">Source</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {Pointer<BSTR>} pSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_source
     */
    get_Source(pSource) {
        result := ComCall(23, this, BSTR.Ptr, pSource, "HRESULT")
        return result
    }

    /**
     * Gets or sets where the task originated from. For example, a task may originate from a component, service, application, or user. (Put)
     * @remarks
     * The Task Scheduler UI uses the source to sort tasks. For example, tasks could be sorted by component, service, application, or user.
     * 
     * When reading or writing XML for a task, the task source information is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-source-registrationinfotype-element">Source</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {BSTR} source 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_source
     */
    put_Source(source) {
        source := source is String ? BSTR.Alloc(source).Value : source

        result := ComCall(24, this, BSTR, source, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRegistrationInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_Author := CallbackCreate(GetMethod(implObj, "get_Author"), flags, 2)
        this.vtbl.put_Author := CallbackCreate(GetMethod(implObj, "put_Author"), flags, 2)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
        this.vtbl.put_Version := CallbackCreate(GetMethod(implObj, "put_Version"), flags, 2)
        this.vtbl.get_Date := CallbackCreate(GetMethod(implObj, "get_Date"), flags, 2)
        this.vtbl.put_Date := CallbackCreate(GetMethod(implObj, "put_Date"), flags, 2)
        this.vtbl.get_Documentation := CallbackCreate(GetMethod(implObj, "get_Documentation"), flags, 2)
        this.vtbl.put_Documentation := CallbackCreate(GetMethod(implObj, "put_Documentation"), flags, 2)
        this.vtbl.get_XmlText := CallbackCreate(GetMethod(implObj, "get_XmlText"), flags, 2)
        this.vtbl.put_XmlText := CallbackCreate(GetMethod(implObj, "put_XmlText"), flags, 2)
        this.vtbl.get_URI := CallbackCreate(GetMethod(implObj, "get_URI"), flags, 2)
        this.vtbl.put_URI := CallbackCreate(GetMethod(implObj, "put_URI"), flags, 2)
        this.vtbl.get_SecurityDescriptor := CallbackCreate(GetMethod(implObj, "get_SecurityDescriptor"), flags, 2)
        this.vtbl.put_SecurityDescriptor := CallbackCreate(GetMethod(implObj, "put_SecurityDescriptor"), flags, 2)
        this.vtbl.get_Source := CallbackCreate(GetMethod(implObj, "get_Source"), flags, 2)
        this.vtbl.put_Source := CallbackCreate(GetMethod(implObj, "put_Source"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_Author)
        CallbackFree(this.vtbl.put_Author)
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.put_Version)
        CallbackFree(this.vtbl.get_Date)
        CallbackFree(this.vtbl.put_Date)
        CallbackFree(this.vtbl.get_Documentation)
        CallbackFree(this.vtbl.put_Documentation)
        CallbackFree(this.vtbl.get_XmlText)
        CallbackFree(this.vtbl.put_XmlText)
        CallbackFree(this.vtbl.get_URI)
        CallbackFree(this.vtbl.put_URI)
        CallbackFree(this.vtbl.get_SecurityDescriptor)
        CallbackFree(this.vtbl.put_SecurityDescriptor)
        CallbackFree(this.vtbl.get_Source)
        CallbackFree(this.vtbl.put_Source)
    }
}
