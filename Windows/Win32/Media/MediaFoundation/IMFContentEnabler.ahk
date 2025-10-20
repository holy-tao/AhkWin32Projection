#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements one step that must be performed for the user to access media content.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfcontentenabler
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentEnabler extends IUnknown{
    /**
     * The interface identifier for IMFContentEnabler
     * @type {Guid}
     */
    static IID => Guid("{d3c4ef59-49ce-4381-9071-d5bcd044c770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pType 
     * @returns {HRESULT} 
     */
    GetEnableType(pType) {
        result := ComCall(3, this, "ptr", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszURL 
     * @param {Pointer<UInt32>} pcchURL 
     * @param {Pointer<Int32>} pTrustStatus 
     * @returns {HRESULT} 
     */
    GetEnableURL(ppwszURL, pcchURL, pTrustStatus) {
        result := ComCall(4, this, "ptr", ppwszURL, "uint*", pcchURL, "int*", pTrustStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppbData 
     * @param {Pointer<UInt32>} pcbData 
     * @returns {HRESULT} 
     */
    GetEnableData(ppbData, pcbData) {
        result := ComCall(5, this, "char*", ppbData, "uint*", pcbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAutomatic 
     * @returns {HRESULT} 
     */
    IsAutomaticSupported(pfAutomatic) {
        result := ComCall(6, this, "ptr", pfAutomatic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AutomaticEnable() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MonitorEnable() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
