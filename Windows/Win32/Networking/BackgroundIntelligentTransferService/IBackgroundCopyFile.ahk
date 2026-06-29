#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BG_FILE_PROGRESS.ahk" { BG_FILE_PROGRESS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * IBackgroundCopyFile contains information about a file that is part of a job. For example, you can use IBackgroundCopyFile methods to retrieve the local and remote names of the file and transfer progress information.
 * @see https://learn.microsoft.com/windows/win32/api/bits/nn-bits-ibackgroundcopyfile
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyFile extends IUnknown {
    /**
     * The interface identifier for IBackgroundCopyFile
     * @type {Guid}
     */
    static IID := Guid("{01b7bd23-fb88-4a77-8490-5891d3e4653a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyFile interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRemoteName : IntPtr
        GetLocalName  : IntPtr
        GetProgress   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyFile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the remote name of the file.
     * @remarks
     * The remote file name is set when you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-addfile">AddFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-addfileset">AddFileSet</a> methods of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob</a> interface.
     * 
     * To change the remote file name, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/nf-bits2_0-ibackgroundcopyfile2-setremotename">IBackgroundCopyFile2::SetRemoteName</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-replaceremoteprefix">IBackgroundCopyJob3::ReplaceRemotePrefix</a> method.
     * @returns {PWSTR} Null-terminated string that contains the remote name of the file to transfer. The name is fully qualified. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppName</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyfile-getremotename
     */
    GetRemoteName() {
        result := ComCall(3, this, PWSTR.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the local name of the file.
     * @remarks
     * The local file name is set when you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-addfile">AddFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-addfileset">AddFileSet</a> methods of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob</a> interface.
     * @returns {PWSTR} Null-terminated string that contains the name of the file on the client. The name is fully qualified. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppName</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyfile-getlocalname
     */
    GetLocalName() {
        result := ComCall(4, this, PWSTR.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves information on the progress of the file transfer.
     * @returns {BG_FILE_PROGRESS} Structure whose members indicate the progress of the file transfer. For details on the type of progress information available, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_progress">BG_FILE_PROGRESS</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyfile-getprogress
     */
    GetProgress() {
        pVal := BG_FILE_PROGRESS()
        result := ComCall(5, this, BG_FILE_PROGRESS.Ptr, pVal, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IBackgroundCopyFile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRemoteName := CallbackCreate(GetMethod(implObj, "GetRemoteName"), flags, 2)
        this.vtbl.GetLocalName := CallbackCreate(GetMethod(implObj, "GetLocalName"), flags, 2)
        this.vtbl.GetProgress := CallbackCreate(GetMethod(implObj, "GetProgress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRemoteName)
        CallbackFree(this.vtbl.GetLocalName)
        CallbackFree(this.vtbl.GetProgress)
    }
}
