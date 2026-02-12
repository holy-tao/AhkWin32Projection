#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLNamespaceCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLNamespaceCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f6b8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLNamespaceCollection
     * @type {Guid}
     */
    static CLSID => Guid("{3050f6b9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "item", "add"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {IDispatch} 
     */
    item(index) {
        result := ComCall(8, this, "ptr", index, "ptr*", &ppNamespace := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppNamespace)
    }

    /**
     * Reserves the specified URL for non-administrator users and accounts.
     * @param {BSTR} bstrNamespace 
     * @param {BSTR} bstrUrn 
     * @param {VARIANT} implementationUrl 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Http/add-urlacl
     */
    add(bstrNamespace, bstrUrn, implementationUrl) {
        if(bstrNamespace is String) {
            pin := BSTR.Alloc(bstrNamespace)
            bstrNamespace := pin.Value
        }
        if(bstrUrn is String) {
            pin := BSTR.Alloc(bstrUrn)
            bstrUrn := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrNamespace, "ptr", bstrUrn, "ptr", implementationUrl, "ptr*", &ppNamespace := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppNamespace)
    }
}
