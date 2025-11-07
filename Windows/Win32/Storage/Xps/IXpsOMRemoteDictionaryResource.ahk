#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMDictionary.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides an interface that enables pages in an XPS package to share resources.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomremotedictionaryresource
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMRemoteDictionaryResource extends IXpsOMResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMRemoteDictionaryResource
     * @type {Guid}
     */
    static IID => Guid("{c9bd7cd4-e16a-4bf8-8c84-c950af7a3061}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDictionary", "SetDictionary"]

    /**
     * 
     * @returns {IXpsOMDictionary} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomremotedictionaryresource-getdictionary
     */
    GetDictionary() {
        result := ComCall(5, this, "ptr*", &dictionary := 0, "HRESULT")
        return IXpsOMDictionary(dictionary)
    }

    /**
     * 
     * @param {IXpsOMDictionary} dictionary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomremotedictionaryresource-setdictionary
     */
    SetDictionary(dictionary) {
        result := ComCall(6, this, "ptr", dictionary, "HRESULT")
        return result
    }
}
