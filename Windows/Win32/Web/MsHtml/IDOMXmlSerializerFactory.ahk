#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMXmlSerializerFactory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMXmlSerializerFactory
     * @type {Guid}
     */
    static IID => Guid("{3051077f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["create"]

    /**
     * 
     * @param {Pointer<IDOMXmlSerializer>} __MIDL__IDOMXmlSerializerFactory0000 
     * @returns {HRESULT} 
     */
    create(__MIDL__IDOMXmlSerializerFactory0000) {
        result := ComCall(7, this, "ptr*", __MIDL__IDOMXmlSerializerFactory0000, "HRESULT")
        return result
    }
}
