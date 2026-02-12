#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PciLine2Pin extends IUnknown {

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
     * @param {Pointer<Pointer>} BusHandler 
     * @param {Pointer<Pointer>} RootHandler 
     * @param {PCI_SLOT_NUMBER} SlotNumber 
     * @param {Pointer<PCI_COMMON_CONFIG>} PciNewData 
     * @param {Pointer<PCI_COMMON_CONFIG>} PciOldData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(BusHandler, RootHandler, SlotNumber, PciNewData, PciOldData) {
        BusHandlerMarshal := BusHandler is VarRef ? "ptr*" : "ptr"
        RootHandlerMarshal := RootHandler is VarRef ? "ptr*" : "ptr"

        ComCall(3, this, BusHandlerMarshal, BusHandler, RootHandlerMarshal, RootHandler, "ptr", SlotNumber, "ptr", PciNewData, "ptr", PciOldData)
    }
}
