#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMDeviceActivator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMMDeviceActivator
     * @type {Guid}
     */
    static IID => Guid("{3b0d0ea4-d0a9-4b0e-935b-09516746fac0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate"]

    /**
     * The ActivateActCtx function activates the specified activation context.
     * @remarks
     * The <i>lpCookie</i> parameter is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-deactivateactctx">DeactivateActCtx</a>, which verifies the pairing of calls to 
     * <b>ActivateActCtx</b> and 
     * <b>DeactivateActCtx</b> and ensures that the appropriate activation context is being deactivated. This is done because the deactivation of activation contexts must occur in the reverse order of activation.
     * 
     * The activation of activation contexts can be understood as pushing an activation context onto a stack of activation contexts. The activation context you activate through this function  redirects any binding to DLLs, window classes, COM servers, type libraries, and mutexes for any side-by-side APIs you call.
     * 
     * The top item of an activation context stack is the active, default-activation context of the current thread. If a null activation context handle is pushed onto the stack, thereby activating it, the default settings in the original manifest override all activation contexts that are lower on the stack.
     * @param {Pointer<Guid>} iid 
     * @param {IMMDevice} pDevice 
     * @param {Pointer<PROPVARIANT>} pActivationParams 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-activateactctx
     */
    Activate(iid, pDevice, pActivationParams) {
        result := ComCall(3, this, "ptr", iid, "ptr", pDevice, "ptr", pActivationParams, "ptr*", &ppInterface := 0, "HRESULT")
        return ppInterface
    }
}
