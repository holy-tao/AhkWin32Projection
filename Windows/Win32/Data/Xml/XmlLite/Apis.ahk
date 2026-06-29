#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\System\Com\IMalloc.ahk" { IMalloc }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Data.Xml.XmlLite
 */

;@region Functions
/**
 * 
 * @param {Pointer<Guid>} riid 
 * @param {IMalloc} pMalloc 
 * @returns {Pointer<Void>} 
 */
export CreateXmlReader(riid, pMalloc) {
    result := DllCall("XmlLite.dll\CreateXmlReader", Guid.Ptr, riid, "ptr*", &ppvObject := 0, "ptr", pMalloc, "HRESULT")
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
export CreateXmlReaderInputWithEncodingCodePage(pInputStream, pMalloc, nEncodingCodePage, fEncodingHint, pwszBaseUri) {
    pwszBaseUri := pwszBaseUri is String ? StrPtr(pwszBaseUri) : pwszBaseUri

    result := DllCall("XmlLite.dll\CreateXmlReaderInputWithEncodingCodePage", "ptr", pInputStream, "ptr", pMalloc, "uint", nEncodingCodePage, BOOL, fEncodingHint, "ptr", pwszBaseUri, "ptr*", &ppInput := 0, "HRESULT")
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
export CreateXmlReaderInputWithEncodingName(pInputStream, pMalloc, pwszEncodingName, fEncodingHint, pwszBaseUri) {
    pwszEncodingName := pwszEncodingName is String ? StrPtr(pwszEncodingName) : pwszEncodingName
    pwszBaseUri := pwszBaseUri is String ? StrPtr(pwszBaseUri) : pwszBaseUri

    result := DllCall("XmlLite.dll\CreateXmlReaderInputWithEncodingName", "ptr", pInputStream, "ptr", pMalloc, "ptr", pwszEncodingName, BOOL, fEncodingHint, "ptr", pwszBaseUri, "ptr*", &ppInput := 0, "HRESULT")
    return IUnknown(ppInput)
}

/**
 * 
 * @param {Pointer<Guid>} riid 
 * @param {IMalloc} pMalloc 
 * @returns {Pointer<Void>} 
 */
export CreateXmlWriter(riid, pMalloc) {
    result := DllCall("XmlLite.dll\CreateXmlWriter", Guid.Ptr, riid, "ptr*", &ppvObject := 0, "ptr", pMalloc, "HRESULT")
    return ppvObject
}

/**
 * 
 * @param {IUnknown} pOutputStream 
 * @param {IMalloc} pMalloc 
 * @param {Integer} nEncodingCodePage 
 * @returns {IUnknown} 
 */
export CreateXmlWriterOutputWithEncodingCodePage(pOutputStream, pMalloc, nEncodingCodePage) {
    result := DllCall("XmlLite.dll\CreateXmlWriterOutputWithEncodingCodePage", "ptr", pOutputStream, "ptr", pMalloc, "uint", nEncodingCodePage, "ptr*", &ppOutput := 0, "HRESULT")
    return IUnknown(ppOutput)
}

/**
 * 
 * @param {IUnknown} pOutputStream 
 * @param {IMalloc} pMalloc 
 * @param {PWSTR} pwszEncodingName 
 * @returns {IUnknown} 
 */
export CreateXmlWriterOutputWithEncodingName(pOutputStream, pMalloc, pwszEncodingName) {
    pwszEncodingName := pwszEncodingName is String ? StrPtr(pwszEncodingName) : pwszEncodingName

    result := DllCall("XmlLite.dll\CreateXmlWriterOutputWithEncodingName", "ptr", pOutputStream, "ptr", pMalloc, "ptr", pwszEncodingName, "ptr*", &ppOutput := 0, "HRESULT")
    return IUnknown(ppOutput)
}

;@endregion Functions
