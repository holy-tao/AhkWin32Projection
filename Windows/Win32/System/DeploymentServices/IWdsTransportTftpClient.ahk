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
     * 
     * @param {Pointer<BSTR>} pbszFileName 
     * @returns {HRESULT} 
     */
    get_FileName(pbszFileName) {
        result := ComCall(7, this, "ptr", pbszFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszIpAddress 
     * @returns {HRESULT} 
     */
    get_IpAddress(pbszIpAddress) {
        result := ComCall(8, this, "ptr", pbszIpAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulTimeout 
     * @returns {HRESULT} 
     */
    get_Timeout(pulTimeout) {
        result := ComCall(9, this, "uint*", pulTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pul64CurrentOffset 
     * @returns {HRESULT} 
     */
    get_CurrentFileOffset(pul64CurrentOffset) {
        result := ComCall(10, this, "uint*", pul64CurrentOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pul64FileSize 
     * @returns {HRESULT} 
     */
    get_FileSize(pul64FileSize) {
        result := ComCall(11, this, "uint*", pul64FileSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulBlockSize 
     * @returns {HRESULT} 
     */
    get_BlockSize(pulBlockSize) {
        result := ComCall(12, this, "uint*", pulBlockSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulWindowSize 
     * @returns {HRESULT} 
     */
    get_WindowSize(pulWindowSize) {
        result := ComCall(13, this, "uint*", pulWindowSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
