#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertConfig.ahk

/**
 * Provide functionality for retrieving the public configuration data (specified during client setup) for a Certificate Services server.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertconfig2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertConfig2 extends ICertConfig{
    /**
     * The interface identifier for ICertConfig2
     * @type {Guid}
     */
    static IID => Guid("{7a18edde-7e78-4163-8ded-78e2c9cee924}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {BSTR} strSharedFolder 
     * @returns {HRESULT} 
     */
    SetSharedFolder(strSharedFolder) {
        strSharedFolder := strSharedFolder is String ? BSTR.Alloc(strSharedFolder).Value : strSharedFolder

        result := ComCall(11, this, "ptr", strSharedFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
