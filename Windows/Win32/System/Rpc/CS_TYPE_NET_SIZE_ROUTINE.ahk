#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class CS_TYPE_NET_SIZE_ROUTINE extends IUnknown {

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
     * @param {Pointer<Void>} hBinding 
     * @param {Integer} ulNetworkCodeSet 
     * @param {Integer} ulLocalBufferSize 
     * @param {Pointer<Integer>} conversionType 
     * @param {Pointer<Integer>} pulNetworkBufferSize 
     * @param {Pointer<Integer>} pStatus 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hBinding, ulNetworkCodeSet, ulLocalBufferSize, conversionType, pulNetworkBufferSize, pStatus) {
        hBindingMarshal := hBinding is VarRef ? "ptr" : "ptr"
        conversionTypeMarshal := conversionType is VarRef ? "int*" : "ptr"
        pulNetworkBufferSizeMarshal := pulNetworkBufferSize is VarRef ? "uint*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "uint*" : "ptr"

        ComCall(3, this, hBindingMarshal, hBinding, "uint", ulNetworkCodeSet, "uint", ulLocalBufferSize, conversionTypeMarshal, conversionType, pulNetworkBufferSizeMarshal, pulNetworkBufferSize, pStatusMarshal, pStatus)
    }
}
