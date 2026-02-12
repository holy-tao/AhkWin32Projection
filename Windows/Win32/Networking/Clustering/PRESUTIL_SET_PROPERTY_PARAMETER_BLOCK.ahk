#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PRESUTIL_SET_PROPERTY_PARAMETER_BLOCK extends IUnknown {

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
     * @param {HKEY} hkeyClusterKey 
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<Integer>} pInParams 
     * @param {Pointer<Void>} pInPropertyList 
     * @param {Integer} cbInPropertyListSize 
     * @param {Pointer<Integer>} pOutParams 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hkeyClusterKey, pPropertyTable, Reserved, pInParams, pInPropertyList, cbInPropertyListSize, pOutParams) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        pInParamsMarshal := pInParams is VarRef ? "char*" : "ptr"
        pInPropertyListMarshal := pInPropertyList is VarRef ? "ptr" : "ptr"
        pOutParamsMarshal := pOutParams is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", hkeyClusterKey, "ptr", pPropertyTable, ReservedMarshal, Reserved, pInParamsMarshal, pInParams, pInPropertyListMarshal, pInPropertyList, "uint", cbInPropertyListSize, pOutParamsMarshal, pOutParams, "uint")
        return result
    }
}
