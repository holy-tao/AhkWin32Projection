#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnChannel6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnChannel6
     * @type {Guid}
     */
    static IID => Guid("{55843696-bd63-49c5-abca-5da77885551a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateForeground"]

    /**
     * 
     * @param {HSTRING} packageRelativeAppId 
     * @param {ValueSet} sharedContext 
     * @returns {ValueSet} 
     */
    ActivateForeground(packageRelativeAppId, sharedContext) {
        if(packageRelativeAppId is String) {
            pin := HSTRING.Create(packageRelativeAppId)
            packageRelativeAppId := pin.Value
        }
        packageRelativeAppId := packageRelativeAppId is Win32Handle ? NumGet(packageRelativeAppId, "ptr") : packageRelativeAppId

        result := ComCall(6, this, "ptr", packageRelativeAppId, "ptr", sharedContext, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(result_)
    }
}
