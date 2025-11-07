#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about the completion of an installation and acts as a parameter to the IInstallationCompletedCallback delegate. The download and installation of the update is asynchronous.
 * @remarks
 * 
 * The <b>IInstallationCompletedCallbackArgs</b> interface is reserved for future use. It  has no properties or methods.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationcompletedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationCompletedCallbackArgs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInstallationCompletedCallbackArgs
     * @type {Guid}
     */
    static IID => Guid("{250e2106-8efb-4705-9653-ef13c581b6a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
