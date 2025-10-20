#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class IPrintDocumentPackageTarget2 extends IUnknown{
    /**
     * The interface identifier for IPrintDocumentPackageTarget2
     * @type {Guid}
     */
    static IID => Guid("{c560298a-535c-48f9-866a-632540660cb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} isIppPrinter 
     * @returns {HRESULT} 
     */
    GetIsTargetIppPrinter(isIppPrinter) {
        result := ComCall(3, this, "ptr", isIppPrinter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvTarget 
     * @returns {HRESULT} 
     */
    GetTargetIppPrintDevice(riid, ppvTarget) {
        result := ComCall(4, this, "ptr", riid, "ptr", ppvTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
