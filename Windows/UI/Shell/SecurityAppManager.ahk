#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecurityAppManager.ahk
#Include ..\..\..\Guid.ahk

/**
 * No description.
 * @remarks
 * > [!NOTE]
 * > `SecurityApp*` APIs provided functionality for [Microsoft Edge Legacy](https://support.microsoft.com/microsoft-edge/what-is-microsoft-edge-legacy-3e779e55-4c55-08e6-ecc8-2333768c0fb0). Support for Microsoft Edge Legacy has ended on March 9, 2021, so these APIs are no longer supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.securityappmanager
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class SecurityAppManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecurityAppManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecurityAppManager.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * No description.
     * @remarks
     * > [!NOTE]
     * > `SecurityApp*` APIs provided functionality for [Microsoft Edge Legacy](https://support.microsoft.com/microsoft-edge/what-is-microsoft-edge-legacy-3e779e55-4c55-08e6-ecc8-2333768c0fb0). Support for Microsoft Edge Legacy has ended on March 9, 2021, so these APIs are no longer supported.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.SecurityAppManager")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * No description.
     * @remarks
     * > [!NOTE]
     * > `SecurityApp*` APIs provided functionality for [Microsoft Edge Legacy](https://support.microsoft.com/microsoft-edge/what-is-microsoft-edge-legacy-3e779e55-4c55-08e6-ecc8-2333768c0fb0). Support for Microsoft Edge Legacy has ended on March 9, 2021, so these APIs are no longer supported.
     * @param {Integer} kind No description.
     * @param {HSTRING} displayName No description.
     * @param {Uri} detailsUri No description.
     * @param {Boolean} registerPerUser No description.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.securityappmanager.register
     */
    Register(kind, displayName, detailsUri, registerPerUser) {
        if (!this.HasProp("__ISecurityAppManager")) {
            if ((queryResult := this.QueryInterface(ISecurityAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecurityAppManager := ISecurityAppManager(outPtr)
        }

        return this.__ISecurityAppManager.Register(kind, displayName, detailsUri, registerPerUser)
    }

    /**
     * No description.
     * @remarks
     * > [!NOTE]
     * > `SecurityApp*` APIs provided functionality for [Microsoft Edge Legacy](https://support.microsoft.com/microsoft-edge/what-is-microsoft-edge-legacy-3e779e55-4c55-08e6-ecc8-2333768c0fb0). Support for Microsoft Edge Legacy has ended on March 9, 2021, so these APIs are no longer supported.
     * @param {Integer} kind No description.
     * @param {Guid} guidRegistration No description.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.securityappmanager.unregister
     */
    Unregister(kind, guidRegistration) {
        if (!this.HasProp("__ISecurityAppManager")) {
            if ((queryResult := this.QueryInterface(ISecurityAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecurityAppManager := ISecurityAppManager(outPtr)
        }

        return this.__ISecurityAppManager.Unregister(kind, guidRegistration)
    }

    /**
     * No description.
     * @remarks
     * > [!NOTE]
     * > `SecurityApp*` APIs provided functionality for [Microsoft Edge Legacy](https://support.microsoft.com/microsoft-edge/what-is-microsoft-edge-legacy-3e779e55-4c55-08e6-ecc8-2333768c0fb0). Support for Microsoft Edge Legacy has ended on March 9, 2021, so these APIs are no longer supported.
     * @param {Integer} kind No description.
     * @param {Guid} guidRegistration No description.
     * @param {Integer} state No description.
     * @param {Integer} substatus No description.
     * @param {Uri} detailsUri No description.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.securityappmanager.updatestate
     */
    UpdateState(kind, guidRegistration, state, substatus, detailsUri) {
        if (!this.HasProp("__ISecurityAppManager")) {
            if ((queryResult := this.QueryInterface(ISecurityAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecurityAppManager := ISecurityAppManager(outPtr)
        }

        return this.__ISecurityAppManager.UpdateState(kind, guidRegistration, state, substatus, detailsUri)
    }

;@endregion Instance Methods
}
