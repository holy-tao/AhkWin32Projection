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
     * 
     * @param {Pointer<BSTR>} pDescription 
     * @returns {HRESULT} 
     */
    get_Description(pDescription) {
        result := ComCall(7, this, "ptr", pDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(8, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAuthor 
     * @returns {HRESULT} 
     */
    get_Author(pAuthor) {
        result := ComCall(9, this, "ptr", pAuthor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} author 
     * @returns {HRESULT} 
     */
    put_Author(author) {
        author := author is String ? BSTR.Alloc(author).Value : author

        result := ComCall(10, this, "ptr", author, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} 
     */
    get_Version(pVersion) {
        result := ComCall(11, this, "ptr", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} version 
     * @returns {HRESULT} 
     */
    put_Version(version) {
        version := version is String ? BSTR.Alloc(version).Value : version

        result := ComCall(12, this, "ptr", version, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDate 
     * @returns {HRESULT} 
     */
    get_Date(pDate) {
        result := ComCall(13, this, "ptr", pDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} date 
     * @returns {HRESULT} 
     */
    put_Date(date) {
        date := date is String ? BSTR.Alloc(date).Value : date

        result := ComCall(14, this, "ptr", date, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDocumentation 
     * @returns {HRESULT} 
     */
    get_Documentation(pDocumentation) {
        result := ComCall(15, this, "ptr", pDocumentation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} documentation 
     * @returns {HRESULT} 
     */
    put_Documentation(documentation) {
        documentation := documentation is String ? BSTR.Alloc(documentation).Value : documentation

        result := ComCall(16, this, "ptr", documentation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pText 
     * @returns {HRESULT} 
     */
    get_XmlText(pText) {
        result := ComCall(17, this, "ptr", pText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     */
    put_XmlText(text) {
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(18, this, "ptr", text, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUri 
     * @returns {HRESULT} 
     */
    get_URI(pUri) {
        result := ComCall(19, this, "ptr", pUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} uri 
     * @returns {HRESULT} 
     */
    put_URI(uri) {
        uri := uri is String ? BSTR.Alloc(uri).Value : uri

        result := ComCall(20, this, "ptr", uri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pSddl 
     * @returns {HRESULT} 
     */
    get_SecurityDescriptor(pSddl) {
        result := ComCall(21, this, "ptr", pSddl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} sddl 
     * @returns {HRESULT} 
     */
    put_SecurityDescriptor(sddl) {
        result := ComCall(22, this, "ptr", sddl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pSource 
     * @returns {HRESULT} 
     */
    get_Source(pSource) {
        result := ComCall(23, this, "ptr", pSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} source 
     * @returns {HRESULT} 
     */
    put_Source(source) {
        source := source is String ? BSTR.Alloc(source).Value : source

        result := ComCall(24, this, "ptr", source, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
