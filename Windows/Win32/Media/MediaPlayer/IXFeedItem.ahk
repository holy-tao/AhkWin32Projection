#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\FEEDS_XML_INCLUDE_FLAGS.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
class IXFeedItem extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedItem
     * @type {Guid}
     */
    static IID => Guid("{e757b2f5-e73e-434e-a1bf-2bd7c3e60fcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Xml", "Title", "Link", "Guid", "Description", "PubDate", "Comments", "Author", "Enclosure", "IsRead", "SetIsRead", "LocalId", "Parent", "Delete", "DownloadUrl", "LastDownloadTime", "Modified"]

    /**
     * 
     * @param {FEEDS_XML_INCLUDE_FLAGS} fxif 
     * @returns {IStream} 
     */
    Xml(fxif) {
        result := ComCall(3, this, "int", fxif, "ptr*", &pps := 0, "HRESULT")
        return IStream(pps)
    }

    /**
     * The Title attribute contains the title of the content in the file.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/title
     */
    Title() {
        result := ComCall(4, this, "ptr*", &ppszTitle := 0, "HRESULT")
        return ppszTitle
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Link() {
        result := ComCall(5, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * Defines a GUID that can be used in other templates.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/direct3d9/guid
     */
    Guid() {
        result := ComCall(6, this, "ptr*", &ppszGuid := 0, "HRESULT")
        return ppszGuid
    }

    /**
     * Description (Mobile Broadband) - Description
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/mbn/element-description
     */
    Description() {
        result := ComCall(7, this, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    PubDate() {
        pstPubDate := SYSTEMTIME()
        result := ComCall(8, this, "ptr", pstPubDate, "HRESULT")
        return pstPubDate
    }

    /**
     * Add comments to metafiles by following Extensible Markup Language (XML) syntax. Comments begin with \ 0034; -- \ 0034; and end with \ 0034;-- \ 0034;.
     * @remarks
     * Comments can appear anywhere except within element content (between element open and close tags, < >). They are not part of the document's character data and are ignored when the metafile is parsed.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/WMP/comments
     */
    Comments() {
        result := ComCall(9, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * The Author attribute contains the name of a media artist or actor associated with the content.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/author
     */
    Author() {
        result := ComCall(10, this, "ptr*", &ppszAuthor := 0, "HRESULT")
        return ppszAuthor
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Enclosure(riid) {
        result := ComCall(11, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsRead() {
        result := ComCall(12, this, "int*", &pbIsRead := 0, "HRESULT")
        return pbIsRead
    }

    /**
     * 
     * @param {BOOL} bIsRead 
     * @returns {HRESULT} 
     */
    SetIsRead(bIsRead) {
        result := ComCall(13, this, "int", bIsRead, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    LocalId() {
        result := ComCall(14, this, "uint*", &puiId := 0, "HRESULT")
        return puiId
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Parent(riid) {
        result := ComCall(15, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(17, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastDownloadTime() {
        pstLastDownloadTime := SYSTEMTIME()
        result := ComCall(18, this, "ptr", pstLastDownloadTime, "HRESULT")
        return pstLastDownloadTime
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    Modified() {
        pstModifiedTime := SYSTEMTIME()
        result := ComCall(19, this, "ptr", pstModifiedTime, "HRESULT")
        return pstModifiedTime
    }
}
