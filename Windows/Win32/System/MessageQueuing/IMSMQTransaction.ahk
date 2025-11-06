#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQTransaction extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQTransaction
     * @type {Guid}
     */
    static IID => Guid("{d7d6e07f-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQTransaction
     * @type {Guid}
     */
    static CLSID => Guid("{d7d6e080-dccd-11d0-aa4b-0060970debae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Transaction", "Commit", "Abort"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Transaction() {
        result := ComCall(7, this, "int*", &plTransaction := 0, "HRESULT")
        return plTransaction
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fRetaining 
     * @param {Pointer<VARIANT>} grfTC 
     * @param {Pointer<VARIANT>} grfRM 
     * @returns {HRESULT} 
     */
    Commit(fRetaining, grfTC, grfRM) {
        result := ComCall(8, this, "ptr", fRetaining, "ptr", grfTC, "ptr", grfRM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fRetaining 
     * @param {Pointer<VARIANT>} fAsync 
     * @returns {HRESULT} 
     */
    Abort(fRetaining, fAsync) {
        result := ComCall(9, this, "ptr", fRetaining, "ptr", fAsync, "HRESULT")
        return result
    }
}
