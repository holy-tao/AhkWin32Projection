#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * PFN_WdsTransportClientReceiveMetadata is an optional callback that a consumer may register to receive metadata type information about a file. This information is provided by the content provider and is opaque to the multicast client and server.
 * @see https://learn.microsoft.com/windows/win32/api//content/wdstci/nc-wdstci-pfn_wdstransportclientreceivemetadata
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PFN_WdsTransportClientReceiveMetadata extends IUnknown {

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
     * @param {Pointer} pMetadata 
     * @param {Integer} ulSize 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSessionKey, pCallerData, pMetadata, ulSize) {
        hSessionKey := hSessionKey is Win32Handle ? NumGet(hSessionKey, "ptr") : hSessionKey

        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hSessionKey, pCallerDataMarshal, pCallerData, "ptr", pMetadata, "uint", ulSize)
    }
}
