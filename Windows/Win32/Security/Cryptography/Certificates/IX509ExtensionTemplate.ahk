#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Extension.ahk

/**
 * Defines methods and properties that can be used to initialize or retrieve a CertificateTemplate extension.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509extensiontemplate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509ExtensionTemplate extends IX509Extension{
    /**
     * The interface identifier for IX509ExtensionTemplate
     * @type {Guid}
     */
    static IID => Guid("{728ab312-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<IObjectId>} pTemplateOid 
     * @param {Integer} MajorVersion 
     * @param {Integer} MinorVersion 
     * @returns {HRESULT} 
     */
    InitializeEncode(pTemplateOid, MajorVersion, MinorVersion) {
        result := ComCall(12, this, "ptr", pTemplateOid, "int", MajorVersion, "int", MinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, "int", Encoding, "ptr", strEncodedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     */
    get_TemplateOid(ppValue) {
        result := ComCall(14, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_MajorVersion(pValue) {
        result := ComCall(15, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_MinorVersion(pValue) {
        result := ComCall(16, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
