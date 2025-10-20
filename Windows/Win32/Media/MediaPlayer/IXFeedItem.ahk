#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedItem extends IUnknown{
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
     * 
     * @param {Integer} fxif 
     * @param {Pointer<IStream>} pps 
     * @returns {HRESULT} 
     */
    Xml(fxif, pps) {
        result := ComCall(3, this, "int", fxif, "ptr", pps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTitle 
     * @returns {HRESULT} 
     */
    Title(ppszTitle) {
        result := ComCall(4, this, "ptr", ppszTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUrl 
     * @returns {HRESULT} 
     */
    Link(ppszUrl) {
        result := ComCall(5, this, "ptr", ppszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszGuid 
     * @returns {HRESULT} 
     */
    Guid(ppszGuid) {
        result := ComCall(6, this, "ptr", ppszGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDescription 
     * @returns {HRESULT} 
     */
    Description(ppszDescription) {
        result := ComCall(7, this, "ptr", ppszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstPubDate 
     * @returns {HRESULT} 
     */
    PubDate(pstPubDate) {
        result := ComCall(8, this, "ptr", pstPubDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUrl 
     * @returns {HRESULT} 
     */
    Comments(ppszUrl) {
        result := ComCall(9, this, "ptr", ppszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszAuthor 
     * @returns {HRESULT} 
     */
    Author(ppszAuthor) {
        result := ComCall(10, this, "ptr", ppszAuthor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    Enclosure(riid, ppv) {
        result := ComCall(11, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbIsRead 
     * @returns {HRESULT} 
     */
    IsRead(pbIsRead) {
        result := ComCall(12, this, "ptr", pbIsRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bIsRead 
     * @returns {HRESULT} 
     */
    SetIsRead(bIsRead) {
        result := ComCall(13, this, "int", bIsRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiId 
     * @returns {HRESULT} 
     */
    LocalId(puiId) {
        result := ComCall(14, this, "uint*", puiId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    Parent(riid, ppv) {
        result := ComCall(15, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUrl 
     * @returns {HRESULT} 
     */
    DownloadUrl(ppszUrl) {
        result := ComCall(17, this, "ptr", ppszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstLastDownloadTime 
     * @returns {HRESULT} 
     */
    LastDownloadTime(pstLastDownloadTime) {
        result := ComCall(18, this, "ptr", pstLastDownloadTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstModifiedTime 
     * @returns {HRESULT} 
     */
    Modified(pstModifiedTime) {
        result := ComCall(19, this, "ptr", pstModifiedTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
