#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a namespace on a WDS transport server.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespace
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportNamespace extends IDispatch{
    /**
     * The interface identifier for IWdsTransportNamespace
     * @type {Guid}
     */
    static IID => Guid("{fa561f57-fbef-4ed3-b056-127cb1b33b84}")

    /**
     * The class identifier for WdsTransportNamespace
     * @type {Guid}
     */
    static CLSID => Guid("{d8385768-0732-4ec1-95ea-16da581908a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        result := ComCall(7, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulId 
     * @returns {HRESULT} 
     */
    get_Id(pulId) {
        result := ComCall(8, this, "uint*", pulId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszName 
     * @returns {HRESULT} 
     */
    get_Name(pbszName) {
        result := ComCall(9, this, "ptr", pbszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bszName 
     * @returns {HRESULT} 
     */
    put_Name(bszName) {
        bszName := bszName is String ? BSTR.Alloc(bszName).Value : bszName

        result := ComCall(10, this, "ptr", bszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszFriendlyName 
     * @returns {HRESULT} 
     */
    get_FriendlyName(pbszFriendlyName) {
        result := ComCall(11, this, "ptr", pbszFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bszFriendlyName 
     * @returns {HRESULT} 
     */
    put_FriendlyName(bszFriendlyName) {
        bszFriendlyName := bszFriendlyName is String ? BSTR.Alloc(bszFriendlyName).Value : bszFriendlyName

        result := ComCall(12, this, "ptr", bszFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszDescription 
     * @returns {HRESULT} 
     */
    get_Description(pbszDescription) {
        result := ComCall(13, this, "ptr", pbszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bszDescription 
     * @returns {HRESULT} 
     */
    put_Description(bszDescription) {
        bszDescription := bszDescription is String ? BSTR.Alloc(bszDescription).Value : bszDescription

        result := ComCall(14, this, "ptr", bszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszContentProvider 
     * @returns {HRESULT} 
     */
    get_ContentProvider(pbszContentProvider) {
        result := ComCall(15, this, "ptr", pbszContentProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bszContentProvider 
     * @returns {HRESULT} 
     */
    put_ContentProvider(bszContentProvider) {
        bszContentProvider := bszContentProvider is String ? BSTR.Alloc(bszContentProvider).Value : bszContentProvider

        result := ComCall(16, this, "ptr", bszContentProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbszConfiguration 
     * @returns {HRESULT} 
     */
    get_Configuration(pbszConfiguration) {
        result := ComCall(17, this, "ptr", pbszConfiguration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bszConfiguration 
     * @returns {HRESULT} 
     */
    put_Configuration(bszConfiguration) {
        bszConfiguration := bszConfiguration is String ? BSTR.Alloc(bszConfiguration).Value : bszConfiguration

        result := ComCall(18, this, "ptr", bszConfiguration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRegistered 
     * @returns {HRESULT} 
     */
    get_Registered(pbRegistered) {
        result := ComCall(19, this, "ptr", pbRegistered, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbTombstoned 
     * @returns {HRESULT} 
     */
    get_Tombstoned(pbTombstoned) {
        result := ComCall(20, this, "ptr", pbTombstoned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pTombstoneTime 
     * @returns {HRESULT} 
     */
    get_TombstoneTime(pTombstoneTime) {
        result := ComCall(21, this, "double*", pTombstoneTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbTransmissionStarted 
     * @returns {HRESULT} 
     */
    get_TransmissionStarted(pbTransmissionStarted) {
        result := ComCall(22, this, "ptr", pbTransmissionStarted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Register() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bTerminateSessions 
     * @returns {HRESULT} 
     */
    Deregister(bTerminateSessions) {
        result := ComCall(24, this, "short", bTerminateSessions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportNamespace>} ppWdsTransportNamespaceClone 
     * @returns {HRESULT} 
     */
    Clone(ppWdsTransportNamespaceClone) {
        result := ComCall(25, this, "ptr", ppWdsTransportNamespaceClone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWdsTransportCollection>} ppWdsTransportContents 
     * @returns {HRESULT} 
     */
    RetrieveContents(ppWdsTransportContents) {
        result := ComCall(27, this, "ptr", ppWdsTransportContents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
