#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PRESUTIL_FREE_PARAMETER_BLOCK extends IUnknown {

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
     * @param {Pointer<Integer>} pOutParams 
     * @param {Pointer<Integer>} pInParams 
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pOutParams, pInParams, pPropertyTable) {
        pOutParamsMarshal := pOutParams is VarRef ? "char*" : "ptr"
        pInParamsMarshal := pInParams is VarRef ? "char*" : "ptr"

        ComCall(3, this, pOutParamsMarshal, pOutParams, pInParamsMarshal, pInParams, "ptr", pPropertyTable)
    }
}
