#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class AttestationChallengeHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AttestationChallengeHandler
     * @type {Guid}
     */
    static IID => Guid("{f6ae35b0-d805-587d-944f-a09bd032acf5}")

    /**
     * The class identifier for AttestationChallengeHandler
     * @type {Guid}
     */
    static CLSID => Guid("{f6ae35b0-d805-587d-944f-a09bd032acf5}")

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
     * @param {IBuffer} challenge 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(challenge) {
        result := ComCall(3, this, "ptr", challenge, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(result_)
    }
}
