#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\APPX_PACKAGING_CONTEXT_CHANGE_TYPE.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\Foundation\PSTR.ahk
#Include ..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class IAppxPackagingDiagnosticEventSink extends IUnknown {

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportContextChange", "ReportError"]

    /**
     * 
     * @param {APPX_PACKAGING_CONTEXT_CHANGE_TYPE} _changeType 
     * @param {Integer} contextId 
     * @param {PSTR} contextName 
     * @param {PWSTR} contextMessage 
     * @param {PWSTR} detailsMessage 
     * @returns {HRESULT} 
     */
    ReportContextChange(_changeType, contextId, contextName, contextMessage, detailsMessage) {
        contextName := contextName is String ? StrPtr(contextName) : contextName
        contextMessage := contextMessage is String ? StrPtr(contextMessage) : contextMessage
        detailsMessage := detailsMessage is String ? StrPtr(detailsMessage) : detailsMessage

        result := ComCall(3, this, "int", _changeType, "int", contextId, "ptr", contextName, "ptr", contextMessage, "ptr", detailsMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} errorMessage 
     * @returns {HRESULT} 
     */
    ReportError(errorMessage) {
        errorMessage := errorMessage is String ? StrPtr(errorMessage) : errorMessage

        result := ComCall(4, this, "ptr", errorMessage, "HRESULT")
        return result
    }
}
