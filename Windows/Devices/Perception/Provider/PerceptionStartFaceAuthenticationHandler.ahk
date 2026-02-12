#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Invoked when a PerceptionFaceAuthenticationGroup enters Face Authentication mode.
 * @remarks
 * All members of the PerceptionFaceAuthenticationGroup are expected to adjust any settings to fully support Face Authentication such as contrast or exposure on the device underlying the IPerceptionFrameProvider members. The handler returns whether or not all members are ready to preform Face Authentication.
 * 
 * If the handler returns true, all members are expected to remain in this mode until the PerceptionStopFaceAuthenticationHandler associated with the group is invoked.
 * 
 * If the handler returns false, the IPerceptionFrameProvider(s) isn't used for face authentication.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionstartfaceauthenticationhandler
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionStartFaceAuthenticationHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for PerceptionStartFaceAuthenticationHandler
     * @type {Guid}
     */
    static IID => Guid("{74816d2a-2090-4670-8c48-ef39e7ff7c26}")

    /**
     * The class identifier for PerceptionStartFaceAuthenticationHandler
     * @type {Guid}
     */
    static CLSID => Guid("{74816d2a-2090-4670-8c48-ef39e7ff7c26}")

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
     * @param {PerceptionFaceAuthenticationGroup} sender 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender) {
        result := ComCall(3, this, "ptr", sender, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
