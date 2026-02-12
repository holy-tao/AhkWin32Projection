#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class pHalFindBusAddressTranslation extends IUnknown {

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
     * @param {Integer} BusAddress 
     * @param {Pointer<Integer>} AddressSpace 
     * @param {Pointer<Integer>} TranslatedAddress 
     * @param {Pointer<Pointer>} Context_ 
     * @param {BOOLEAN} NextBus 
     * @returns {BOOLEAN} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(BusAddress, AddressSpace, TranslatedAddress, Context_, NextBus) {
        AddressSpaceMarshal := AddressSpace is VarRef ? "uint*" : "ptr"
        TranslatedAddressMarshal := TranslatedAddress is VarRef ? "int64*" : "ptr"
        Context_Marshal := Context_ is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int64", BusAddress, AddressSpaceMarshal, AddressSpace, TranslatedAddressMarshal, TranslatedAddress, Context_Marshal, Context_, "char", NextBus, "char")
        return result
    }
}
