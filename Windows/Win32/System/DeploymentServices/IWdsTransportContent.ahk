#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents content being transmitted under a namespace over one or more sessions.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportcontent
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportContent extends IDispatch{
    /**
     * The interface identifier for IWdsTransportContent
     * @type {Guid}
     */
    static IID => Guid("{d405d711-0296-4ab4-a860-ac7d32e65798}")

    /**
     * The class identifier for WdsTransportContent
     * @type {Guid}
     */
    static CLSID => Guid("{0a891fe7-4a3f-4c65-b6f2-1467619679ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IWdsTransportNamespace>} ppWdsTransportNamespace 
     * @returns {HRESULT} 
     */
    get_Namespace(ppWdsTransportNamespace) {
        result := ComCall(7, this, "ptr", ppWdsTransportNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulId 
     * @returns {HRESULT} 
     */
    get_Id(pulId) {
        result := ComCall(8, this, "uint*", pulId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszName 
     * @returns {HRESULT} 
     */
    get_Name(pbszName) {
        result := ComCall(9, this, "ptr", pbszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportCollection>} ppWdsTransportSessions 
     * @returns {HRESULT} 
     */
    RetrieveSessions(ppWdsTransportSessions) {
        result := ComCall(10, this, "ptr", ppWdsTransportSessions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Terminate() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
