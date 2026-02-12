#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLXMLHttpRequest.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLXMLHttpRequestFactory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLXMLHttpRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{3051040c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLXMLHttpRequestFactory
     * @type {Guid}
     */
    static CLSID => Guid("{3051040d-98b5-11cf-bb82-00aa00bdce0b}")

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
     * createBlob Method (SQLServerConnection)
     * @remarks
     * This createBlob method is specified by the createBlob method in the java.sql.Connection interface.  
     *   
     *  This method replaces the need for [SQLServerBlob Constructor &#40;SQLServerConnection, byte&#41;](../../../connect/jdbc/reference/sqlserverblob-constructor-sqlserverconnection-byte.md).
     * @returns {IHTMLXMLHttpRequest} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/createblob-method-sqlserverconnection
     */
    create() {
        result := ComCall(7, this, "ptr*", &__MIDL__IHTMLXMLHttpRequestFactory0000 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLXMLHttpRequest(__MIDL__IHTMLXMLHttpRequestFactory0000)
    }
}
