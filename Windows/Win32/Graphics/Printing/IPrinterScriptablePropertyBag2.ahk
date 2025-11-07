#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IPrinterScriptablePropertyBag.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptablePropertyBag2 extends IPrinterScriptablePropertyBag{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterScriptablePropertyBag2
     * @type {Guid}
     */
    static IID => Guid("{2a1c53c4-8638-4b3e-b518-2773c94556a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetReadStreamAsXML"]

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IUnknown} 
     */
    GetReadStreamAsXML(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(17, this, "ptr", bstrName, "ptr*", &ppXmlNode := 0, "HRESULT")
        return IUnknown(ppXmlNode)
    }
}
