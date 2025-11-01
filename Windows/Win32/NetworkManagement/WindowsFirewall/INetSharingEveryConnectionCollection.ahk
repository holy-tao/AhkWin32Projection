#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingEveryConnectionCollection interface makes it possible for scripting languages such as VBScript and JScript to enumerate all the connections in the connections folder.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingeveryconnectioncollection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingEveryConnectionCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetSharingEveryConnectionCollection
     * @type {Guid}
     */
    static IID => Guid("{33c4643c-7811-46fa-a89a-768597bd7223}")

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
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingeveryconnectioncollection-get__newenum
     */
    get__NewEnum(pVal) {
        result := ComCall(7, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingeveryconnectioncollection-get_count
     */
    get_Count(pVal) {
        result := ComCall(8, this, "int*", pVal, "HRESULT")
        return result
    }
}
