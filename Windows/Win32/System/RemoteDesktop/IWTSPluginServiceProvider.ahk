#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a way for Dynamic Virtual Channel plug-ins to query various Remote Desktop Client services.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtspluginserviceprovider
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSPluginServiceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSPluginServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{d3e07363-087c-476c-86a7-dbb15f46ddb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetService"]

    /**
     * Obtains the specified service.
     * @param {Guid} ServiceId Specifies the service to retrieve. This can be the following values.
     * @returns {IUnknown} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface that receives the service object.
     * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nf-tsvirtualchannels-iwtspluginserviceprovider-getservice
     */
    GetService(ServiceId) {
        result := ComCall(3, this, "ptr", ServiceId, "ptr*", &ppunkObject := 0, "HRESULT")
        return IUnknown(ppunkObject)
    }
}
