#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITPluggableTerminalSuperclassInfo interface exposes methods that get the name and CLSID of a pluggable terminal class.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itpluggableterminalsuperclassinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITPluggableTerminalSuperclassInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITPluggableTerminalSuperclassInfo
     * @type {Guid}
     */
    static IID => Guid("{6d54e42c-4625-4359-a6f7-631999107e05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_CLSID"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalsuperclassinfo-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalsuperclassinfo-get_clsid
     */
    get_CLSID() {
        pCLSID := BSTR()
        result := ComCall(8, this, "ptr", pCLSID, "HRESULT")
        return pCLSID
    }
}
