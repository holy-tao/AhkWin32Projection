#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWbemObjectSink.ahk

/**
 * Creates a sink interface that can receive all types of notifications within the WMI programming model.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemobjectsinkex
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemObjectSinkEx extends IWbemObjectSink{
    /**
     * The interface identifier for IWbemObjectSinkEx
     * @type {Guid}
     */
    static IID => Guid("{e7d35cfa-348b-485e-b524-252725d697ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Integer} uChannel 
     * @param {BSTR} strMessage 
     * @returns {HRESULT} 
     */
    WriteMessage(uChannel, strMessage) {
        strMessage := strMessage is String ? BSTR.Alloc(strMessage).Value : strMessage

        result := ComCall(5, this, "uint", uChannel, "ptr", strMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemClassObject>} pObjError 
     * @param {Pointer<Byte>} puReturned 
     * @returns {HRESULT} 
     */
    WriteError(pObjError, puReturned) {
        result := ComCall(6, this, "ptr", pObjError, "char*", puReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strMessage 
     * @param {Integer} uPromptType 
     * @param {Pointer<Byte>} puReturned 
     * @returns {HRESULT} 
     */
    PromptUser(strMessage, uPromptType, puReturned) {
        strMessage := strMessage is String ? BSTR.Alloc(strMessage).Value : strMessage

        result := ComCall(7, this, "ptr", strMessage, "char", uPromptType, "char*", puReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strActivity 
     * @param {BSTR} strCurrentOperation 
     * @param {BSTR} strStatusDescription 
     * @param {Integer} uPercentComplete 
     * @param {Integer} uSecondsRemaining 
     * @returns {HRESULT} 
     */
    WriteProgress(strActivity, strCurrentOperation, strStatusDescription, uPercentComplete, uSecondsRemaining) {
        strActivity := strActivity is String ? BSTR.Alloc(strActivity).Value : strActivity
        strCurrentOperation := strCurrentOperation is String ? BSTR.Alloc(strCurrentOperation).Value : strCurrentOperation
        strStatusDescription := strStatusDescription is String ? BSTR.Alloc(strStatusDescription).Value : strStatusDescription

        result := ComCall(8, this, "ptr", strActivity, "ptr", strCurrentOperation, "ptr", strStatusDescription, "uint", uPercentComplete, "uint", uSecondsRemaining, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} vtValue 
     * @param {Integer} ulType 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    WriteStreamParameter(strName, vtValue, ulType, ulFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(9, this, "ptr", strName, "ptr", vtValue, "uint", ulType, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
