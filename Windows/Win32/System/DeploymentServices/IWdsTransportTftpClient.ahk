#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} pbszFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_filename
     */
    get_FileName(pbszFileName) {
        result := ComCall(7, this, "ptr", pbszFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszIpAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_ipaddress
     */
    get_IpAddress(pbszIpAddress) {
        result := ComCall(8, this, "ptr", pbszIpAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_timeout
     */
    get_Timeout(pulTimeout) {
        pulTimeoutMarshal := pulTimeout is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pulTimeoutMarshal, pulTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pul64CurrentOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_currentfileoffset
     */
    get_CurrentFileOffset(pul64CurrentOffset) {
        pul64CurrentOffsetMarshal := pul64CurrentOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pul64CurrentOffsetMarshal, pul64CurrentOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pul64FileSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_filesize
     */
    get_FileSize(pul64FileSize) {
        pul64FileSizeMarshal := pul64FileSize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pul64FileSizeMarshal, pul64FileSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulBlockSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_blocksize
     */
    get_BlockSize(pulBlockSize) {
        pulBlockSizeMarshal := pulBlockSize is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pulBlockSizeMarshal, pulBlockSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulWindowSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransporttftpclient-get_windowsize
     */
    get_WindowSize(pulWindowSize) {
        pulWindowSizeMarshal := pulWindowSize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pulWindowSizeMarshal, pulWindowSize, "HRESULT")
        return result
    }
}
