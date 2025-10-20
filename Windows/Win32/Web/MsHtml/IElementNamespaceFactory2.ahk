#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IElementNamespaceFactory.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementNamespaceFactory2 extends IElementNamespaceFactory{
    /**
     * The interface identifier for IElementNamespaceFactory2
     * @type {Guid}
     */
    static IID => Guid("{3050f805-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<IElementNamespace>} pNamespace 
     * @param {BSTR} bstrImplementation 
     * @returns {HRESULT} 
     */
    CreateWithImplementation(pNamespace, bstrImplementation) {
        bstrImplementation := bstrImplementation is String ? BSTR.Alloc(bstrImplementation).Value : bstrImplementation

        result := ComCall(4, this, "ptr", pNamespace, "ptr", bstrImplementation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
