#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IADs.ahk

/**
 * The IADsComputerOperations interface is a dual interface that inherits from IADs.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadscomputeroperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsComputerOperations extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsComputerOperations
     * @type {Guid}
     */
    static IID => Guid("{ef497680-1d9f-11cf-b1f3-02608c9e7553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Status", "Shutdown"]

    /**
     * The IADsComputerOperations::Status method retrieves the status of a computer.
     * @returns {IDispatch} Pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface that reports the status code of computer operations. The status code is provider-specific.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadscomputeroperations-status
     */
    Status() {
        result := ComCall(20, this, "ptr*", &ppObject := 0, "HRESULT")
        return IDispatch(ppObject)
    }

    /**
     * The IADsComputerOperations::Shutdown method causes a computer under ADSI control to execute the shutdown operation with an optional reboot.
     * @param {VARIANT_BOOL} bReboot If <b>TRUE</b>, then reboot the computer after the shutdown is complete.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadscomputeroperations-shutdown
     */
    Shutdown(bReboot) {
        result := ComCall(21, this, "short", bReboot, "HRESULT")
        return result
    }
}
