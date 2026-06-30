#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\DOCUMENTNAMETYPE.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class IDebugDocumentInfo extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentInfo
     * @type {Guid}
     */
    static IID => Guid("{51973c1f-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetDocumentClassId"]

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @param {DOCUMENTNAMETYPE} dnt 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName(dnt) {
        pbstrName := BSTR({Value: 0}, True)
        result := ComCall(3, this, "int", dnt, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetDocumentClassId() {
        pclsidDocument := Guid()
        result := ComCall(4, this, "ptr", pclsidDocument, "HRESULT")
        return pclsidDocument
    }
}
