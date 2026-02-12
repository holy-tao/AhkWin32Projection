#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPartThumbnail.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IXpsDocumentPackageTarget interface contains the elements needed for printing XPS content in the Document Printing model.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel_1/nn-xpsobjectmodel_1-ixpsdocumentpackagetarget
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
        result := ComCall(3, this, "ptr*", &ppThumbnail := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPartThumbnail(ppThumbnail)
    }

    /**
     * 
     * @param {IPartThumbnail} pThumbnail 
     * @returns {HRESULT} 
     */
    SetThumbnail(pThumbnail) {
        result := ComCall(4, this, "ptr", pThumbnail, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
