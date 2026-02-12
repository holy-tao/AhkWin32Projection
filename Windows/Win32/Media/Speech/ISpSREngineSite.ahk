#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpPhraseBuilder.ahk
#Include .\SPSTATEINFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSREngineSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpSREngineSite
     * @type {Guid}
     */
    static IID => Guid("{3b414aec-720c-4883-b9ef-178cd394fb3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "DataAvailable", "SetBufferNotifySize", "ParseFromTransitions", "Recognition", "AddEvent", "Synchronize", "GetWordInfo", "SetWordClientContext", "GetRuleInfo", "SetRuleClientContext", "GetStateInfo", "GetResource", "GetTransitionProperty", "IsAlternate", "GetMaxAlternates", "GetContextMaxAlternates", "UpdateRecoPos"]

    /**
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
     */
    Read(pv, cb) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvMarshal, pv, "uint", cb, "uint*", &pcbRead := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbRead
    }

    /**
     * 
     * @returns {Integer} 
     */
    DataAvailable() {
        result := ComCall(4, this, "uint*", &pcb := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcb
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @returns {HRESULT} 
     */
    SetBufferNotifySize(cbSize) {
        result := ComCall(5, this, "uint", cbSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<SPPARSEINFO>} pParseInfo 
     * @returns {ISpPhraseBuilder} 
     */
    ParseFromTransitions(pParseInfo) {
        result := ComCall(6, this, "ptr", pParseInfo, "ptr*", &ppNewPhrase := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpPhraseBuilder(ppNewPhrase)
    }

    /**
     * Indicates the level of confidence that the IInkAnalyzer has in the accuracy of the recognition result.
     * @remarks
     * The [**IInkAnalyzer**](iinkanalyzer.md) uses one or more [**IInkAnalysisRecognizer**](iinkanalysisrecognizer.md) objects to convert handwriting to text.
     * @param {Pointer<SPRECORESULTINFO>} pResultInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/recognitionconfidence
     */
    Recognition(pResultInfo) {
        result := ComCall(7, this, "ptr", pResultInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<SPEVENT>} pEvent 
     * @param {SPRECOCONTEXTHANDLE} hSAPIRecoContext 
     * @returns {HRESULT} 
     */
    AddEvent(pEvent, hSAPIRecoContext) {
        hSAPIRecoContext := hSAPIRecoContext is Win32Handle ? NumGet(hSAPIRecoContext, "ptr") : hSAPIRecoContext

        result := ComCall(8, this, "ptr", pEvent, "ptr", hSAPIRecoContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Synchronize Method (RDS)
     * @remarks
     * The *HandlerString* parameter may be null. What happens in this case depends on how the RDS server is configured. A handler string of "MSDFMAP.handler" indicates that the Microsoft supplied handler (Msdfmap.dll) should be used. A handler string of "MASDFMAP.handler,sample.ini" indicates that the Msdfmap.dll handler should be used and that the argument "sample.ini" should be passed to the handler. Msdfmap.dll will then interpret the argument as a direction to use the sample.ini to check the connection and query strings.
     * @param {Integer} ullProcessedThruPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/synchronize-method-rds
     */
    Synchronize(ullProcessedThruPos) {
        result := ComCall(9, this, "uint", ullProcessedThruPos, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<SPWORDENTRY>} pWordEntry 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    GetWordInfo(pWordEntry, Options) {
        result := ComCall(10, this, "ptr", pWordEntry, "int", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SPWORDHANDLE} hWord 
     * @param {Pointer<Void>} pvClientContext 
     * @returns {HRESULT} 
     */
    SetWordClientContext(hWord, pvClientContext) {
        hWord := hWord is Win32Handle ? NumGet(hWord, "ptr") : hWord

        pvClientContextMarshal := pvClientContext is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "ptr", hWord, pvClientContextMarshal, pvClientContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<SPRULEENTRY>} pRuleEntry 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    GetRuleInfo(pRuleEntry, Options) {
        result := ComCall(12, this, "ptr", pRuleEntry, "int", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {Pointer<Void>} pvClientContext 
     * @returns {HRESULT} 
     */
    SetRuleClientContext(hRule, pvClientContext) {
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule

        pvClientContextMarshal := pvClientContext is VarRef ? "ptr" : "ptr"

        result := ComCall(13, this, "ptr", hRule, pvClientContextMarshal, pvClientContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SPSTATEHANDLE} hState 
     * @returns {SPSTATEINFO} 
     */
    GetStateInfo(hState) {
        hState := hState is Win32Handle ? NumGet(hState, "ptr") : hState

        pStateInfo := SPSTATEINFO()
        result := ComCall(14, this, "ptr", hState, "ptr", pStateInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pStateInfo
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {PWSTR} pszResourceName 
     * @returns {PWSTR} 
     */
    GetResource(hRule, pszResourceName) {
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName

        result := ComCall(15, this, "ptr", hRule, "ptr", pszResourceName, "ptr*", &ppCoMemResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppCoMemResource
    }

    /**
     * 
     * @param {SPTRANSITIONID} ID 
     * @returns {Pointer<SPTRANSITIONPROPERTY>} 
     */
    GetTransitionProperty(ID) {
        ID := ID is Win32Handle ? NumGet(ID, "ptr") : ID

        result := ComCall(16, this, "ptr", ID, "ptr*", &ppCoMemProperty := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppCoMemProperty
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @param {SPRULEHANDLE} hAltRule 
     * @returns {HRESULT} 
     */
    IsAlternate(hRule, hAltRule) {
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule
        hAltRule := hAltRule is Win32Handle ? NumGet(hAltRule, "ptr") : hAltRule

        result := ComCall(17, this, "ptr", hRule, "ptr", hAltRule, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SPRULEHANDLE} hRule 
     * @returns {Integer} 
     */
    GetMaxAlternates(hRule) {
        hRule := hRule is Win32Handle ? NumGet(hRule, "ptr") : hRule

        result := ComCall(18, this, "ptr", hRule, "uint*", &pulNumAlts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulNumAlts
    }

    /**
     * 
     * @param {SPRECOCONTEXTHANDLE} hContext 
     * @returns {Integer} 
     */
    GetContextMaxAlternates(hContext) {
        hContext := hContext is Win32Handle ? NumGet(hContext, "ptr") : hContext

        result := ComCall(19, this, "ptr", hContext, "uint*", &pulNumAlts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulNumAlts
    }

    /**
     * 
     * @param {Integer} ullCurrentRecoPos 
     * @returns {HRESULT} 
     */
    UpdateRecoPos(ullCurrentRecoPos) {
        result := ComCall(20, this, "uint", ullCurrentRecoPos, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
