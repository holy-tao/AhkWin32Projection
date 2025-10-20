#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCSessionStateChangeEvent.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionStateChangeEvent2 extends IRTCSessionStateChangeEvent{
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
     * 
     * @param {Pointer<Int32>} pMediaTypes 
     * @returns {HRESULT} 
     */
    get_MediaTypes(pMediaTypes) {
        result := ComCall(11, this, "int*", pMediaTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @param {Pointer<Int32>} penSecurityLevel 
     * @returns {HRESULT} 
     */
    get_RemotePreferredSecurityLevel(enSecurityType, penSecurityLevel) {
        result := ComCall(12, this, "int", enSecurityType, "int*", penSecurityLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfIsForked 
     * @returns {HRESULT} 
     */
    get_IsForked(pfIsForked) {
        result := ComCall(13, this, "ptr", pfIsForked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContentType 
     * @param {Pointer<BSTR>} pbstrSessionDescription 
     * @returns {HRESULT} 
     */
    GetRemoteSessionDescription(pbstrContentType, pbstrSessionDescription) {
        result := ComCall(14, this, "ptr", pbstrContentType, "ptr", pbstrSessionDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
