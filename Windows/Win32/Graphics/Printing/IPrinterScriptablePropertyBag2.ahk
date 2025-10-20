#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrinterScriptablePropertyBag.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptablePropertyBag2 extends IPrinterScriptablePropertyBag{
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
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IUnknown>} ppXmlNode 
     * @returns {HRESULT} 
     */
    GetReadStreamAsXML(bstrName, ppXmlNode) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(17, this, "ptr", bstrName, "ptr", ppXmlNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
