#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintAsyncNotifyChannel.ahk
#Include .\IPrintAsyncNotifyRegistration.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintAsyncNotify
     * @type {Guid}
     */
    static IID => Guid("{532818f7-921b-4fb2-bff8-2f4fd52ebebf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePrintAsyncNotifyChannel", "CreatePrintAsyncNotifyRegistration"]

    /**
     * Creates a communication channel between a Print Spooler-hosted printing component, such as a print driver or port monitor, and an application that receives notifications from the component.
     * @param {Integer} param0 
     * @param {Pointer<Guid>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {IPrintAsyncNotifyCallback} param4 
     * @returns {IPrintAsyncNotifyChannel} 
     * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nf-prnasnot-createprintasyncnotifychannel
     */
    CreatePrintAsyncNotifyChannel(param0, param1, param2, param3, param4) {
        result := ComCall(3, this, "uint", param0, "ptr", param1, "int", param2, "int", param3, "ptr", param4, "ptr*", &param5 := 0, "HRESULT")
        return IPrintAsyncNotifyChannel(param5)
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {IPrintAsyncNotifyCallback} param3 
     * @returns {IPrintAsyncNotifyRegistration} 
     */
    CreatePrintAsyncNotifyRegistration(param0, param1, param2, param3) {
        result := ComCall(4, this, "ptr", param0, "int", param1, "int", param2, "ptr", param3, "ptr*", &param4 := 0, "HRESULT")
        return IPrintAsyncNotifyRegistration(param4)
    }
}
