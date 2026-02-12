#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementNamespaceFactoryCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementNamespaceFactoryCallback
     * @type {Guid}
     */
    static IID => Guid("{3050f7fd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Resolve"]

    /**
     * Locates the target function of the specified import and replaces the function pointer in the import thunk with the target of the function implementation.
     * @param {BSTR} bstrNamespace 
     * @param {BSTR} bstrTagName 
     * @param {BSTR} bstrAttrs 
     * @param {IElementNamespace} pNamespace 
     * @returns {HRESULT} The address of the import, or the failure stub for it.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DevNotes/resolvedelayloadedapi
     */
    Resolve(bstrNamespace, bstrTagName, bstrAttrs, pNamespace) {
        if(bstrNamespace is String) {
            pin := BSTR.Alloc(bstrNamespace)
            bstrNamespace := pin.Value
        }
        if(bstrTagName is String) {
            pin := BSTR.Alloc(bstrTagName)
            bstrTagName := pin.Value
        }
        if(bstrAttrs is String) {
            pin := BSTR.Alloc(bstrAttrs)
            bstrAttrs := pin.Value
        }

        result := ComCall(3, this, "ptr", bstrNamespace, "ptr", bstrTagName, "ptr", bstrAttrs, "ptr", pNamespace, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
