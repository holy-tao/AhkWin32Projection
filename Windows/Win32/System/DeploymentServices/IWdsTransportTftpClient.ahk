#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This interface is used to specify information of a TFTP client session currently active in the server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransporttftpclient
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportTftpClient extends IDispatch {
    /**
     * The interface identifier for IWdsTransportTftpClient
     * @type {Guid}
     */
    static IID := Guid("{b022d3ae-884d-4d85-b146-53320e76ef62}")

    /**
     * The class identifier for WdsTransportTftpClient
     * @type {Guid}
     */
    static CLSID := Guid("{50343925-7c5c-4c8c-96c4-ad9fa5005fba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportTftpClient interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_FileName          : IntPtr
        get_IpAddress         : IntPtr
        get_Timeout           : IntPtr
        get_CurrentFileOffset : IntPtr
        get_FileSize          : IntPtr
        get_BlockSize         : IntPtr
        get_WindowSize        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportTftpClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    FileName {
        get => this.get_FileName()
    }

    /**
     * @type {BSTR} 
     */
    IpAddress {
        get => this.get_IpAddress()
    }

    /**
     * @type {Integer} 
     */
    Timeout {
        get => this.get_Timeout()
    }

    /**
     * @type {Integer} 
     */
    CurrentFileOffset {
        get => this.get_CurrentFileOffset()
    }

    /**
     * @type {Integer} 
     */
    FileSize {
        get => this.get_FileSize()
    }

    /**
     * @type {Integer} 
     */
    BlockSize {
        get => this.get_BlockSize()
    }

    /**
     * @type {Integer} 
     */
    WindowSize {
        get => this.get_WindowSize()
    }

    /**
     * Retrieves the name of the file being transferred in the TFTP session.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_filename
     */
    get_FileName() {
        pbszFileName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbszFileName, "HRESULT")
        return pbszFileName
    }

    /**
     * Receives a string value containing the client’s IP address.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_ipaddress
     */
    get_IpAddress() {
        pbszIpAddress := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbszIpAddress, "HRESULT")
        return pbszIpAddress
    }

    /**
     * Receives the timeout in seconds used to communicate with the client.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_timeout
     */
    get_Timeout() {
        result := ComCall(9, this, "uint*", &pulTimeout := 0, "HRESULT")
        return pulTimeout
    }

    /**
     * Receives the offset from the start of the file in bytes of the current block being transferred in the TFTP session.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_currentfileoffset
     */
    get_CurrentFileOffset() {
        result := ComCall(10, this, "uint*", &pul64CurrentOffset := 0, "HRESULT")
        return pul64CurrentOffset
    }

    /**
     * Receives the size in bytes of the file being transferred.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_filesize
     */
    get_FileSize() {
        result := ComCall(11, this, "uint*", &pul64FileSize := 0, "HRESULT")
        return pul64FileSize
    }

    /**
     * Retrieves the block size used in the TFTP session.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_blocksize
     */
    get_BlockSize() {
        result := ComCall(12, this, "uint*", &pulBlockSize := 0, "HRESULT")
        return pulBlockSize
    }

    /**
     * Receives the current window size being used in the TFTP session. The window size used during a TFTP session can be updated by the client through ACK packets when using the variable-window TFTP extension.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_windowsize
     */
    get_WindowSize() {
        result := ComCall(13, this, "uint*", &pulWindowSize := 0, "HRESULT")
        return pulWindowSize
    }

    Query(iid) {
        if (IWdsTransportTftpClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FileName := CallbackCreate(GetMethod(implObj, "get_FileName"), flags, 2)
        this.vtbl.get_IpAddress := CallbackCreate(GetMethod(implObj, "get_IpAddress"), flags, 2)
        this.vtbl.get_Timeout := CallbackCreate(GetMethod(implObj, "get_Timeout"), flags, 2)
        this.vtbl.get_CurrentFileOffset := CallbackCreate(GetMethod(implObj, "get_CurrentFileOffset"), flags, 2)
        this.vtbl.get_FileSize := CallbackCreate(GetMethod(implObj, "get_FileSize"), flags, 2)
        this.vtbl.get_BlockSize := CallbackCreate(GetMethod(implObj, "get_BlockSize"), flags, 2)
        this.vtbl.get_WindowSize := CallbackCreate(GetMethod(implObj, "get_WindowSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FileName)
        CallbackFree(this.vtbl.get_IpAddress)
        CallbackFree(this.vtbl.get_Timeout)
        CallbackFree(this.vtbl.get_CurrentFileOffset)
        CallbackFree(this.vtbl.get_FileSize)
        CallbackFree(this.vtbl.get_BlockSize)
        CallbackFree(this.vtbl.get_WindowSize)
    }
}
