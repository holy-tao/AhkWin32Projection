#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfQueryEmbedded interface is implemented by the TSF manager and used by a text service to determine if a context can accept an embedded object.
 * @remarks
 * 
 * To obtain an instance of this interface, call the <b>ITfContext::QueryInterface</b> method with IID_ITfQueryEmbedded.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfqueryembedded
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfQueryEmbedded extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfQueryEmbedded
     * @type {Guid}
     */
    static IID => Guid("{0fab9bdb-d250-4169-84e5-6be118fdd7a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryInsertEmbedded"]

    /**
     * ITfQueryEmbedded::QueryInsertEmbedded method
     * @param {Pointer<Guid>} pguidService A GUID that identifies the service associated with the object. This value can be <b>NULL</b> if <i>pFormatEtc</i> is valid.
     * @param {Pointer<FORMATETC>} pFormatEtc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that contains data about the object to be embedded. This value can be <b>NULL</b> if <i>pguidService</i> is valid.
     * @returns {BOOL} Pointer to a Boolean value that receives the query result. This value receives a nonzero value if the object can be embedded, or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfqueryembedded-queryinsertembedded
     */
    QueryInsertEmbedded(pguidService, pFormatEtc) {
        result := ComCall(3, this, "ptr", pguidService, "ptr", pFormatEtc, "int*", &pfInsertable := 0, "HRESULT")
        return pfInsertable
    }
}
