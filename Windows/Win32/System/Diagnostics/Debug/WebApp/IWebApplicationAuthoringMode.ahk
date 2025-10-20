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
     * 
     * @param {Pointer<BSTR>} designModeDllPath 
     * @returns {HRESULT} 
     */
    get_AuthoringClientBinary(designModeDllPath) {
        result := ComCall(4, this, "ptr", designModeDllPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
