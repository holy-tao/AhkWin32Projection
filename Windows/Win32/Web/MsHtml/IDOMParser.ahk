#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLDocument2.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMParser extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMParser
     * @type {Guid}
     */
    static IID => Guid("{30510781-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMParser
     * @type {Guid}
     */
    static CLSID => Guid("{30510782-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["parseFromString"]

    /**
     * 
     * @param {BSTR} xmlSource 
     * @param {BSTR} mimeType 
     * @returns {IHTMLDocument2} 
     */
    parseFromString(xmlSource, mimeType) {
        if(xmlSource is String) {
            pin := BSTR.Alloc(xmlSource)
            xmlSource := pin.Value
        }
        if(mimeType is String) {
            pin := BSTR.Alloc(mimeType)
            mimeType := pin.Value
        }

        result := ComCall(7, this, "ptr", xmlSource, "ptr", mimeType, "ptr*", &ppNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDocument2(ppNode)
    }
}
