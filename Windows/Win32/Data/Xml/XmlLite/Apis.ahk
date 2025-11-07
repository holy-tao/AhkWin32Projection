#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

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
     * @param {IMalloc} pMalloc 
     * @returns {Pointer<Void>} 
     */
    static CreateXmlReader(riid, pMalloc) {
        result := DllCall("XmlLite.dll\CreateXmlReader", "ptr", riid, "ptr*", &ppvObject := 0, "ptr", pMalloc, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObject
    }

    /**
     * 
     * @param {IUnknown} pInputStream 
     * @param {IMalloc} pMalloc 
     * @param {Integer} nEncodingCodePage 
     * @param {BOOL} fEncodingHint 
     * @param {PWSTR} pwszBaseUri 
     * @returns {IUnknown} 
     */
    static CreateXmlReaderInputWithEncodingCodePage(pInputStream, pMalloc, nEncodingCodePage, fEncodingHint, pwszBaseUri) {
        pwszBaseUri := pwszBaseUri is String ? StrPtr(pwszBaseUri) : pwszBaseUri

        result := DllCall("XmlLite.dll\CreateXmlReaderInputWithEncodingCodePage", "ptr", pInputStream, "ptr", pMalloc, "uint", nEncodingCodePage, "int", fEncodingHint, "ptr", pwszBaseUri, "ptr*", &ppInput := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppInput)
    }

    /**
     * 
     * @param {IUnknown} pInputStream 
     * @param {IMalloc} pMalloc 
     * @param {PWSTR} pwszEncodingName 
     * @param {BOOL} fEncodingHint 
     * @param {PWSTR} pwszBaseUri 
     * @returns {IUnknown} 
     */
    static CreateXmlReaderInputWithEncodingName(pInputStream, pMalloc, pwszEncodingName, fEncodingHint, pwszBaseUri) {
        pwszEncodingName := pwszEncodingName is String ? StrPtr(pwszEncodingName) : pwszEncodingName
        pwszBaseUri := pwszBaseUri is String ? StrPtr(pwszBaseUri) : pwszBaseUri

        result := DllCall("XmlLite.dll\CreateXmlReaderInputWithEncodingName", "ptr", pInputStream, "ptr", pMalloc, "ptr", pwszEncodingName, "int", fEncodingHint, "ptr", pwszBaseUri, "ptr*", &ppInput := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppInput)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IMalloc} pMalloc 
     * @returns {Pointer<Void>} 
     */
    static CreateXmlWriter(riid, pMalloc) {
        result := DllCall("XmlLite.dll\CreateXmlWriter", "ptr", riid, "ptr*", &ppvObject := 0, "ptr", pMalloc, "int")
        if(result != 0)
            throw OSError(result)

        return ppvObject
    }

    /**
     * 
     * @param {IUnknown} pOutputStream 
     * @param {IMalloc} pMalloc 
     * @param {Integer} nEncodingCodePage 
     * @returns {IUnknown} 
     */
    static CreateXmlWriterOutputWithEncodingCodePage(pOutputStream, pMalloc, nEncodingCodePage) {
        result := DllCall("XmlLite.dll\CreateXmlWriterOutputWithEncodingCodePage", "ptr", pOutputStream, "ptr", pMalloc, "uint", nEncodingCodePage, "ptr*", &ppOutput := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppOutput)
    }

    /**
     * 
     * @param {IUnknown} pOutputStream 
     * @param {IMalloc} pMalloc 
     * @param {PWSTR} pwszEncodingName 
     * @returns {IUnknown} 
     */
    static CreateXmlWriterOutputWithEncodingName(pOutputStream, pMalloc, pwszEncodingName) {
        pwszEncodingName := pwszEncodingName is String ? StrPtr(pwszEncodingName) : pwszEncodingName

        result := DllCall("XmlLite.dll\CreateXmlWriterOutputWithEncodingName", "ptr", pOutputStream, "ptr", pMalloc, "ptr", pwszEncodingName, "ptr*", &ppOutput := 0, "int")
        if(result != 0)
            throw OSError(result)

        return IUnknown(ppOutput)
    }

;@endregion Methods
}
