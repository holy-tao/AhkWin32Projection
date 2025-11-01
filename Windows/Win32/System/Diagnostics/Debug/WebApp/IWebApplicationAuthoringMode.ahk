#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IServiceProvider.ahk

/**
 * Provides the full local path to the authoring binary to be loaded into the WWAHost process.
 * @see https://docs.microsoft.com/windows/win32/api//webapplication/nn-webapplication-iwebapplicationauthoringmode
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 * @version v4.0.30319
 */
class IWebApplicationAuthoringMode extends IServiceProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebApplicationAuthoringMode
     * @type {Guid}
     */
    static IID => Guid("{720aea93-1964-4db0-b005-29eb9e2b18a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AuthoringClientBinary"]

    /**
     * 
     * @param {Pointer<BSTR>} designModeDllPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationauthoringmode-get_authoringclientbinary
     */
    get_AuthoringClientBinary(designModeDllPath) {
        result := ComCall(4, this, "ptr", designModeDllPath, "HRESULT")
        return result
    }
}
