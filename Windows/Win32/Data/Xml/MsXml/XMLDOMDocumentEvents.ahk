#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XMLDOMDocumentEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for XMLDOMDocumentEvents
     * @type {Guid}
     */
    static IID => Guid("{3efaa427-272f-11d2-836f-0000f87a7782}")

    /**
     * The class identifier for XMLDOMDocumentEvents
     * @type {Guid}
     */
    static CLSID => Guid("{3efaa427-272f-11d2-836f-0000f87a7782}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
