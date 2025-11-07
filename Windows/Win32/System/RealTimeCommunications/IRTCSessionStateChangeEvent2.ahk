#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCSessionStateChangeEvent.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionStateChangeEvent2 extends IRTCSessionStateChangeEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionStateChangeEvent2
     * @type {Guid}
     */
    static IID => Guid("{4f933171-6f95-4880-80d9-2ec8d495d261}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaTypes", "get_RemotePreferredSecurityLevel", "get_IsForked", "GetRemoteSessionDescription"]

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaTypes() {
        result := ComCall(11, this, "int*", &pMediaTypes := 0, "HRESULT")
        return pMediaTypes
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @returns {Integer} 
     */
    get_RemotePreferredSecurityLevel(enSecurityType) {
        result := ComCall(12, this, "int", enSecurityType, "int*", &penSecurityLevel := 0, "HRESULT")
        return penSecurityLevel
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsForked() {
        result := ComCall(13, this, "short*", &pfIsForked := 0, "HRESULT")
        return pfIsForked
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContentType 
     * @param {Pointer<BSTR>} pbstrSessionDescription 
     * @returns {HRESULT} 
     */
    GetRemoteSessionDescription(pbstrContentType, pbstrSessionDescription) {
        result := ComCall(14, this, "ptr", pbstrContentType, "ptr", pbstrSessionDescription, "HRESULT")
        return result
    }
}
