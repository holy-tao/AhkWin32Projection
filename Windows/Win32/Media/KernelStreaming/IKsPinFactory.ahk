#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsPinFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsPinFactory
     * @type {Guid}
     */
    static IID => Guid("{cd5ebe6b-8b6e-11d1-8ae0-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsPinFactory"]

    /**
     * 
     * @param {Pointer<Integer>} PinFactory 
     * @returns {HRESULT} 
     */
    KsPinFactory(PinFactory) {
        PinFactoryMarshal := PinFactory is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, PinFactoryMarshal, PinFactory, "HRESULT")
        return result
    }
}
