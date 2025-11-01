#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IStream.ahk

/**
 * Provides additional information about the marshaling context to custom-marshaled objects and unmarshalers.
 * @remarks
 * 
  * Implement <b>IMarshalingStream</b> interface if you have <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> implementations that call the marshaling APIs and provide the correct value of any of the attributes. This is essential only for <b>IStream</b> implementations that are used in hybrid policy processes.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-imarshalingstream
 * @namespace Windows.Win32.System.Com.Marshal
 * @version v4.0.30319
 */
class IMarshalingStream extends IStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMarshalingStream
     * @type {Guid}
     */
    static IID => Guid("{d8f2f5e6-6102-4863-9f26-389a4676efde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMarshalingContextAttribute"]

    /**
     * 
     * @param {Integer} attribute 
     * @param {Pointer<Pointer>} pAttributeValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-imarshalingstream-getmarshalingcontextattribute
     */
    GetMarshalingContextAttribute(attribute, pAttributeValue) {
        pAttributeValueMarshal := pAttributeValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "int", attribute, pAttributeValueMarshal, pAttributeValue, "HRESULT")
        return result
    }
}
