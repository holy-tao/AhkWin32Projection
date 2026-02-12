#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnSystemHealth.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows access to the security health of the system device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnsystemhealth
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnSystemHealth extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnSystemHealth

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnSystemHealth.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a binary large object (blob) representing the Statement of Health. This is intended for use with [Network Access Protection](/windows/win32/nap/network-access-protection-start-page), which is no longer available as of Windows 10.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnsystemhealth.statementofhealth
     * @type {WinRTBuffer} 
     */
    StatementOfHealth {
        get => this.get_StatementOfHealth()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WinRTBuffer} 
     */
    get_StatementOfHealth() {
        if (!this.HasProp("__IVpnSystemHealth")) {
            if ((queryResult := this.QueryInterface(IVpnSystemHealth.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnSystemHealth := IVpnSystemHealth(outPtr)
        }

        return this.__IVpnSystemHealth.get_StatementOfHealth()
    }

;@endregion Instance Methods
}
