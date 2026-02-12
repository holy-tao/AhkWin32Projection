#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\AutomationPeer.ahk
#Include ..\Provider\IRawElementProviderSimple.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutomationPeerProtected extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPeerProtected
     * @type {Guid}
     */
    static IID => Guid("{f4b40e52-642f-4629-a54a-ea5d2349c448}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PeerFromProvider", "ProviderFromPeer"]

    /**
     * 
     * @param {IRawElementProviderSimple} provider 
     * @returns {AutomationPeer} 
     */
    PeerFromProvider(provider) {
        result := ComCall(6, this, "ptr", provider, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(result_)
    }

    /**
     * 
     * @param {AutomationPeer} peer 
     * @returns {IRawElementProviderSimple} 
     */
    ProviderFromPeer(peer) {
        result := ComCall(7, this, "ptr", peer, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(result_)
    }
}
