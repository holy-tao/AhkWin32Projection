#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsDocument extends IUnknown{
    /**
     * The interface identifier for IXpsDocument
     * @type {Guid}
     */
    static IID => Guid("{e8d907db-62a9-4a95-abe7-e01763dd30f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPartThumbnail>} ppThumbnail 
     * @returns {HRESULT} 
     */
    GetThumbnail(ppThumbnail) {
        result := ComCall(3, this, "ptr", ppThumbnail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPartThumbnail>} pThumbnail 
     * @returns {HRESULT} 
     */
    SetThumbnail(pThumbnail) {
        result := ComCall(4, this, "ptr", pThumbnail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
