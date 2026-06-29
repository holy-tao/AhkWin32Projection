#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmActionEmail.ahk" { IFsrmActionEmail }

/**
 * Used to limit the number of expired files listed in the email notification.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmactionemail2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmActionEmail2 extends IFsrmActionEmail {
    /**
     * The interface identifier for IFsrmActionEmail2
     * @type {Guid}
     */
    static IID := Guid("{8276702f-2532-4839-89bf-4872609a2ea4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmActionEmail2 interfaces
    */
    struct Vtbl extends IFsrmActionEmail.Vtbl {
        get_AttachmentFileListSize : IntPtr
        put_AttachmentFileListSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmActionEmail2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    AttachmentFileListSize {
        get => this.get_AttachmentFileListSize()
        set => this.put_AttachmentFileListSize(value)
    }

    /**
     * The maximum number of files to include in the list. (Get)
     * @remarks
     * The attached file is a plain text file. The file contains a line for each file up to the maximum list size. 
     *     Each line is in the form, [Source File Path],[Source File Remote Paths].
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail2-get_attachmentfilelistsize
     */
    get_AttachmentFileListSize() {
        result := ComCall(26, this, "int*", &attachmentFileListSize := 0, "HRESULT")
        return attachmentFileListSize
    }

    /**
     * The maximum number of files to include in the list. (Put)
     * @remarks
     * The attached file is a plain text file. The file contains a line for each file up to the maximum list size. 
     *     Each line is in the form, [Source File Path],[Source File Remote Paths].
     * @param {Integer} attachmentFileListSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmactionemail2-put_attachmentfilelistsize
     */
    put_AttachmentFileListSize(attachmentFileListSize) {
        result := ComCall(27, this, "int", attachmentFileListSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmActionEmail2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AttachmentFileListSize := CallbackCreate(GetMethod(implObj, "get_AttachmentFileListSize"), flags, 2)
        this.vtbl.put_AttachmentFileListSize := CallbackCreate(GetMethod(implObj, "put_AttachmentFileListSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AttachmentFileListSize)
        CallbackFree(this.vtbl.put_AttachmentFileListSize)
    }
}
