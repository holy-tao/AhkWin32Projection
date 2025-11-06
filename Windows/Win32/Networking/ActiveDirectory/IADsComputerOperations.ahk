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
     * The Status enumeration indicates the result of a Windows GDI+ method call.
     * @remarks
     * 
     * If you construct a GDI+ object and then immediately call the 
     * 				<b>GetLastStatus</b> method of that object, you can determine whether the constructor succeeded or failed. In such cases, 
     * 				<b>GetLastStatus</b> might return <b><b>OutOfMemory</b></b> even though there was plenty of memory available to create the object. Several GDI+ constructors set the status to <b><b>OutOfMemory</b></b> when they fail regardless of the reason for failure.
     * 
     * @returns {IDispatch} 
     * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/ne-gdiplustypes-status
     */
    Status() {
        result := ComCall(20, this, "ptr*", &ppObject := 0, "HRESULT")
        return IDispatch(ppObject)
    }

    /**
     * 
     * @param {VARIANT_BOOL} bReboot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscomputeroperations-shutdown
     */
    Shutdown(bReboot) {
        result := ComCall(21, this, "short", bReboot, "HRESULT")
        return result
    }
}
