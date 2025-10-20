#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmActionEmail.ahk

/**
 * Used to limit the number of expired files listed in the email notification.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmactionemail2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmActionEmail2 extends IFsrmActionEmail{
    /**
     * The interface identifier for IFsrmActionEmail2
     * @type {Guid}
     */
    static IID => Guid("{8276702f-2532-4839-89bf-4872609a2ea4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {Pointer<Int32>} attachmentFileListSize 
     * @returns {HRESULT} 
     */
    get_AttachmentFileListSize(attachmentFileListSize) {
        result := ComCall(26, this, "int*", attachmentFileListSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} attachmentFileListSize 
     * @returns {HRESULT} 
     */
    put_AttachmentFileListSize(attachmentFileListSize) {
        result := ComCall(27, this, "int", attachmentFileListSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
