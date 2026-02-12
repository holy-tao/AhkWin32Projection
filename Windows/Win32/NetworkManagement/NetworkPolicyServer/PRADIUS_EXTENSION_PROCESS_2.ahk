#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An application defined-function and is called by NPS for each authentication or accounting packet that NPS receives.
 * @remarks
 * If the return value is anything other than <b>NO_ERROR</b>, NPS discards the request.
 * 
 * The following attributes are read-only. Extension DLLs that implement <i>RadiusExtensionProcess2</i> cannot add, modify, or remove  these attributes within a request or response contained in a <a href="https://docs.microsoft.com/windows/desktop/api/authif/ns-authif-radius_extension_control_block">RADIUS_EXTENSION_CONTROL_BLOCK</a>.
 * 
 * <ul>
 * <li><b>ratCode</b></li>
 * <li><b>ratIdentifier</b></li>
 * <li><b>ratAuthenticator</b></li>
 * <li><b>ratSrcIPAddress</b></li>
 * <li><b>ratSrcPort</b></li>
 * <li><b>ratProvider</b></li>
 * <li><b>ratUniqueId</b></li>
 * <li><b>ratSrcIPv6Address</b></li>
 * </ul>
 * NPS supports multiple Extension DLLs. NPS calls 
 * <i>RadiusExtensionProcess2</i> for each of the DLLs listed in the registry. For more information see 
 * <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-setting-up-the-extension-and-authorization-dlls">Setting Up the Extension  DLLs</a>.
 * 
 * NPS Extension DLLs that export 
 * <i>RadiusExtensionProcess2</i> do not need to export 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_free_attributes">RadiusExtensionFreeAttributes</a>.
 * 
 * For more information on the use of this function, see <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-authentication-and-authorization-process">NPS Extensions Process</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/authif/nc-authif-pradius_extension_process_2
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class PRADIUS_EXTENSION_PROCESS_2 extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<RADIUS_EXTENSION_CONTROL_BLOCK>} pECB 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pECB) {
        result := ComCall(3, this, "ptr", pECB, "uint")
        return result
    }
}
