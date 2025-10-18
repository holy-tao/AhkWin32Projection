#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 * @version v4.0.30319
 */
class XmlLite {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @param {Pointer<IMalloc>} pMalloc 
     * @returns {HRESULT} 
     */
    static CreateXmlReader(riid, ppvObject, pMalloc) {
        result := DllCall("XmlLite.dll\CreateXmlReader", "ptr", riid, "ptr", ppvObject, "ptr", pMalloc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pInputStream 
     * @param {Pointer<IMalloc>} pMalloc 
     * @param {Integer} nEncodingCodePage 
     * @param {BOOL} fEncodingHint 
     * @param {PWSTR} pwszBaseUri 
     * @param {Pointer<IUnknown>} ppInput 
     * @returns {HRESULT} 
     */
    static CreateXmlReaderInputWithEncodingCodePage(pInputStream, pMalloc, nEncodingCodePage, fEncodingHint, pwszBaseUri, ppInput) {
        pwszBaseUri := pwszBaseUri is String ? StrPtr(pwszBaseUri) : pwszBaseUri

        result := DllCall("XmlLite.dll\CreateXmlReaderInputWithEncodingCodePage", "ptr", pInputStream, "ptr", pMalloc, "uint", nEncodingCodePage, "int", fEncodingHint, "ptr", pwszBaseUri, "ptr", ppInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pInputStream 
     * @param {Pointer<IMalloc>} pMalloc 
     * @param {PWSTR} pwszEncodingName 
     * @param {BOOL} fEncodingHint 
     * @param {PWSTR} pwszBaseUri 
     * @param {Pointer<IUnknown>} ppInput 
     * @returns {HRESULT} 
     */
    static CreateXmlReaderInputWithEncodingName(pInputStream, pMalloc, pwszEncodingName, fEncodingHint, pwszBaseUri, ppInput) {
        pwszEncodingName := pwszEncodingName is String ? StrPtr(pwszEncodingName) : pwszEncodingName
        pwszBaseUri := pwszBaseUri is String ? StrPtr(pwszBaseUri) : pwszBaseUri

        result := DllCall("XmlLite.dll\CreateXmlReaderInputWithEncodingName", "ptr", pInputStream, "ptr", pMalloc, "ptr", pwszEncodingName, "int", fEncodingHint, "ptr", pwszBaseUri, "ptr", ppInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @param {Pointer<IMalloc>} pMalloc 
     * @returns {HRESULT} 
     */
    static CreateXmlWriter(riid, ppvObject, pMalloc) {
        result := DllCall("XmlLite.dll\CreateXmlWriter", "ptr", riid, "ptr", ppvObject, "ptr", pMalloc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pOutputStream 
     * @param {Pointer<IMalloc>} pMalloc 
     * @param {Integer} nEncodingCodePage 
     * @param {Pointer<IUnknown>} ppOutput 
     * @returns {HRESULT} 
     */
    static CreateXmlWriterOutputWithEncodingCodePage(pOutputStream, pMalloc, nEncodingCodePage, ppOutput) {
        result := DllCall("XmlLite.dll\CreateXmlWriterOutputWithEncodingCodePage", "ptr", pOutputStream, "ptr", pMalloc, "uint", nEncodingCodePage, "ptr", ppOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pOutputStream 
     * @param {Pointer<IMalloc>} pMalloc 
     * @param {PWSTR} pwszEncodingName 
     * @param {Pointer<IUnknown>} ppOutput 
     * @returns {HRESULT} 
     */
    static CreateXmlWriterOutputWithEncodingName(pOutputStream, pMalloc, pwszEncodingName, ppOutput) {
        pwszEncodingName := pwszEncodingName is String ? StrPtr(pwszEncodingName) : pwszEncodingName

        result := DllCall("XmlLite.dll\CreateXmlWriterOutputWithEncodingName", "ptr", pOutputStream, "ptr", pMalloc, "ptr", pwszEncodingName, "ptr", ppOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
