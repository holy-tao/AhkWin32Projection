#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMImplementation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMImplementation
     * @type {Guid}
     */
    static IID => Guid("{2933bf8f-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["hasFeature"]

    /**
     * 
     * @param {BSTR} feature 
     * @param {BSTR} version 
     * @returns {VARIANT_BOOL} 
     */
    hasFeature(feature, version) {
        feature := feature is String ? BSTR.Alloc(feature).Value : feature
        version := version is String ? BSTR.Alloc(version).Value : version

        result := ComCall(7, this, "ptr", feature, "ptr", version, "short*", &hasFeature := 0, "HRESULT")
        return hasFeature
    }
}
