#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingPublicConnectionCollection interface makes it possible for scripting languages such as VBScript and JScript to enumerate public connections.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingpublicconnectioncollection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingPublicConnectionCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetSharingPublicConnectionCollection
     * @type {Guid}
     */
    static IID => Guid("{7d7a6355-f372-4971-a149-bfc927be762a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Count"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * The get__NewEnum method retrieves an enumerator for the public connections collection.
     * @returns {IUnknown} Pointer to an interface pointer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingpublicconnectioncollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * The get_Count method retrieves the number of items in the public connections collection.
     * @returns {Integer} Pointer to a <b>long</b> variable that receives the number of items in the public connections collection.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingpublicconnectioncollection-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }
}
