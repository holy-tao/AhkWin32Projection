#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implement this interface to receive notifications when an assessment is complete or making progress.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iwinsatinitiateevents
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IWinSATInitiateEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinSATInitiateEvents
     * @type {Guid}
     */
    static IID => Guid("{262a1918-ba0d-41d5-92c2-fab4633ee74f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WinSATComplete", "WinSATUpdate"]

    /**
     * 
     * @param {HRESULT} hresult 
     * @param {PWSTR} strDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatcomplete
     */
    WinSATComplete(hresult, strDescription) {
        strDescription := strDescription is String ? StrPtr(strDescription) : strDescription

        result := ComCall(3, this, "int", hresult, "ptr", strDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uCurrentTick 
     * @param {Integer} uTickTotal 
     * @param {PWSTR} strCurrentState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatupdate
     */
    WinSATUpdate(uCurrentTick, uTickTotal, strCurrentState) {
        strCurrentState := strCurrentState is String ? StrPtr(strCurrentState) : strCurrentState

        result := ComCall(4, this, "uint", uCurrentTick, "uint", uTickTotal, "ptr", strCurrentState, "HRESULT")
        return result
    }
}
