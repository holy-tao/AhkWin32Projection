#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingPortMappingCollection interface makes it possible for scripting languages such as VBScript and JScript to enumerate port mappings.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingportmappingcollection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingPortMappingCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetSharingPortMappingCollection
     * @type {Guid}
     */
    static IID => Guid("{02e4a2de-da20-4e34-89c8-ac22275a010b}")

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
     * The get__NewEnum method retrieves an enumerator for the port mapping collection.
     * @returns {IUnknown} Pointer to an interface pointer that, on successful return, receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * The get__Count method retrieves the number of items in the port mapping collection.
     * @returns {Integer} Pointer to a long variable that, on successful return, receives the number of items in the port mapping collection.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingcollection-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }
}
