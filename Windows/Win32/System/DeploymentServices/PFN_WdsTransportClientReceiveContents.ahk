#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The PFN_WdsTransportClientReceiveContents callback is used by the multicast client to indicate that a block of data is ready to be used.
 * @see https://learn.microsoft.com/windows/win32/api//content/wdstci/nc-wdstci-pfn_wdstransportclientreceivecontents
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PFN_WdsTransportClientReceiveContents extends IUnknown {

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
     * @param {HANDLE} hSessionKey 
     * @param {Pointer<Void>} pCallerData 
     * @param {Pointer} pContents 
     * @param {Integer} ulSize 
     * @param {Pointer<Integer>} pullContentOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSessionKey, pCallerData, pContents, ulSize, pullContentOffset) {
        hSessionKey := hSessionKey is Win32Handle ? NumGet(hSessionKey, "ptr") : hSessionKey

        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"
        pullContentOffsetMarshal := pullContentOffset is VarRef ? "uint*" : "ptr"

        ComCall(3, this, "ptr", hSessionKey, pCallerDataMarshal, pCallerData, "ptr", pContents, "uint", ulSize, pullContentOffsetMarshal, pullContentOffset)
    }
}
