#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */

;@region Functions
/**
 * 
 * @param {PWSTR} pszXmlIn 
 * @param {Pointer<PWSTR>} rgszAllowedCspNodes 
 * @param {Integer} dwNumAllowedCspNodes 
 * @returns {BSTR} 
 */
export DMProcessConfigXMLFiltered(pszXmlIn, rgszAllowedCspNodes, dwNumAllowedCspNodes) {
    pszXmlIn := pszXmlIn is String ? StrPtr(pszXmlIn) : pszXmlIn

    rgszAllowedCspNodesMarshal := rgszAllowedCspNodes is VarRef ? "ptr*" : "ptr"

    pbstrXmlOut := BSTR.Owned()
    result := DllCall("DMProcessXMLFiltered.dll\DMProcessConfigXMLFiltered", "ptr", pszXmlIn, rgszAllowedCspNodesMarshal, rgszAllowedCspNodes, "uint", dwNumAllowedCspNodes, BSTR.Ptr, pbstrXmlOut, "HRESULT")
    return pbstrXmlOut
}

;@endregion Functions
