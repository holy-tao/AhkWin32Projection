#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxAppInstallerReader extends IUnknown{
    /**
     * The interface identifier for IAppxAppInstallerReader
     * @type {Guid}
     */
    static IID => Guid("{f35bc38c-1d2f-43db-a1f4-586430d1fed2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IXMLDOMDocument>} dom 
     * @returns {HRESULT} 
     */
    GetXmlDom(dom) {
        result := ComCall(3, this, "ptr", dom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
