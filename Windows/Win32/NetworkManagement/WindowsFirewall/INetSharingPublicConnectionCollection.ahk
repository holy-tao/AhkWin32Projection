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
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingpublicconnectioncollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingpublicconnectioncollection-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }
}
