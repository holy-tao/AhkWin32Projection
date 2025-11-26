#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * This interface is used to specify information of a TFTP client session currently active in the server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransporttftpclient
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportTftpClient extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportTftpClient
     * @type {Guid}
     */
    static IID => Guid("{b022d3ae-884d-4d85-b146-53320e76ef62}")

    /**
     * The class identifier for WdsTransportTftpClient
     * @type {Guid}
     */
    static CLSID => Guid("{50343925-7c5c-4c8c-96c4-ad9fa5005fba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FileName", "get_IpAddress", "get_Timeout", "get_CurrentFileOffset", "get_FileSize", "get_BlockSize", "get_WindowSize"]

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
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_filename
     */
    get_FileName() {
        pbszFileName := BSTR()
        result := ComCall(7, this, "ptr", pbszFileName, "HRESULT")
        return pbszFileName
    }

    /**
     * Receives a string value containing the client’s IP address.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_ipaddress
     */
    get_IpAddress() {
        pbszIpAddress := BSTR()
        result := ComCall(8, this, "ptr", pbszIpAddress, "HRESULT")
        return pbszIpAddress
    }

    /**
     * Receives the timeout in seconds used to communicate with the client.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_timeout
     */
    get_Timeout() {
        result := ComCall(9, this, "uint*", &pulTimeout := 0, "HRESULT")
        return pulTimeout
    }

    /**
     * Receives the offset from the start of the file in bytes of the current block being transferred in the TFTP session.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_currentfileoffset
     */
    get_CurrentFileOffset() {
        result := ComCall(10, this, "uint*", &pul64CurrentOffset := 0, "HRESULT")
        return pul64CurrentOffset
    }

    /**
     * Receives the size in bytes of the file being transferred.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_filesize
     */
    get_FileSize() {
        result := ComCall(11, this, "uint*", &pul64FileSize := 0, "HRESULT")
        return pul64FileSize
    }

    /**
     * Retrieves the block size used in the TFTP session.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_blocksize
     */
    get_BlockSize() {
        result := ComCall(12, this, "uint*", &pulBlockSize := 0, "HRESULT")
        return pulBlockSize
    }

    /**
     * Receives the current window size being used in the TFTP session. The window size used during a TFTP session can be updated by the client through ACK packets when using the variable-window TFTP extension.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_windowsize
     */
    get_WindowSize() {
        result := ComCall(13, this, "uint*", &pulWindowSize := 0, "HRESULT")
        return pulWindowSize
    }
}
