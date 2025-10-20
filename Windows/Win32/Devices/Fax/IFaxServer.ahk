#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxServer interface describes a messaging collection that is used by a fax client application to manage a connection to the fax service.
 * @remarks
 * 
  * A default implementation of <b>IFaxServer</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver">FaxServer</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxserver
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxServer extends IDispatch{
    /**
     * The interface identifier for IFaxServer
     * @type {Guid}
     */
    static IID => Guid("{475b6469-90a5-4878-a577-17a86e8e3462}")

    /**
     * The class identifier for FaxServer
     * @type {Guid}
     */
    static CLSID => Guid("{cda8acb0-8cf5-4f6c-9ba2-5931d40c8cae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @returns {HRESULT} 
     */
    Connect(bstrServerName) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(7, this, "ptr", bstrServerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrServerName 
     * @returns {HRESULT} 
     */
    get_ServerName(pbstrServerName) {
        result := ComCall(8, this, "ptr", pbstrServerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxDeviceProviders>} ppFaxDeviceProviders 
     * @returns {HRESULT} 
     */
    GetDeviceProviders(ppFaxDeviceProviders) {
        result := ComCall(9, this, "ptr", ppFaxDeviceProviders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxDevices>} ppFaxDevices 
     * @returns {HRESULT} 
     */
    GetDevices(ppFaxDevices) {
        result := ComCall(10, this, "ptr", ppFaxDevices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxInboundRouting>} ppFaxInboundRouting 
     * @returns {HRESULT} 
     */
    get_InboundRouting(ppFaxInboundRouting) {
        result := ComCall(11, this, "ptr", ppFaxInboundRouting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxFolders>} pFaxFolders 
     * @returns {HRESULT} 
     */
    get_Folders(pFaxFolders) {
        result := ComCall(12, this, "ptr", pFaxFolders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxLoggingOptions>} ppFaxLoggingOptions 
     * @returns {HRESULT} 
     */
    get_LoggingOptions(ppFaxLoggingOptions) {
        result := ComCall(13, this, "ptr", ppFaxLoggingOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMajorVersion 
     * @returns {HRESULT} 
     */
    get_MajorVersion(plMajorVersion) {
        result := ComCall(14, this, "int*", plMajorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMinorVersion 
     * @returns {HRESULT} 
     */
    get_MinorVersion(plMinorVersion) {
        result := ComCall(15, this, "int*", plMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMajorBuild 
     * @returns {HRESULT} 
     */
    get_MajorBuild(plMajorBuild) {
        result := ComCall(16, this, "int*", plMajorBuild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMinorBuild 
     * @returns {HRESULT} 
     */
    get_MinorBuild(plMinorBuild) {
        result := ComCall(17, this, "int*", plMinorBuild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbDebug 
     * @returns {HRESULT} 
     */
    get_Debug(pbDebug) {
        result := ComCall(18, this, "ptr", pbDebug, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxActivity>} ppFaxActivity 
     * @returns {HRESULT} 
     */
    get_Activity(ppFaxActivity) {
        result := ComCall(19, this, "ptr", ppFaxActivity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxOutboundRouting>} ppFaxOutboundRouting 
     * @returns {HRESULT} 
     */
    get_OutboundRouting(ppFaxOutboundRouting) {
        result := ComCall(20, this, "ptr", ppFaxOutboundRouting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxReceiptOptions>} ppFaxReceiptOptions 
     * @returns {HRESULT} 
     */
    get_ReceiptOptions(ppFaxReceiptOptions) {
        result := ComCall(21, this, "ptr", ppFaxReceiptOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxSecurity>} ppFaxSecurity 
     * @returns {HRESULT} 
     */
    get_Security(ppFaxSecurity) {
        result := ComCall(22, this, "ptr", ppFaxSecurity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {Pointer<VARIANT>} pvProperty 
     * @returns {HRESULT} 
     */
    GetExtensionProperty(bstrGUID, pvProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(24, this, "ptr", bstrGUID, "ptr", pvProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {VARIANT} vProperty 
     * @returns {HRESULT} 
     */
    SetExtensionProperty(bstrGUID, vProperty) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID

        result := ComCall(25, this, "ptr", bstrGUID, "ptr", vProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventTypes 
     * @returns {HRESULT} 
     */
    ListenToServerEvents(EventTypes) {
        result := ComCall(26, this, "int", EventTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGUID 
     * @param {BSTR} bstrFriendlyName 
     * @param {BSTR} bstrImageName 
     * @param {BSTR} TspName 
     * @param {Integer} lFSPIVersion 
     * @returns {HRESULT} 
     */
    RegisterDeviceProvider(bstrGUID, bstrFriendlyName, bstrImageName, TspName, lFSPIVersion) {
        bstrGUID := bstrGUID is String ? BSTR.Alloc(bstrGUID).Value : bstrGUID
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName
        bstrImageName := bstrImageName is String ? BSTR.Alloc(bstrImageName).Value : bstrImageName
        TspName := TspName is String ? BSTR.Alloc(TspName).Value : TspName

        result := ComCall(27, this, "ptr", bstrGUID, "ptr", bstrFriendlyName, "ptr", bstrImageName, "ptr", TspName, "int", lFSPIVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUniqueName 
     * @returns {HRESULT} 
     */
    UnregisterDeviceProvider(bstrUniqueName) {
        bstrUniqueName := bstrUniqueName is String ? BSTR.Alloc(bstrUniqueName).Value : bstrUniqueName

        result := ComCall(28, this, "ptr", bstrUniqueName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrExtensionName 
     * @param {BSTR} bstrFriendlyName 
     * @param {BSTR} bstrImageName 
     * @param {VARIANT} vMethods 
     * @returns {HRESULT} 
     */
    RegisterInboundRoutingExtension(bstrExtensionName, bstrFriendlyName, bstrImageName, vMethods) {
        bstrExtensionName := bstrExtensionName is String ? BSTR.Alloc(bstrExtensionName).Value : bstrExtensionName
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName
        bstrImageName := bstrImageName is String ? BSTR.Alloc(bstrImageName).Value : bstrImageName

        result := ComCall(29, this, "ptr", bstrExtensionName, "ptr", bstrFriendlyName, "ptr", bstrImageName, "ptr", vMethods, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrExtensionUniqueName 
     * @returns {HRESULT} 
     */
    UnregisterInboundRoutingExtension(bstrExtensionUniqueName) {
        bstrExtensionUniqueName := bstrExtensionUniqueName is String ? BSTR.Alloc(bstrExtensionUniqueName).Value : bstrExtensionUniqueName

        result := ComCall(30, this, "ptr", bstrExtensionUniqueName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pEventTypes 
     * @returns {HRESULT} 
     */
    get_RegisteredEvents(pEventTypes) {
        result := ComCall(31, this, "int*", pEventTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAPIVersion 
     * @returns {HRESULT} 
     */
    get_APIVersion(pAPIVersion) {
        result := ComCall(32, this, "int*", pAPIVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
