#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxPackagingDiagnosticEventSink extends IUnknown{
    /**
     * The interface identifier for IAppxPackagingDiagnosticEventSink
     * @type {Guid}
     */
    static IID => Guid("{17239d47-6adb-45d2-80f6-f9cbc3bf059d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} changeType 
     * @param {Integer} contextId 
     * @param {PSTR} contextName 
     * @param {PWSTR} contextMessage 
     * @param {PWSTR} detailsMessage 
     * @returns {HRESULT} 
     */
    ReportContextChange(changeType, contextId, contextName, contextMessage, detailsMessage) {
        contextMessage := contextMessage is String ? StrPtr(contextMessage) : contextMessage
        detailsMessage := detailsMessage is String ? StrPtr(detailsMessage) : detailsMessage

        result := ComCall(3, this, "int", changeType, "int", contextId, "ptr", contextName, "ptr", contextMessage, "ptr", detailsMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} errorMessage 
     * @returns {HRESULT} 
     */
    ReportError(errorMessage) {
        errorMessage := errorMessage is String ? StrPtr(errorMessage) : errorMessage

        result := ComCall(4, this, "ptr", errorMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
