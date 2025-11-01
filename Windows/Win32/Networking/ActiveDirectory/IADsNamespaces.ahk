#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsNamespaces interface is implemented by the ADs provider and is used for managing namespace objects.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsnamespaces
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsNamespaces extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsNamespaces
     * @type {Guid}
     */
    static IID => Guid("{28b96ba0-b330-11cf-a9ad-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultContainer", "put_DefaultContainer"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_DefaultContainer(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDefaultContainer 
     * @returns {HRESULT} 
     */
    put_DefaultContainer(bstrDefaultContainer) {
        bstrDefaultContainer := bstrDefaultContainer is String ? BSTR.Alloc(bstrDefaultContainer).Value : bstrDefaultContainer

        result := ComCall(21, this, "ptr", bstrDefaultContainer, "HRESULT")
        return result
    }
}
