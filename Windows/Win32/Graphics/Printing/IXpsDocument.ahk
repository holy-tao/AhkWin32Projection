#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPartThumbnail.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsDocument extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThumbnail", "SetThumbnail"]

    /**
     * 
     * @returns {IPartThumbnail} 
     */
    GetThumbnail() {
        result := ComCall(3, this, "ptr*", &ppThumbnail := 0, "HRESULT")
        return IPartThumbnail(ppThumbnail)
    }

    /**
     * 
     * @param {IPartThumbnail} pThumbnail 
     * @returns {HRESULT} 
     */
    SetThumbnail(pThumbnail) {
        result := ComCall(4, this, "ptr", pThumbnail, "HRESULT")
        return result
    }
}
