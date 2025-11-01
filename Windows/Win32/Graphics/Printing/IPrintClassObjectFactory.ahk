#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintClassObjectFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintClassObjectFactory
     * @type {Guid}
     */
    static IID => Guid("{9af593dd-9b02-48a8-9bad-69ace423f88b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrintClassObject"]

    /**
     * 
     * @param {PWSTR} pszPrinterName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppNewObject 
     * @returns {HRESULT} 
     */
    GetPrintClassObject(pszPrinterName, riid, ppNewObject) {
        pszPrinterName := pszPrinterName is String ? StrPtr(pszPrinterName) : pszPrinterName

        result := ComCall(3, this, "ptr", pszPrinterName, "ptr", riid, "ptr*", ppNewObject, "HRESULT")
        return result
    }
}
