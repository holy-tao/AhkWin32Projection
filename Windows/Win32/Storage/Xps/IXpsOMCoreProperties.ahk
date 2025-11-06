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
     * 
     * @returns {IXpsOMPackage} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getowner
     */
    GetOwner() {
        result := ComCall(5, this, "ptr*", &package := 0, "HRESULT")
        return IXpsOMPackage(package)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcategory
     */
    GetCategory() {
        result := ComCall(6, this, "ptr*", &category := 0, "HRESULT")
        return category
    }

    /**
     * 
     * @param {PWSTR} category 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcategory
     */
    SetCategory(category) {
        category := category is String ? StrPtr(category) : category

        result := ComCall(7, this, "ptr", category, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcontentstatus
     */
    GetContentStatus() {
        result := ComCall(8, this, "ptr*", &contentStatus := 0, "HRESULT")
        return contentStatus
    }

    /**
     * 
     * @param {PWSTR} contentStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcontentstatus
     */
    SetContentStatus(contentStatus) {
        contentStatus := contentStatus is String ? StrPtr(contentStatus) : contentStatus

        result := ComCall(9, this, "ptr", contentStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcontenttype
     */
    GetContentType() {
        result := ComCall(10, this, "ptr*", &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * 
     * @param {PWSTR} contentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcontenttype
     */
    SetContentType(contentType) {
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(11, this, "ptr", contentType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcreated
     */
    GetCreated() {
        created := SYSTEMTIME()
        result := ComCall(12, this, "ptr", created, "HRESULT")
        return created
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} created 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcreated
     */
    SetCreated(created) {
        result := ComCall(13, this, "ptr", created, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcreator
     */
    GetCreator() {
        result := ComCall(14, this, "ptr*", &creator := 0, "HRESULT")
        return creator
    }

    /**
     * 
     * @param {PWSTR} creator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setcreator
     */
    SetCreator(creator) {
        creator := creator is String ? StrPtr(creator) : creator

        result := ComCall(15, this, "ptr", creator, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getdescription
     */
    GetDescription() {
        result := ComCall(16, this, "ptr*", &description := 0, "HRESULT")
        return description
    }

    /**
     * 
     * @param {PWSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setdescription
     */
    SetDescription(description) {
        description := description is String ? StrPtr(description) : description

        result := ComCall(17, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getidentifier
     */
    GetIdentifier() {
        result := ComCall(18, this, "ptr*", &identifier := 0, "HRESULT")
        return identifier
    }

    /**
     * 
     * @param {PWSTR} identifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setidentifier
     */
    SetIdentifier(identifier) {
        identifier := identifier is String ? StrPtr(identifier) : identifier

        result := ComCall(19, this, "ptr", identifier, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getkeywords
     */
    GetKeywords() {
        result := ComCall(20, this, "ptr*", &keywords := 0, "HRESULT")
        return keywords
    }

    /**
     * 
     * @param {PWSTR} keywords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setkeywords
     */
    SetKeywords(keywords) {
        keywords := keywords is String ? StrPtr(keywords) : keywords

        result := ComCall(21, this, "ptr", keywords, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlanguage
     */
    GetLanguage() {
        result := ComCall(22, this, "ptr*", &language := 0, "HRESULT")
        return language
    }

    /**
     * 
     * @param {PWSTR} language 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setlanguage
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(23, this, "ptr", language, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlastmodifiedby
     */
    GetLastModifiedBy() {
        result := ComCall(24, this, "ptr*", &lastModifiedBy := 0, "HRESULT")
        return lastModifiedBy
    }

    /**
     * 
     * @param {PWSTR} lastModifiedBy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setlastmodifiedby
     */
    SetLastModifiedBy(lastModifiedBy) {
        lastModifiedBy := lastModifiedBy is String ? StrPtr(lastModifiedBy) : lastModifiedBy

        result := ComCall(25, this, "ptr", lastModifiedBy, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlastprinted
     */
    GetLastPrinted() {
        lastPrinted := SYSTEMTIME()
        result := ComCall(26, this, "ptr", lastPrinted, "HRESULT")
        return lastPrinted
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} lastPrinted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setlastprinted
     */
    SetLastPrinted(lastPrinted) {
        result := ComCall(27, this, "ptr", lastPrinted, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getmodified
     */
    GetModified() {
        modified := SYSTEMTIME()
        result := ComCall(28, this, "ptr", modified, "HRESULT")
        return modified
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} modified 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setmodified
     */
    SetModified(modified) {
        result := ComCall(29, this, "ptr", modified, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getrevision
     */
    GetRevision() {
        result := ComCall(30, this, "ptr*", &revision := 0, "HRESULT")
        return revision
    }

    /**
     * 
     * @param {PWSTR} revision 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setrevision
     */
    SetRevision(revision) {
        revision := revision is String ? StrPtr(revision) : revision

        result := ComCall(31, this, "ptr", revision, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getsubject
     */
    GetSubject() {
        result := ComCall(32, this, "ptr*", &subject := 0, "HRESULT")
        return subject
    }

    /**
     * 
     * @param {PWSTR} subject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setsubject
     */
    SetSubject(subject) {
        subject := subject is String ? StrPtr(subject) : subject

        result := ComCall(33, this, "ptr", subject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-gettitle
     */
    GetTitle() {
        result := ComCall(34, this, "ptr*", &title := 0, "HRESULT")
        return title
    }

    /**
     * 
     * @param {PWSTR} title 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-settitle
     */
    SetTitle(title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(35, this, "ptr", title, "HRESULT")
        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @returns {PWSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion() {
        result := ComCall(36, this, "ptr*", &version := 0, "HRESULT")
        return version
    }

    /**
     * 
     * @param {PWSTR} version 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-setversion
     */
    SetVersion(version) {
        version := version is String ? StrPtr(version) : version

        result := ComCall(37, this, "ptr", version, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsOMCoreProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-clone
     */
    Clone() {
        result := ComCall(38, this, "ptr*", &coreProperties := 0, "HRESULT")
        return IXpsOMCoreProperties(coreProperties)
    }
}
