#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IXpsOMPackage>} package 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getowner
     */
    GetOwner(package) {
        result := ComCall(5, this, "ptr*", package, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} category 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcategory
     */
    GetCategory(category) {
        result := ComCall(6, this, "ptr", category, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} contentStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcontentstatus
     */
    GetContentStatus(contentStatus) {
        result := ComCall(8, this, "ptr", contentStatus, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} contentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcontenttype
     */
    GetContentType(contentType) {
        result := ComCall(10, this, "ptr", contentType, "HRESULT")
        return result
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
     * @param {Pointer<SYSTEMTIME>} created 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcreated
     */
    GetCreated(created) {
        result := ComCall(12, this, "ptr", created, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} creator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getcreator
     */
    GetCreator(creator) {
        result := ComCall(14, this, "ptr", creator, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getdescription
     */
    GetDescription(description) {
        result := ComCall(16, this, "ptr", description, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} identifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getidentifier
     */
    GetIdentifier(identifier) {
        result := ComCall(18, this, "ptr", identifier, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} keywords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getkeywords
     */
    GetKeywords(keywords) {
        result := ComCall(20, this, "ptr", keywords, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} language 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlanguage
     */
    GetLanguage(language) {
        result := ComCall(22, this, "ptr", language, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} lastModifiedBy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlastmodifiedby
     */
    GetLastModifiedBy(lastModifiedBy) {
        result := ComCall(24, this, "ptr", lastModifiedBy, "HRESULT")
        return result
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
     * @param {Pointer<SYSTEMTIME>} lastPrinted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getlastprinted
     */
    GetLastPrinted(lastPrinted) {
        result := ComCall(26, this, "ptr", lastPrinted, "HRESULT")
        return result
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
     * @param {Pointer<SYSTEMTIME>} modified 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getmodified
     */
    GetModified(modified) {
        result := ComCall(28, this, "ptr", modified, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} revision 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getrevision
     */
    GetRevision(revision) {
        result := ComCall(30, this, "ptr", revision, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} subject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-getsubject
     */
    GetSubject(subject) {
        result := ComCall(32, this, "ptr", subject, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} title 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-gettitle
     */
    GetTitle(title) {
        result := ComCall(34, this, "ptr", title, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} version 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(version) {
        result := ComCall(36, this, "ptr", version, "HRESULT")
        return result
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
     * @param {Pointer<IXpsOMCoreProperties>} coreProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcoreproperties-clone
     */
    Clone(coreProperties) {
        result := ComCall(38, this, "ptr*", coreProperties, "HRESULT")
        return result
    }
}
