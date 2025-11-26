#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Retrieves the CLSID identifying the handler to be used in the destination process during standard marshaling.
 * @remarks
 * 
 * An object that uses OLE's default implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> does not provide its own proxy but, by implementing <b>IStdMarshalInfo</b>, can nevertheless specify a handler to be loaded in the client process. Such a handler would typically handle certain requests in-process and use OLE's default marshaling to delegate others back to the original object.
 * 
 * To create an instance of an object in some client process, COM must first determine whether the object uses default marshaling or its own implementation. If the object uses default marshaling, COM then queries the object to determine whether it uses a special handler or, simply, OLE's default proxy. To get the CLSID of the handler to be loaded, COM queries the object for <b>IStdMarshalInfo</b> and then the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersist">IPersist</a> interface. If neither interface is supported, a standard handler is used.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-istdmarshalinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IStdMarshalInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStdMarshalInfo
     * @type {Guid}
     */
    static IID => Guid("{00000018-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClassForHandler"]

    /**
     * Retrieves the CLSID of the object handler to be used in the destination process during standard marshaling.
     * @param {Integer} dwDestContext The destination context, that is, the process in which the unmarshaling will be done. Possible values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a>.
     * @returns {Guid} A pointer to the handler's CLSID.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istdmarshalinfo-getclassforhandler
     */
    GetClassForHandler(dwDestContext) {
        static pvDestContext := 0 ;Reserved parameters must always be NULL

        pClsid := Guid()
        result := ComCall(3, this, "uint", dwDestContext, "ptr", pvDestContext, "ptr", pClsid, "HRESULT")
        return pClsid
    }
}
