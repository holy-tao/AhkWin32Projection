#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQDestination extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQDestination
     * @type {Guid}
     */
    static IID => Guid("{eba96b16-2168-11d3-898c-00e02c074f6b}")

    /**
     * The class identifier for MSMQDestination
     * @type {Guid}
     */
    static CLSID => Guid("{eba96b18-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "get_IsOpen", "get_IADs", "putref_IADs", "get_ADsPath", "put_ADsPath", "get_PathName", "put_PathName", "get_FormatName", "put_FormatName", "get_Destinations", "putref_Destinations", "get_Properties"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Open() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfIsOpen 
     * @returns {HRESULT} 
     */
    get_IsOpen(pfIsOpen) {
        result := ComCall(9, this, "ptr", pfIsOpen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppIADs 
     * @returns {HRESULT} 
     */
    get_IADs(ppIADs) {
        result := ComCall(10, this, "ptr*", ppIADs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pIADs 
     * @returns {HRESULT} 
     */
    putref_IADs(pIADs) {
        result := ComCall(11, this, "ptr", pIADs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrADsPath 
     * @returns {HRESULT} 
     */
    get_ADsPath(pbstrADsPath) {
        result := ComCall(12, this, "ptr", pbstrADsPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrADsPath 
     * @returns {HRESULT} 
     */
    put_ADsPath(bstrADsPath) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(13, this, "ptr", bstrADsPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPathName 
     * @returns {HRESULT} 
     */
    get_PathName(pbstrPathName) {
        result := ComCall(14, this, "ptr", pbstrPathName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPathName 
     * @returns {HRESULT} 
     */
    put_PathName(bstrPathName) {
        bstrPathName := bstrPathName is String ? BSTR.Alloc(bstrPathName).Value : bstrPathName

        result := ComCall(15, this, "ptr", bstrPathName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFormatName 
     * @returns {HRESULT} 
     */
    get_FormatName(pbstrFormatName) {
        result := ComCall(16, this, "ptr", pbstrFormatName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFormatName 
     * @returns {HRESULT} 
     */
    put_FormatName(bstrFormatName) {
        bstrFormatName := bstrFormatName is String ? BSTR.Alloc(bstrFormatName).Value : bstrFormatName

        result := ComCall(17, this, "ptr", bstrFormatName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDestinations 
     * @returns {HRESULT} 
     */
    get_Destinations(ppDestinations) {
        result := ComCall(18, this, "ptr*", ppDestinations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pDestinations 
     * @returns {HRESULT} 
     */
    putref_Destinations(pDestinations) {
        result := ComCall(19, this, "ptr", pDestinations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(20, this, "ptr*", ppcolProperties, "HRESULT")
        return result
    }
}
