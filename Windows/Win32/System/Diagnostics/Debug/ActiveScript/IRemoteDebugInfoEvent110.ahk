#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugInfoEvent110 extends IUnknown{
    /**
     * The interface identifier for IRemoteDebugInfoEvent110
     * @type {Guid}
     */
    static IID => Guid("{9ff56bb6-eb89-4c0f-8823-cc2a4c0b7f26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pMessageType 
     * @param {Pointer<BSTR>} pbstrMessage 
     * @param {Pointer<BSTR>} pbstrUrl 
     * @param {Pointer<IDebugDocumentContext>} ppLocation 
     * @returns {HRESULT} 
     */
    GetEventInfo(pMessageType, pbstrMessage, pbstrUrl, ppLocation) {
        result := ComCall(3, this, "int*", pMessageType, "ptr", pbstrMessage, "ptr", pbstrUrl, "ptr", ppLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
