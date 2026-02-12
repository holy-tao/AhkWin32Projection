#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The RadiusExtensionProcess function is an application-defined function and is called by NPS for each authentication or accounting packet that NPS receives from the network access server (NAS).
 * @remarks
 * If the return value is anything other than <b>NO_ERROR</b>, NPS discards the request.
 * 
 * NPS supports multiple Extension DLLs. NPS calls 
 * <b>RadiusExtensionProcess</b> for each of the DLLs listed in the registry. For more information see 
 * <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-setting-up-the-extension-and-authorization-dlls">Setting Up the Extension DLLs</a>.
 * 
 * The Extension DLL may export 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_ex">RadiusExtensionProcessEx</a> instead of 
 * <b>RadiusExtensionProcess</b>. The Extension DLL may export 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_2">RadiusExtensionProcess2</a>.
 * 
 * For more information on the use of this function, see <a href="https://docs.microsoft.com/windows/desktop/Nps/ias-authentication-and-authorization-process">NPS Extensions Process</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/authif/nc-authif-pradius_extension_process
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class PRADIUS_EXTENSION_PROCESS extends IUnknown {

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
     * @param {Pointer<RADIUS_ATTRIBUTE>} pAttrs 
     * @param {Pointer<Integer>} pfAction 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pAttrs, pfAction) {
        pfActionMarshal := pfAction is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pAttrs, pfActionMarshal, pfAction, "uint")
        return result
    }
}
