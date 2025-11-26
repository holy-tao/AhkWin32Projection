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
     * 
     * @param {Pointer<BSTR>} pDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_description
     */
    get_Description(pDescription) {
        result := ComCall(7, this, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(8, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAuthor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_author
     */
    get_Author(pAuthor) {
        result := ComCall(9, this, "ptr", pAuthor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} author 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_author
     */
    put_Author(author) {
        author := author is String ? BSTR.Alloc(author).Value : author

        result := ComCall(10, this, "ptr", author, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_version
     */
    get_Version(pVersion) {
        result := ComCall(11, this, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} version 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_version
     */
    put_Version(version) {
        version := version is String ? BSTR.Alloc(version).Value : version

        result := ComCall(12, this, "ptr", version, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_date
     */
    get_Date(pDate) {
        result := ComCall(13, this, "ptr", pDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} date 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_date
     */
    put_Date(date) {
        date := date is String ? BSTR.Alloc(date).Value : date

        result := ComCall(14, this, "ptr", date, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDocumentation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_documentation
     */
    get_Documentation(pDocumentation) {
        result := ComCall(15, this, "ptr", pDocumentation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} documentation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_documentation
     */
    put_Documentation(documentation) {
        documentation := documentation is String ? BSTR.Alloc(documentation).Value : documentation

        result := ComCall(16, this, "ptr", documentation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_xmltext
     */
    get_XmlText(pText) {
        result := ComCall(17, this, "ptr", pText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_xmltext
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(18, this, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_uri
     */
    get_URI(pUri) {
        result := ComCall(19, this, "ptr", pUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} uri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_uri
     */
    put_URI(uri) {
        uri := uri is String ? BSTR.Alloc(uri).Value : uri

        result := ComCall(20, this, "ptr", uri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pSddl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_securitydescriptor
     */
    get_SecurityDescriptor(pSddl) {
        result := ComCall(21, this, "ptr", pSddl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} sddl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_securitydescriptor
     */
    put_SecurityDescriptor(sddl) {
        result := ComCall(22, this, "ptr", sddl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-get_source
     */
    get_Source(pSource) {
        result := ComCall(23, this, "ptr", pSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} source 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationinfo-put_source
     */
    put_Source(source) {
        source := source is String ? BSTR.Alloc(source).Value : source

        result := ComCall(24, this, "ptr", source, "HRESULT")
        return result
    }
}
