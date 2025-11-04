#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class IPrintDocumentPackageTarget2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIsTargetIppPrinter", "GetTargetIppPrintDevice"]

    /**
     * 
     * @param {Pointer<BOOL>} isIppPrinter 
     * @returns {HRESULT} 
     */
    GetIsTargetIppPrinter(isIppPrinter) {
        result := ComCall(3, this, "ptr", isIppPrinter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvTarget 
     * @returns {HRESULT} 
     */
    GetTargetIppPrintDevice(riid, ppvTarget) {
        ppvTargetMarshal := ppvTarget is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", riid, ppvTargetMarshal, ppvTarget, "HRESULT")
        return result
    }
}
