#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\NetworkOperatorTetheringManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class INetworkOperatorTetheringManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkOperatorTetheringManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{8fdaadb6-4af9-4f21-9b58-d53e9f24231e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromConnectionProfileWithTargetAdapter"]

    /**
     * 
     * @param {ConnectionProfile} profile_ 
     * @param {NetworkAdapter} adapter_ 
     * @returns {NetworkOperatorTetheringManager} 
     */
    CreateFromConnectionProfileWithTargetAdapter(profile_, adapter_) {
        result := ComCall(6, this, "ptr", profile_, "ptr", adapter_, "ptr*", &ppManager := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkOperatorTetheringManager(ppManager)
    }
}
