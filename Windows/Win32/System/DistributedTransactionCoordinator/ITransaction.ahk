#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XACTTRANSINFO.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransaction extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransaction
     * @type {Guid}
     */
    static IID => Guid("{0fb15084-af41-11ce-bd2b-204c4f4f5020}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit", "Abort", "GetTransactionInfo"]

    /**
     * 
     * @param {BOOL} fRetaining 
     * @param {Integer} grfTC 
     * @param {Integer} grfRM 
     * @returns {HRESULT} 
     */
    Commit(fRetaining, grfTC, grfRM) {
        result := ComCall(3, this, "int", fRetaining, "uint", grfTC, "uint", grfRM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOID>} pboidReason 
     * @param {BOOL} fRetaining 
     * @param {BOOL} fAsync 
     * @returns {HRESULT} 
     */
    Abort(pboidReason, fRetaining, fAsync) {
        result := ComCall(4, this, "ptr", pboidReason, "int", fRetaining, "int", fAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XACTTRANSINFO} 
     */
    GetTransactionInfo() {
        pinfo := XACTTRANSINFO()
        result := ComCall(5, this, "ptr", pinfo, "HRESULT")
        return pinfo
    }
}
