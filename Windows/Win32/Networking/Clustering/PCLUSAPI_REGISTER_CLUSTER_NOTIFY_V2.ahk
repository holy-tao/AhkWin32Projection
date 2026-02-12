#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_REGISTER_CLUSTER_NOTIFY_V2 extends IUnknown {

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
     * @param {HCHANGE} hChange_ 
     * @param {NOTIFY_FILTER_AND_TYPE} Filter 
     * @param {HANDLE} hObject 
     * @param {Pointer} dwNotifyKey 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hChange_, Filter, hObject, dwNotifyKey) {
        hChange_ := hChange_ is Win32Handle ? NumGet(hChange_, "ptr") : hChange_
        hObject := hObject is Win32Handle ? NumGet(hObject, "ptr") : hObject

        result := ComCall(3, this, "ptr", hChange_, "ptr", Filter, "ptr", hObject, "ptr", dwNotifyKey, "uint")
        return result
    }
}
