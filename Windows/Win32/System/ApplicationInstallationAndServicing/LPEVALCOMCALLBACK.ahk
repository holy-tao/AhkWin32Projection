#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The LPEVALCOMCALLBACK specification defines a callback function prototype. The IValidate::SetStatus method enables an authoring tool to receive information about the progress of validation through the registered callback function.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/evalcom2/nf-evalcom2-ivalidate-setstatus">SetStatus</a> method and <b>LPEVALCOMCALLBACK</b> can be used to provide progress information.  For example, the <b>ieStatusICECount</b> message can provide the overall tick count for a progress bar.  For each <b>ieStatusRunICE</b> message received, the caller can increment the progress bar one tick.
 * @see https://learn.microsoft.com/windows/win32/api//content/evalcom2/nc-evalcom2-lpevalcomcallback
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class LPEVALCOMCALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} iStatus 
     * @param {PWSTR} szData 
     * @param {Pointer<Void>} pContext 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(iStatus, szData, pContext) {
        szData := szData is String ? StrPtr(szData) : szData

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int", iStatus, "ptr", szData, pContextMarshal, pContext, "int")
        return result
    }
}
