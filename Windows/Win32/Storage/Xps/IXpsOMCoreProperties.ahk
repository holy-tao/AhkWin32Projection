#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMPackage.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\IXpsOMCoreProperties.ahk
#Include .\IXpsOMPart.ahk

/**
 * This interface provides access to the metadata that is stored in the Core Properties part of the XPS document.
 * @remarks
 * 
 * The meaning and use of these properties is determined by the user or context.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomcoreproperties
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMCoreProperties extends IXpsOMPart{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMCoreProperties
     * @type {Guid}
     */
    static IID => Guid("{3340fe8f-4027-4aa1-8f5f-d35ae45fe597}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetCategory", "SetCategory", "GetContentStatus", "SetContentStatus", "GetContentType", "SetContentType", "GetCreated", "SetCreated", "GetCreator", "SetCreator", "GetDescription", "SetDescription", "GetIdentifier", "SetIdentifier", "GetKeywords", "SetKeywords", "GetLanguage", "SetLanguage", "GetLastModifiedBy", "SetLastModifiedBy", "GetLastPrinted", "SetLastPrinted", "GetModified", "SetModified", "GetRevision", "SetRevision", "GetSubject", "SetSubject", "GetTitle", "SetTitle", "GetVersion", "SetVersion", "Clone"]

    /**
     * Gets a pointer to the IXpsOMPackage interface that contains the core properties.
     * @returns {IXpsOMPackage} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage">IXpsOMPackage</a> interface that contains the core properties.  If the interface does not belong to a package, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * Gets the category property.
     * @returns {PWSTR} The string that is read from the <b>category</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcategory
     */
    GetCategory() {
        result := ComCall(6, this, "ptr*", &category := 0, "HRESULT")
        return category
    }

    /**
     * Sets the category property.
     * @param {PWSTR} category The string to be written to the <b>category</b> property. A <b>NULL</b> pointer clears the <b>category</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcategory
     */
    SetCategory(category) {
        category := category is String ? StrPtr(category) : category

        result := ComCall(7, this, "ptr", category, "HRESULT")
        return result
    }

    /**
     * Gets the contentStatus property.
     * @returns {PWSTR} The string that is read from the <b>contentStatus</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcontentstatus
     */
    GetContentStatus() {
        result := ComCall(8, this, "ptr*", &contentStatus := 0, "HRESULT")
        return contentStatus
    }

    /**
     * Sets the contentStatus property.
     * @param {PWSTR} contentStatus The string to be written to the <b>contentStatus</b> property. A <b>NULL</b> pointer clears the <b>contentStatus</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcontentstatus
     */
    SetContentStatus(contentStatus) {
        contentStatus := contentStatus is String ? StrPtr(contentStatus) : contentStatus

        result := ComCall(9, this, "ptr", contentStatus, "HRESULT")
        return result
    }

    /**
     * Gets the contentType property.
     * @returns {PWSTR} The string that is read from the <b>contentType</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcontenttype
     */
    GetContentType() {
        result := ComCall(10, this, "ptr*", &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * Sets the contentType property.
     * @param {PWSTR} contentType The string to be written to the <b>contentType</b> property. A <b>NULL</b> pointer clears the <b>contentType</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcontenttype
     */
    SetContentType(contentType) {
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(11, this, "ptr", contentType, "HRESULT")
        return result
    }

    /**
     * Gets the created property.
     * @returns {SYSTEMTIME} The date and time that are read from the <b>created</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcreated
     */
    GetCreated() {
        created := SYSTEMTIME()
        result := ComCall(12, this, "ptr", created, "HRESULT")
        return created
    }

    /**
     * Sets the created property.
     * @param {Pointer<SYSTEMTIME>} created The date and time the package was created. A <b>NULL</b> pointer clears the <b>created</b> property
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcreated
     */
    SetCreated(created) {
        result := ComCall(13, this, "ptr", created, "HRESULT")
        return result
    }

    /**
     * Gets the creator property.
     * @returns {PWSTR} The string that is read from the <b>creator</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcreator
     */
    GetCreator() {
        result := ComCall(14, this, "ptr*", &creator := 0, "HRESULT")
        return creator
    }

    /**
     * Sets the creator property.
     * @param {PWSTR} creator The string to be written to the <b>creator</b> property. A <b>NULL</b> pointer clears the <b>creator</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcreator
     */
    SetCreator(creator) {
        creator := creator is String ? StrPtr(creator) : creator

        result := ComCall(15, this, "ptr", creator, "HRESULT")
        return result
    }

    /**
     * Gets the description property.
     * @returns {PWSTR} The string that is read from the <b>description</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getdescription
     */
    GetDescription() {
        result := ComCall(16, this, "ptr*", &description := 0, "HRESULT")
        return description
    }

    /**
     * Sets the description property.
     * @param {PWSTR} description The string to be written to the <b>description</b> property. A <b>NULL</b> pointer clears this property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setdescription
     */
    SetDescription(description) {
        description := description is String ? StrPtr(description) : description

        result := ComCall(17, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * Gets the identifier property.
     * @returns {PWSTR} The string that is read from the <b>identifier</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getidentifier
     */
    GetIdentifier() {
        result := ComCall(18, this, "ptr*", &identifier := 0, "HRESULT")
        return identifier
    }

    /**
     * Sets the identifier property.
     * @param {PWSTR} identifier The string to be written to the <b>identifier</b> property. A <b>NULL</b> pointer clears the <b>identifier</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setidentifier
     */
    SetIdentifier(identifier) {
        identifier := identifier is String ? StrPtr(identifier) : identifier

        result := ComCall(19, this, "ptr", identifier, "HRESULT")
        return result
    }

    /**
     * Gets the keywords property.
     * @returns {PWSTR} The string that is read from the <b>keywords</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getkeywords
     */
    GetKeywords() {
        result := ComCall(20, this, "ptr*", &keywords := 0, "HRESULT")
        return keywords
    }

    /**
     * Sets the keywords property.
     * @param {PWSTR} keywords The string that contains the keywords to be written to the <b>keywords</b> property. A <b>NULL</b> pointer clears the <b>keywords</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setkeywords
     */
    SetKeywords(keywords) {
        keywords := keywords is String ? StrPtr(keywords) : keywords

        result := ComCall(21, this, "ptr", keywords, "HRESULT")
        return result
    }

    /**
     * Gets the language property.
     * @returns {PWSTR} The value that is read from the <b>language</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlanguage
     */
    GetLanguage() {
        result := ComCall(22, this, "ptr*", &language := 0, "HRESULT")
        return language
    }

    /**
     * Sets the language property.
     * @param {PWSTR} language The string that contains the language value to be written to the <b>language</b> property. A <b>NULL</b> pointer clears the <b>language</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setlanguage
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(23, this, "ptr", language, "HRESULT")
        return result
    }

    /**
     * Gets the lastModifiedBy property.
     * @returns {PWSTR} The value that is read from the <b>lastModifiedBy</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlastmodifiedby
     */
    GetLastModifiedBy() {
        result := ComCall(24, this, "ptr*", &lastModifiedBy := 0, "HRESULT")
        return lastModifiedBy
    }

    /**
     * Sets the lastModifiedBy property.
     * @param {PWSTR} lastModifiedBy The string that contains the value to be written to the <b>lastModifiedBy</b> property. A <b>NULL</b> pointer clears the <b>lastModifiedBy</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setlastmodifiedby
     */
    SetLastModifiedBy(lastModifiedBy) {
        lastModifiedBy := lastModifiedBy is String ? StrPtr(lastModifiedBy) : lastModifiedBy

        result := ComCall(25, this, "ptr", lastModifiedBy, "HRESULT")
        return result
    }

    /**
     * Gets the lastPrinted property.
     * @returns {SYSTEMTIME} The date and time that  are read from the <b>lastPrinted</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlastprinted
     */
    GetLastPrinted() {
        lastPrinted := SYSTEMTIME()
        result := ComCall(26, this, "ptr", lastPrinted, "HRESULT")
        return lastPrinted
    }

    /**
     * Sets the lastPrinted property.
     * @param {Pointer<SYSTEMTIME>} lastPrinted The date and time the package was last printed. A <b>NULL</b> pointer clears the <b>lastPrinted</b> property.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setlastprinted
     */
    SetLastPrinted(lastPrinted) {
        result := ComCall(27, this, "ptr", lastPrinted, "HRESULT")
        return result
    }

    /**
     * Gets the modified property.
     * @returns {SYSTEMTIME} The date and time that are read from the <b>modified</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getmodified
     */
    GetModified() {
        modified := SYSTEMTIME()
        result := ComCall(28, this, "ptr", modified, "HRESULT")
        return modified
    }

    /**
     * Sets the modified property.
     * @param {Pointer<SYSTEMTIME>} modified The date and time the package was last changed. A <b>NULL</b> pointer clears the <b>modified</b> property.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setmodified
     */
    SetModified(modified) {
        result := ComCall(29, this, "ptr", modified, "HRESULT")
        return result
    }

    /**
     * Gets the revision property.
     * @returns {PWSTR} The string that is read from the <b>revision</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getrevision
     */
    GetRevision() {
        result := ComCall(30, this, "ptr*", &revision := 0, "HRESULT")
        return revision
    }

    /**
     * Sets the revision property.
     * @param {PWSTR} revision The string to be written to the <b>revision</b> property. A <b>NULL</b> pointer clears the <b>revision</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setrevision
     */
    SetRevision(revision) {
        revision := revision is String ? StrPtr(revision) : revision

        result := ComCall(31, this, "ptr", revision, "HRESULT")
        return result
    }

    /**
     * Gets the subject property.
     * @returns {PWSTR} The string that is read from the <b>subject</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getsubject
     */
    GetSubject() {
        result := ComCall(32, this, "ptr*", &subject := 0, "HRESULT")
        return subject
    }

    /**
     * Sets the subject property.
     * @param {PWSTR} subject The string to be written to the <b>subject</b> property. A <b>NULL</b> pointer clears the <b>subject</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setsubject
     */
    SetSubject(subject) {
        subject := subject is String ? StrPtr(subject) : subject

        result := ComCall(33, this, "ptr", subject, "HRESULT")
        return result
    }

    /**
     * Gets the title property.
     * @returns {PWSTR} The string that is read from the <b>title</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-gettitle
     */
    GetTitle() {
        result := ComCall(34, this, "ptr*", &title := 0, "HRESULT")
        return title
    }

    /**
     * Sets the title property.
     * @param {PWSTR} title The string to be written to the <b>title</b> property. A <b>NULL</b> pointer clears the <b>title</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-settitle
     */
    SetTitle(title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(35, this, "ptr", title, "HRESULT")
        return result
    }

    /**
     * Gets the version property.
     * @returns {PWSTR} The string that is read from the <b>version</b> property.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getversion
     */
    GetVersion() {
        result := ComCall(36, this, "ptr*", &version := 0, "HRESULT")
        return version
    }

    /**
     * Sets the version property.
     * @param {PWSTR} version The string to be written to the <b>version</b> property. A <b>NULL</b> pointer clears the <b>version</b> property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setversion
     */
    SetVersion(version) {
        version := version is String ? StrPtr(version) : version

        result := ComCall(37, this, "ptr", version, "HRESULT")
        return result
    }

    /**
     * Makes a deep copy of the interface.
     * @returns {IXpsOMCoreProperties} A pointer to the copy of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-clone
     */
    Clone() {
        result := ComCall(38, this, "ptr*", &coreProperties := 0, "HRESULT")
        return IXpsOMCoreProperties(coreProperties)
    }
}
