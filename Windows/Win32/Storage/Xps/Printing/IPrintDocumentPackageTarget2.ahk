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
     * @returns {BOOL} 
     */
    GetIsTargetIppPrinter() {
        result := ComCall(3, this, "int*", &isIppPrinter := 0, "HRESULT")
        return isIppPrinter
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetTargetIppPrintDevice(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppvTarget := 0, "HRESULT")
        return ppvTarget
    }
}
