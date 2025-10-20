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
     * 
     * @param {Pointer<IXpsOMPackage>} package 
     * @returns {HRESULT} 
     */
    GetOwner(package) {
        result := ComCall(5, this, "ptr", package, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} category 
     * @returns {HRESULT} 
     */
    GetCategory(category) {
        result := ComCall(6, this, "ptr", category, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} category 
     * @returns {HRESULT} 
     */
    SetCategory(category) {
        category := category is String ? StrPtr(category) : category

        result := ComCall(7, this, "ptr", category, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} contentStatus 
     * @returns {HRESULT} 
     */
    GetContentStatus(contentStatus) {
        result := ComCall(8, this, "ptr", contentStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} contentStatus 
     * @returns {HRESULT} 
     */
    SetContentStatus(contentStatus) {
        contentStatus := contentStatus is String ? StrPtr(contentStatus) : contentStatus

        result := ComCall(9, this, "ptr", contentStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} contentType 
     * @returns {HRESULT} 
     */
    GetContentType(contentType) {
        result := ComCall(10, this, "ptr", contentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} contentType 
     * @returns {HRESULT} 
     */
    SetContentType(contentType) {
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(11, this, "ptr", contentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} created 
     * @returns {HRESULT} 
     */
    GetCreated(created) {
        result := ComCall(12, this, "ptr", created, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} created 
     * @returns {HRESULT} 
     */
    SetCreated(created) {
        result := ComCall(13, this, "ptr", created, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} creator 
     * @returns {HRESULT} 
     */
    GetCreator(creator) {
        result := ComCall(14, this, "ptr", creator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} creator 
     * @returns {HRESULT} 
     */
    SetCreator(creator) {
        creator := creator is String ? StrPtr(creator) : creator

        result := ComCall(15, this, "ptr", creator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} description 
     * @returns {HRESULT} 
     */
    GetDescription(description) {
        result := ComCall(16, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} description 
     * @returns {HRESULT} 
     */
    SetDescription(description) {
        description := description is String ? StrPtr(description) : description

        result := ComCall(17, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} identifier 
     * @returns {HRESULT} 
     */
    GetIdentifier(identifier) {
        result := ComCall(18, this, "ptr", identifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} identifier 
     * @returns {HRESULT} 
     */
    SetIdentifier(identifier) {
        identifier := identifier is String ? StrPtr(identifier) : identifier

        result := ComCall(19, this, "ptr", identifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} keywords 
     * @returns {HRESULT} 
     */
    GetKeywords(keywords) {
        result := ComCall(20, this, "ptr", keywords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} keywords 
     * @returns {HRESULT} 
     */
    SetKeywords(keywords) {
        keywords := keywords is String ? StrPtr(keywords) : keywords

        result := ComCall(21, this, "ptr", keywords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} language 
     * @returns {HRESULT} 
     */
    GetLanguage(language) {
        result := ComCall(22, this, "ptr", language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} language 
     * @returns {HRESULT} 
     */
    SetLanguage(language) {
        language := language is String ? StrPtr(language) : language

        result := ComCall(23, this, "ptr", language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lastModifiedBy 
     * @returns {HRESULT} 
     */
    GetLastModifiedBy(lastModifiedBy) {
        result := ComCall(24, this, "ptr", lastModifiedBy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lastModifiedBy 
     * @returns {HRESULT} 
     */
    SetLastModifiedBy(lastModifiedBy) {
        lastModifiedBy := lastModifiedBy is String ? StrPtr(lastModifiedBy) : lastModifiedBy

        result := ComCall(25, this, "ptr", lastModifiedBy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} lastPrinted 
     * @returns {HRESULT} 
     */
    GetLastPrinted(lastPrinted) {
        result := ComCall(26, this, "ptr", lastPrinted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} lastPrinted 
     * @returns {HRESULT} 
     */
    SetLastPrinted(lastPrinted) {
        result := ComCall(27, this, "ptr", lastPrinted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} modified 
     * @returns {HRESULT} 
     */
    GetModified(modified) {
        result := ComCall(28, this, "ptr", modified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} modified 
     * @returns {HRESULT} 
     */
    SetModified(modified) {
        result := ComCall(29, this, "ptr", modified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} revision 
     * @returns {HRESULT} 
     */
    GetRevision(revision) {
        result := ComCall(30, this, "ptr", revision, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} revision 
     * @returns {HRESULT} 
     */
    SetRevision(revision) {
        revision := revision is String ? StrPtr(revision) : revision

        result := ComCall(31, this, "ptr", revision, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} subject 
     * @returns {HRESULT} 
     */
    GetSubject(subject) {
        result := ComCall(32, this, "ptr", subject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} subject 
     * @returns {HRESULT} 
     */
    SetSubject(subject) {
        subject := subject is String ? StrPtr(subject) : subject

        result := ComCall(33, this, "ptr", subject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} title 
     * @returns {HRESULT} 
     */
    GetTitle(title) {
        result := ComCall(34, this, "ptr", title, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} title 
     * @returns {HRESULT} 
     */
    SetTitle(title) {
        title := title is String ? StrPtr(title) : title

        result := ComCall(35, this, "ptr", title, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(36, this, "ptr", version, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} version 
     * @returns {HRESULT} 
     */
    SetVersion(version) {
        version := version is String ? StrPtr(version) : version

        result := ComCall(37, this, "ptr", version, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMCoreProperties>} coreProperties 
     * @returns {HRESULT} 
     */
    Clone(coreProperties) {
        result := ComCall(38, this, "ptr", coreProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
