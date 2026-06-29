#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMPart.ahk" { IXpsOMPart }
#Import ".\IXpsOMPackage.ahk" { IXpsOMPackage }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * This interface provides access to the metadata that is stored in the Core Properties part of the XPS document.
 * @remarks
 * The meaning and use of these properties is determined by the user or context.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMCoreProperties extends IXpsOMPart {
    /**
     * The interface identifier for IXpsOMCoreProperties
     * @type {Guid}
     */
    static IID := Guid("{3340fe8f-4027-4aa1-8f5f-d35ae45fe597}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMCoreProperties interfaces
    */
    struct Vtbl extends IXpsOMPart.Vtbl {
        GetOwner          : IntPtr
        GetCategory       : IntPtr
        SetCategory       : IntPtr
        GetContentStatus  : IntPtr
        SetContentStatus  : IntPtr
        GetContentType    : IntPtr
        SetContentType    : IntPtr
        GetCreated        : IntPtr
        SetCreated        : IntPtr
        GetCreator        : IntPtr
        SetCreator        : IntPtr
        GetDescription    : IntPtr
        SetDescription    : IntPtr
        GetIdentifier     : IntPtr
        SetIdentifier     : IntPtr
        GetKeywords       : IntPtr
        SetKeywords       : IntPtr
        GetLanguage       : IntPtr
        SetLanguage       : IntPtr
        GetLastModifiedBy : IntPtr
        SetLastModifiedBy : IntPtr
        GetLastPrinted    : IntPtr
        SetLastPrinted    : IntPtr
        GetModified       : IntPtr
        SetModified       : IntPtr
        GetRevision       : IntPtr
        SetRevision       : IntPtr
        GetSubject        : IntPtr
        SetSubject        : IntPtr
        GetTitle          : IntPtr
        SetTitle          : IntPtr
        GetVersion        : IntPtr
        SetVersion        : IntPtr
        Clone             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMCoreProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to the IXpsOMPackage interface that contains the core properties.
     * @returns {IXpsOMPackage} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface that contains the core properties.  If the interface does not belong to a package, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * Gets the category property.
     * @remarks
     * The <b>category</b> property contains categorization of the content.
     * 
     * This method allocates the memory used by the string that is returned in <i>category</i>.  If <i>category</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>category</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcategory
     */
    GetCategory() {
        result := ComCall(6, this, PWSTR.Ptr, &category := 0, "HRESULT")
        return category
    }

    /**
     * Sets the category property.
     * @remarks
     * The <b>category</b> property contains a categorization of the content.
     * @param {PWSTR} category The string to be written to the <b>category</b> property. A <b>NULL</b> pointer clears the <b>category</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcategory
     */
    SetCategory(category) {
        category := category is String ? StrPtr(category) : category

        result := ComCall(7, this, "ptr", category, "HRESULT")
        return result
    }

    /**
     * Gets the contentStatus property.
     * @remarks
     * The <b>contentStatus</b> property stores the content's status. Examples of <b>contentStatus</b> values include <b>Draft</b>, <b>Reviewed</b>, and <b>Final</b>.
     * 
     * This method allocates the memory used by the string that is returned in <i>contentStatus</i>.  If <i>contentStatus</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>contentStatus</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcontentstatus
     */
    GetContentStatus() {
        result := ComCall(8, this, PWSTR.Ptr, &contentStatus := 0, "HRESULT")
        return contentStatus
    }

    /**
     * Sets the contentStatus property.
     * @remarks
     * The <b>contentStatus</b> property contains the status of the content. Examples of <b>contentStatus</b> values include <b>Draft</b>, <b>Reviewed</b>, and <b>Final</b>.
     * @param {PWSTR} contentStatus The string to be written to the <b>contentStatus</b> property. A <b>NULL</b> pointer clears the <b>contentStatus</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcontentstatus
     */
    SetContentStatus(contentStatus) {
        contentStatus := contentStatus is String ? StrPtr(contentStatus) : contentStatus

        result := ComCall(9, this, "ptr", contentStatus, "HRESULT")
        return result
    }

    /**
     * Gets the contentType property.
     * @remarks
     * The <b>contentType</b> property stores the type of content that is being represented, and it is generally defined by a
     * specific use and intended audience. Examples of <b>contentType</b> values include <b>Whitepaper</b>, <b>Security Bulletin</b>, and <b>Exam</b>.
     * 
     * This method allocates the memory used by the string that is returned in <i>contentType</i>.  If <i>contentType</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>contentType</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcontenttype
     */
    GetContentType() {
        result := ComCall(10, this, PWSTR.Ptr, &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * Sets the contentType property.
     * @remarks
     * The <b>contentType</b> property contains the type of content that is being represented, which is generally defined by a
     * specific use and intended audience. Examples of <b>contentType</b>  values include <b>Whitepaper</b>, <b>Security Bulletin</b>, and <b>Exam</b>.
     * @param {PWSTR} contentType The string to be written to the <b>contentType</b> property. A <b>NULL</b> pointer clears the <b>contentType</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcontenttype
     */
    SetContentType(contentType) {
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(11, this, "ptr", contentType, "HRESULT")
        return result
    }

    /**
     * Gets the created property.
     * @remarks
     * The <b>created</b> property contains the date and time the package was created.
     * @returns {SYSTEMTIME} The date and time that are read from the <b>created</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcreated
     */
    GetCreated() {
        created := SYSTEMTIME()
        result := ComCall(12, this, SYSTEMTIME.Ptr, created, "HRESULT")
        return created
    }

    /**
     * Sets the created property.
     * @remarks
     * The <b>created</b> property contains the date and time the package was created.
     * @param {Pointer<SYSTEMTIME>} created The date and time the package was created. A <b>NULL</b> pointer clears the <b>created</b> property
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The method succeeded.
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
     * <i>created</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcreated
     */
    SetCreated(created) {
        result := ComCall(13, this, SYSTEMTIME.Ptr, created, "HRESULT")
        return result
    }

    /**
     * Gets the creator property.
     * @remarks
     * The <b>creator</b> property describes  the entity that is primarily responsible for making the content of
     * the resource.
     * 
     * This method allocates the memory used by the string that is returned in <i>creator</i>.  If <i>creator</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>creator</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcreator
     */
    GetCreator() {
        result := ComCall(14, this, PWSTR.Ptr, &creator := 0, "HRESULT")
        return creator
    }

    /**
     * Sets the creator property.
     * @remarks
     * The <b>creator</b> property describes  the entity that is primarily responsible for making the content of
     * the resource.
     * @param {PWSTR} creator The string to be written to the <b>creator</b> property. A <b>NULL</b> pointer clears the <b>creator</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcreator
     */
    SetCreator(creator) {
        creator := creator is String ? StrPtr(creator) : creator

        result := ComCall(15, this, "ptr", creator, "HRESULT")
        return result
    }

    /**
     * Gets the description property.
     * @remarks
     * The <b>description</b> property provides an explanation of the  content.
     * 
     * This method allocates the memory used by the string that is returned in <i>description</i>.  If <i>description</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>description</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getdescription
     */
    GetDescription() {
        result := ComCall(16, this, PWSTR.Ptr, &description := 0, "HRESULT")
        return description
    }

    /**
     * Sets the description property.
     * @remarks
     * The <b>description</b> property explains the  content.
     * @param {PWSTR} description The string to be written to the <b>description</b> property. A <b>NULL</b> pointer clears this property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setdescription
     */
    SetDescription(description) {
        description := description is String ? StrPtr(description) : description

        result := ComCall(17, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * Gets the identifier property.
     * @remarks
     * The <b>identifier</b> property is an unambiguous reference to the resource within a user-defined
     * or application-specific context.
     * 
     * This method allocates the memory used by the string that is returned in <i>identifier</i>.  If <i>identifier</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>identifier</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getidentifier
     */
    GetIdentifier() {
        result := ComCall(18, this, PWSTR.Ptr, &identifier := 0, "HRESULT")
        return identifier
    }

    /**
     * Sets the identifier property.
     * @remarks
     * The <b>identifier</b> property is an unambiguous reference to the resource within a user-defined or application-specific
     * context.
     * @param {PWSTR} identifier The string to be written to the <b>identifier</b> property. A <b>NULL</b> pointer clears the <b>identifier</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setidentifier
     */
    SetIdentifier(identifier) {
        identifier := identifier is String ? StrPtr(identifier) : identifier

        result := ComCall(19, this, "ptr", identifier, "HRESULT")
        return result
    }

    /**
     * Gets the keywords property.
     * @remarks
     * The <b>keywords</b> property is a delimited set of keywords that are used to support searching and
     * indexing. This is typically a list of terms that are not
     * available in other properties.
     * 
     * This method allocates the memory used by the string that is returned in <i>keywords</i>.  If <i>keywords</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>keywords</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getkeywords
     */
    GetKeywords() {
        result := ComCall(20, this, PWSTR.Ptr, &keywords := 0, "HRESULT")
        return keywords
    }

    /**
     * Sets the keywords property.
     * @remarks
     * The <b>keywords</b> property is a delimited set of keywords that are used to support searching and
     * indexing. It is typically a list of terms that are not
     * available elsewhere in the properties.
     * @param {PWSTR} keywords The string that contains the keywords to be written to the <b>keywords</b> property. A <b>NULL</b> pointer clears the <b>keywords</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setkeywords
     */
    SetKeywords(keywords) {
        keywords := keywords is String ? StrPtr(keywords) : keywords

        result := ComCall(21, this, "ptr", keywords, "HRESULT")
        return result
    }

    /**
     * Gets the language property.
     * @remarks
     * The <b>language</b> property describes the language of the resource's intellectual content.
     * 
     * Internet Engineering Task Force (IETF) RFC 3066 describes the recommended encoding for this property.
     * 
     * This method allocates the memory used by the string that is returned in <i>language</i>.  If <i>language</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The value that is read from the <b>language</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlanguage
     */
    GetLanguage() {
        result := ComCall(22, this, PWSTR.Ptr, &language := 0, "HRESULT")
        return language
    }

    /**
     * Sets the language property.
     * @remarks
     * The <b>language</b> property describes the language of the resource's intellectual content.
     * 
     * Internet Engineering Task Force (IETF) RFC 3066 describes the recommended encoding for this property.
     * @param {PWSTR} language The string that contains the language value to be written to the <b>language</b> property. A <b>NULL</b> pointer clears the <b>language</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setlanguage
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(23, this, "ptr", language, "HRESULT")
        return result
    }

    /**
     * Gets the lastModifiedBy property.
     * @remarks
     * The <b>lastModifiedBy</b> property describes the user who performed the last modification.
     * 
     * This method allocates the memory used by the string that is returned in <i>lastModifiedBy</i>.  If <i>lastModifiedBy</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The value that is read from the <b>lastModifiedBy</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlastmodifiedby
     */
    GetLastModifiedBy() {
        result := ComCall(24, this, PWSTR.Ptr, &lastModifiedBy := 0, "HRESULT")
        return lastModifiedBy
    }

    /**
     * Sets the lastModifiedBy property.
     * @remarks
     * The <b>lastModifiedBy</b> property describes the user who performs the last modification.
     * @param {PWSTR} lastModifiedBy The string that contains the value to be written to the <b>lastModifiedBy</b> property. A <b>NULL</b> pointer clears the <b>lastModifiedBy</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setlastmodifiedby
     */
    SetLastModifiedBy(lastModifiedBy) {
        lastModifiedBy := lastModifiedBy is String ? StrPtr(lastModifiedBy) : lastModifiedBy

        result := ComCall(25, this, "ptr", lastModifiedBy, "HRESULT")
        return result
    }

    /**
     * Gets the lastPrinted property.
     * @remarks
     * The <b>lastPrinted</b> property contains the date and time the package was last printed.
     * @returns {SYSTEMTIME} The date and time that  are read from the <b>lastPrinted</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlastprinted
     */
    GetLastPrinted() {
        lastPrinted := SYSTEMTIME()
        result := ComCall(26, this, SYSTEMTIME.Ptr, lastPrinted, "HRESULT")
        return lastPrinted
    }

    /**
     * Sets the lastPrinted property.
     * @remarks
     * The <b>lastPrinted</b> property contains the date and time the package was last printed.
     * @param {Pointer<SYSTEMTIME>} lastPrinted The date and time the package was last printed. A <b>NULL</b> pointer clears the <b>lastPrinted</b> property.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The method succeeded.
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
     * <i>SetLastPrinted</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setlastprinted
     */
    SetLastPrinted(lastPrinted) {
        result := ComCall(27, this, SYSTEMTIME.Ptr, lastPrinted, "HRESULT")
        return result
    }

    /**
     * Gets the modified property.
     * @remarks
     * The <b>modified</b> property contains the date and time the package was last modified.
     * @returns {SYSTEMTIME} The date and time that are read from the <b>modified</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getmodified
     */
    GetModified() {
        modified := SYSTEMTIME()
        result := ComCall(28, this, SYSTEMTIME.Ptr, modified, "HRESULT")
        return modified
    }

    /**
     * Sets the modified property.
     * @remarks
     * The <b>modified</b> property contains the date and time the package was last changed.
     * @param {Pointer<SYSTEMTIME>} modified The date and time the package was last changed. A <b>NULL</b> pointer clears the <b>modified</b> property.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The method succeeded.
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
     * <i>modified</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setmodified
     */
    SetModified(modified) {
        result := ComCall(29, this, SYSTEMTIME.Ptr, modified, "HRESULT")
        return result
    }

    /**
     * Gets the revision property.
     * @remarks
     * The <b>revision</b> property contains the resource's revision number.
     * 
     * This method allocates the memory used by the string that is returned in <i>revision</i>.  If <i>revision</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>revision</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getrevision
     */
    GetRevision() {
        result := ComCall(30, this, PWSTR.Ptr, &revision := 0, "HRESULT")
        return revision
    }

    /**
     * Sets the revision property.
     * @remarks
     * The <b>revision</b> property contains the revision number of the resource.
     * @param {PWSTR} revision The string to be written to the <b>revision</b> property. A <b>NULL</b> pointer clears the <b>revision</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setrevision
     */
    SetRevision(revision) {
        revision := revision is String ? StrPtr(revision) : revision

        result := ComCall(31, this, "ptr", revision, "HRESULT")
        return result
    }

    /**
     * Gets the subject property.
     * @remarks
     * The <b>subject</b> property contains the topic of the resource's content.
     * 
     * This method allocates the memory used by the string that is returned in <i>subject</i>.  If <i>subject</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>subject</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getsubject
     */
    GetSubject() {
        result := ComCall(32, this, PWSTR.Ptr, &subject := 0, "HRESULT")
        return subject
    }

    /**
     * Sets the subject property.
     * @remarks
     * The <b>subject</b> property contains the topic of the resource content.
     * @param {PWSTR} subject The string to be written to the <b>subject</b> property. A <b>NULL</b> pointer clears the <b>subject</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setsubject
     */
    SetSubject(subject) {
        subject := subject is String ? StrPtr(subject) : subject

        result := ComCall(33, this, "ptr", subject, "HRESULT")
        return result
    }

    /**
     * Gets the title property.
     * @remarks
     * The <b>title</b> property contains the resource's name.
     * 
     * This method allocates the memory used by the string that is returned in <i>title</i>.  If <i>title</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>title</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-gettitle
     */
    GetTitle() {
        result := ComCall(34, this, PWSTR.Ptr, &title := 0, "HRESULT")
        return title
    }

    /**
     * Sets the title property.
     * @remarks
     * The <b>title</b> property contains the name given to the resource.
     * @param {PWSTR} title The string to be written to the <b>title</b> property. A <b>NULL</b> pointer clears the <b>title</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-settitle
     */
    SetTitle(title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(35, this, "ptr", title, "HRESULT")
        return result
    }

    /**
     * Gets the version property.
     * @remarks
     * The <b>version</b> property contains the resource's version number.
     * 
     * This method allocates the memory used by the string that is returned in <i>version</i>.  If <i>version</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that is read from the <b>version</b> property.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getversion
     */
    GetVersion() {
        result := ComCall(36, this, PWSTR.Ptr, &_version := 0, "HRESULT")
        return _version
    }

    /**
     * Sets the version property.
     * @remarks
     * The <b>version</b> property contains the version number of the resource.
     * @param {PWSTR} _version The string to be written to the <b>version</b> property. A <b>NULL</b> pointer clears the <b>version</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setversion
     */
    SetVersion(_version) {
        _version := _version is String ? StrPtr(_version) : _version

        result := ComCall(37, this, "ptr", _version, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMCoreProperties.Clone)
     * @remarks
     * The owner of the interface returned in <i>coreProperties</i> is <b>NULL</b>.
     * @returns {IXpsOMCoreProperties} A pointer to the copy of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-clone
     */
    Clone() {
        result := ComCall(38, this, "ptr*", &coreProperties := 0, "HRESULT")
        return IXpsOMCoreProperties(coreProperties)
    }

    Query(iid) {
        if (IXpsOMCoreProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOwner := CallbackCreate(GetMethod(implObj, "GetOwner"), flags, 2)
        this.vtbl.GetCategory := CallbackCreate(GetMethod(implObj, "GetCategory"), flags, 2)
        this.vtbl.SetCategory := CallbackCreate(GetMethod(implObj, "SetCategory"), flags, 2)
        this.vtbl.GetContentStatus := CallbackCreate(GetMethod(implObj, "GetContentStatus"), flags, 2)
        this.vtbl.SetContentStatus := CallbackCreate(GetMethod(implObj, "SetContentStatus"), flags, 2)
        this.vtbl.GetContentType := CallbackCreate(GetMethod(implObj, "GetContentType"), flags, 2)
        this.vtbl.SetContentType := CallbackCreate(GetMethod(implObj, "SetContentType"), flags, 2)
        this.vtbl.GetCreated := CallbackCreate(GetMethod(implObj, "GetCreated"), flags, 2)
        this.vtbl.SetCreated := CallbackCreate(GetMethod(implObj, "SetCreated"), flags, 2)
        this.vtbl.GetCreator := CallbackCreate(GetMethod(implObj, "GetCreator"), flags, 2)
        this.vtbl.SetCreator := CallbackCreate(GetMethod(implObj, "SetCreator"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.SetDescription := CallbackCreate(GetMethod(implObj, "SetDescription"), flags, 2)
        this.vtbl.GetIdentifier := CallbackCreate(GetMethod(implObj, "GetIdentifier"), flags, 2)
        this.vtbl.SetIdentifier := CallbackCreate(GetMethod(implObj, "SetIdentifier"), flags, 2)
        this.vtbl.GetKeywords := CallbackCreate(GetMethod(implObj, "GetKeywords"), flags, 2)
        this.vtbl.SetKeywords := CallbackCreate(GetMethod(implObj, "SetKeywords"), flags, 2)
        this.vtbl.GetLanguage := CallbackCreate(GetMethod(implObj, "GetLanguage"), flags, 2)
        this.vtbl.SetLanguage := CallbackCreate(GetMethod(implObj, "SetLanguage"), flags, 2)
        this.vtbl.GetLastModifiedBy := CallbackCreate(GetMethod(implObj, "GetLastModifiedBy"), flags, 2)
        this.vtbl.SetLastModifiedBy := CallbackCreate(GetMethod(implObj, "SetLastModifiedBy"), flags, 2)
        this.vtbl.GetLastPrinted := CallbackCreate(GetMethod(implObj, "GetLastPrinted"), flags, 2)
        this.vtbl.SetLastPrinted := CallbackCreate(GetMethod(implObj, "SetLastPrinted"), flags, 2)
        this.vtbl.GetModified := CallbackCreate(GetMethod(implObj, "GetModified"), flags, 2)
        this.vtbl.SetModified := CallbackCreate(GetMethod(implObj, "SetModified"), flags, 2)
        this.vtbl.GetRevision := CallbackCreate(GetMethod(implObj, "GetRevision"), flags, 2)
        this.vtbl.SetRevision := CallbackCreate(GetMethod(implObj, "SetRevision"), flags, 2)
        this.vtbl.GetSubject := CallbackCreate(GetMethod(implObj, "GetSubject"), flags, 2)
        this.vtbl.SetSubject := CallbackCreate(GetMethod(implObj, "SetSubject"), flags, 2)
        this.vtbl.GetTitle := CallbackCreate(GetMethod(implObj, "GetTitle"), flags, 2)
        this.vtbl.SetTitle := CallbackCreate(GetMethod(implObj, "SetTitle"), flags, 2)
        this.vtbl.GetVersion := CallbackCreate(GetMethod(implObj, "GetVersion"), flags, 2)
        this.vtbl.SetVersion := CallbackCreate(GetMethod(implObj, "SetVersion"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOwner)
        CallbackFree(this.vtbl.GetCategory)
        CallbackFree(this.vtbl.SetCategory)
        CallbackFree(this.vtbl.GetContentStatus)
        CallbackFree(this.vtbl.SetContentStatus)
        CallbackFree(this.vtbl.GetContentType)
        CallbackFree(this.vtbl.SetContentType)
        CallbackFree(this.vtbl.GetCreated)
        CallbackFree(this.vtbl.SetCreated)
        CallbackFree(this.vtbl.GetCreator)
        CallbackFree(this.vtbl.SetCreator)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.SetDescription)
        CallbackFree(this.vtbl.GetIdentifier)
        CallbackFree(this.vtbl.SetIdentifier)
        CallbackFree(this.vtbl.GetKeywords)
        CallbackFree(this.vtbl.SetKeywords)
        CallbackFree(this.vtbl.GetLanguage)
        CallbackFree(this.vtbl.SetLanguage)
        CallbackFree(this.vtbl.GetLastModifiedBy)
        CallbackFree(this.vtbl.SetLastModifiedBy)
        CallbackFree(this.vtbl.GetLastPrinted)
        CallbackFree(this.vtbl.SetLastPrinted)
        CallbackFree(this.vtbl.GetModified)
        CallbackFree(this.vtbl.SetModified)
        CallbackFree(this.vtbl.GetRevision)
        CallbackFree(this.vtbl.SetRevision)
        CallbackFree(this.vtbl.GetSubject)
        CallbackFree(this.vtbl.SetSubject)
        CallbackFree(this.vtbl.GetTitle)
        CallbackFree(this.vtbl.SetTitle)
        CallbackFree(this.vtbl.GetVersion)
        CallbackFree(this.vtbl.SetVersion)
        CallbackFree(this.vtbl.Clone)
    }
}
