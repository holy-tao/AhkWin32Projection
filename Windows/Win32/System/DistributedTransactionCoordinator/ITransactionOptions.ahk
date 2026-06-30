#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XACTOPT.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class ITransactionOptions extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionOptions
     * @type {Guid}
     */
    static IID => Guid("{3a6ad9e0-23b9-11cf-ad60-00aa00a74ccd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOptions", "GetOptions"]

    /**
     * 
     * @param {Pointer<XACTOPT>} pOptions 
     * @returns {HRESULT} 
     */
    SetOptions(pOptions) {
        result := ComCall(3, this, "ptr", pOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XACTOPT>} pOptions 
     * @returns {HRESULT} 
     */
    GetOptions(pOptions) {
        result := ComCall(4, this, "ptr", pOptions, "HRESULT")
        return result
    }
}
