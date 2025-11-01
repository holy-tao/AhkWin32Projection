#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IADs.ahk

/**
 * The IADsPrintJobOperations interface is a dual interface that inherits from IADs.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsprintjoboperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPrintJobOperations extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPrintJobOperations
     * @type {Guid}
     */
    static IID => Guid("{9a52db30-1ecf-11cf-a988-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_TimeElapsed", "get_PagesPrinted", "get_Position", "put_Position", "Pause", "Resume"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Status(retval) {
        result := ComCall(20, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_TimeElapsed(retval) {
        result := ComCall(21, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_PagesPrinted(retval) {
        result := ComCall(22, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Position(retval) {
        result := ComCall(23, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnPosition 
     * @returns {HRESULT} 
     */
    put_Position(lnPosition) {
        result := ComCall(24, this, "int", lnPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintjoboperations-pause
     */
    Pause() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintjoboperations-resume
     */
    Resume() {
        result := ComCall(26, this, "HRESULT")
        return result
    }
}
