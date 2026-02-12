#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\NetworkOperatorTetheringManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class INetworkOperatorTetheringManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkOperatorTetheringManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{5b235412-35f0-49e7-9b08-16d278fbaa42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTetheringCapabilityFromConnectionProfile", "CreateFromConnectionProfile"]

    /**
     * 
     * @param {ConnectionProfile} profile_ 
     * @returns {Integer} 
     */
    GetTetheringCapabilityFromConnectionProfile(profile_) {
        result := ComCall(6, this, "ptr", profile_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {ConnectionProfile} profile_ 
     * @returns {NetworkOperatorTetheringManager} 
     */
    CreateFromConnectionProfile(profile_) {
        result := ComCall(7, this, "ptr", profile_, "ptr*", &ppManager := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkOperatorTetheringManager(ppManager)
    }
}
